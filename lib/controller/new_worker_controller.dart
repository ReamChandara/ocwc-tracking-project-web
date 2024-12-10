// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tracking_web/controller/home_controller.dart';
import 'package:tracking_web/controller/scanner_controller.dart';
import 'package:tracking_web/widget/dialog_widget.dart';
import '../config/constant/api_constant.dart';
import '../config/routes/app_route.dart';
import '../models/validation_message.dart';
import '../models/worker_models.dart';

class NewWorkerController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  ScannerController scannerController = Get.put(ScannerController());
  WorkerModel? workerModel;
  WorkerData? workerData;
  int falseIndex = 0;
  bool loading = true;
  String param = "";

  RxBool cloudFlare = false.obs;

  Future<void> verifyCloudFlare(String token) async {
    await Future.delayed(const Duration(seconds: 1)).whenComplete(
      () => token != '' ? cloudFlare.value = true : cloudFlare.value = false,
    );
  }

  List<String> prefixCodes = [
    "KH-MOU",
    "KH-BMC",
    "KH-BTB",
    "TH-NV",
  ];
  RxString prefixCodeSelected = "".obs;
  void onChange(String value) {
    prefixCodeSelected.value = value;
  }

  void searchWorkByQr({
    String data = "no param",
  }) async {
    String apiUrl = baseUrl + searchWorkerQr;
    Map<String, String> body = {"qr_code": data};

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers(homeController.langCode.value),
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      workerData = WorkerData.fromJson(
        jsonDecode(response.body)["data"],
      );
      loading = false;
      update();
    } else if (response.statusCode == 422) {
      workerData = null;
      loading = false;
      update();
    } else if (response.statusCode == 404) {
      workerData = null;
      loading = false;
      update();
    }
  }

  dialogShowImage(
      {required BuildContext context,
      required dynamic path,
      required String langCode}) {
    Alert(
        style: AlertStyle(
          titleStyle: TextStyle(
            fontFamily:
                langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
          ),
          descStyle: TextStyle(
            fontFamily:
                langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
          ),
          descPadding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          animationType: AnimationType.grow,
          overlayColor: Colors.grey.shade100.withOpacity(0.9),
        ),
        image: Padding(
          padding: const EdgeInsets.all(10),
          child: FlipCard(
              fill: Fill
                  .fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              side: CardSide.BACK, // The side to initially display.
              front: SizedBox(
                width: 450,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/images/ocwc_card.png"),
                ),
              ),
              back: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200)),
                width: 450,
                child: ClipRRect(
                  child: Image.network(path),
                ),
              )),
        ),
        context: context,
        buttons: [
          DialogButton(
              color: const Color.fromARGB(255, 71, 122, 211),
              child: Text(
                "close".tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily:
                      langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
                ),
              ),
              onPressed: () {
                Get.back();
              })
        ]).show();
  }

  void showImageCard(BuildContext context, String langCode) async {
    String apiUrl = "$baseUrl$cardImage${workerData!.hashcode}";
    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers(langCode),
      );
      if (response.statusCode == 200) {
        Get.back();
        if (context.mounted) {
          dialogShowImage(
            context: context,
            path: response.body,
            langCode: langCode,
          );
        }
      } else {
        if (context.mounted) {
          DialogWidget.showWarningDialog(
            context: context,
            des: "something went wrong",
          );
        }
      }
    } catch (e) {
      Get.back();
    }
  }

  void findWorkerByNumberCard(BuildContext context, String number,
      {String langCode = "en"}) async {
    try {
      String apiUrl = baseUrl + findWorkerNumberCard;
      var body = {"number": number};
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers(langCode),
        body: jsonEncode(body),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        Get.back();
        workerData = WorkerData.fromJson(
          jsonDecode(response.body)["data"],
        );
        // Get.toNamed(Routes.detail, parameters: {"id": workerData!.hashcode});
        RouteView.detail.go(parameters: {"id": workerData!.hashcode});
        loading = false;
        update();
      } else if (response.statusCode == 400) {
        Get.back();
        if (context.mounted) {
          DialogWidget.showDialog(context,
              jsonDecode(response.body)["errors"]["message"], langCode);
        }
      } else if (response.statusCode == 422) {
        Get.back();
        if (context.mounted) {
          var jsonData = jsonDecode(response.body);
          // print(jsonData);
          // var extrachjson = jsonData['data'];
          // print(extrachjson);
          DialogWidget.showWarningDialog(
            context: context,
            title: jsonData['message'],
            des: "cardnumvalidation".tr,
            langCode: langCode,
            buttomTitle: "close".tr,
          );
        }
      } else if (response.statusCode == 429) {
        Get.back();
        if (context.mounted) {
          DialogWidget.showWarningDialog(
            context: context,
            title: "ស្នើលើសកំណត់",
            des: 'សូមរង់ចាំ១នាទីក្រោយ',
            langCode: langCode,
            buttomTitle: "close".tr,
          );
        }
      } else {
        Get.back();
      }
    } catch (e) {
      print(e);
      Get.back();
    }
  }

  void searchWoker(BuildContext context, String name, String date,
      {String langCode = "en"}) async {
    try {
      String apiUrl = baseUrl + searchWorkerUrl;
      var body = <String, String>{
        "full_name": name,
        "dob": date,
      };
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers(langCode),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Get.back();
        workerModel = parseFromJson(response.body);
        workerData = workerModel!.workerDatas[0];
        // Get.toNamed(Routes.detail, parameters: {"id": workerData!.hashcode});
        RouteView.detail.go(parameters: {"id": workerData!.hashcode});
        loading = false;
        update();
      } else if (response.statusCode == 404) {
        Get.back();
        if (context.mounted) {
          DialogWidget.showDialog(
              context, jsonDecode(response.body)["message"], langCode);
        }
      } else if (response.statusCode == 422) {
        Get.back();
        ValidationMessage valiDateMess =
            ValidationMessage.fromJson(jsonDecode(response.body));
        if (context.mounted) {
          DialogWidget.showWarningDialog(
            context: context,
            title: valiDateMess.message,
            des: valiDateMess.data.dob?.first ?? "",
          );
        }
      } else {
        Get.back();
      }
    } catch (e) {
      Get.back();
    }
  }

  // initWorkerData() async {
  //   String apiUrl = baseUrl + searchWorkerQr;
  //   Map<String, String> body = {"qr_code": Get.parameters["id"]!};
  //   var response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: headers(homeController.langCode.value),
  //     body: jsonEncode(body),
  //   );
  //   if (response.statusCode == 200) {
  //     workerData = WorkerData.fromJson(
  //       jsonDecode(response.body)["data"],
  //     );
  //     loading = false;
  //     update();
  //   }
  // }

  initData() async {
    print("hello world!");
    if (Get.parameters["id"] == null) {
      searchWorkByQr();
    } else {
      searchWorkByQr(data: Get.parameters["id"]!);
    }
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
