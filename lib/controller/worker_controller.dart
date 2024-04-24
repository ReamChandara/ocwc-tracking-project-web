import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tracking_web/config/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:tracking_web/config/routes/app_route.dart';
import '../models/validation_message.dart';
import '../models/worker_models.dart';

class WorkerController extends GetxController {
  //textfield controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  ////////////////////////////////////////////////////////////////

  // user for select date
  late Future<DateTime?> selectedDate;

  // worker model class
  WorkerModel? workerModel;
  WorkerData? workerData;
  int index = 0;
  ////////////////////////////////////////////////////////////////

  // user to find the tracking that pending
  int falseIndex = 0;
  ////////////////////////////////////////////////////////////////

  /// change value of swicth to change language
  RxBool changValue = false.obs;
  ////////////////////////////////////////////////////////////////
  // loading worker data
  bool loading = true;
  ////////////////////////////////////////////////////////////////

  /// save local data
  String langCode = "";
  GetStorage storage = GetStorage();
  String storageKey = "langCode";
  ////////////////////////////////////////////////////////////////

  // check options
  RxBool isScanCard = false.obs;
  RxBool isSearchName = false.obs;

  void selectOption(String option) {
    if (option == "scan") {
      isScanCard.value = true;
    } else {
      isSearchName.value = true;
    }
  }

  // save language data
  saveLocale(String langCode) {
    storage.write(storageKey, langCode);
  }
  ////////////////////////////////////////////////////////////////

  //init for change value on switch widget
  initValueChange() {
    langCode = storage.read(storageKey) ?? 'kh';
    if (langCode == "kh") {
      changValue.value = false;
    } else {
      changValue.value = true;
    }
  }

  // // init for change language
  // Future<void> initLocale() async {
  //   String langCode = storage.read(storageKey) ?? 'en';
  //   if (langCode == "kh") {
  //     this.langCode = langCode;
  //     Get.updateLocale(const Locale("km", "KH"));
  //   } else {}
  // }
  RxString initValue = "kh".obs;
  void changeLanguage(String value) {
    if (value == "kh") {
      Get.updateLocale(const Locale("km", "KH"));
      initValue.value = "kh";
      langCode = "kh";
      saveLocale("kh");
    } else {
      Get.updateLocale(const Locale("en", "US"));
      langCode = "en";
      initValue.value = "en";
      saveLocale("en");
    }
  }

  void initChange() {
    langCode = storage.read(storageKey) ?? 'kh';
    if (langCode == "kh") {
      initValue.value = "kh";
    } else {
      initValue.value = "en";
    }
  }

  // //change language
  // void changeLang(bool value) async {
  //   changValue.value = value;
  //   if (value) {
  //     Get.updateLocale(const Locale("en", "US"));
  //     langCode = "en";
  //     saveLocale("en");
  //   } else {
  //     Get.updateLocale(const Locale("km", "KH"));
  //     langCode = "kh";
  //     saveLocale("kh");
  //   }
  // }

  get nameController {
    return _nameController;
  }

  get dateController {
    return _dateController;
  }

  set setNameController(name) {
    _nameController.text = name;
  }

  set setDateController(date) {
    _dateController.text = date;
  }

  // show dialog
  showDialog(BuildContext context, String title) {
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
          overlayColor: Colors.transparent,
        ),
        image: Image.asset(width: 40, "assets/images/logo_ocwc.jpg"),
        context: context,
        desc: title,
        buttons: [
          DialogButton(
              child: Text(
                "try".tr,
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

  laodingDailog(BuildContext context) {
    Alert(
      style: AlertStyle(
          titleStyle: TextStyle(
            fontSize: 16,
            fontFamily:
                langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
          ),
          descStyle: TextStyle(
            fontSize: 14,
            fontFamily:
                langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
          ),
          titlePadding: const EdgeInsets.only(top: 5),
          descPadding: const EdgeInsets.only(bottom: 10, top: 5),
          animationType: AnimationType.grow,
          isOverlayTapDismiss: false,
          overlayColor: Colors.transparent,
          isCloseButton: false,
          isButtonVisible: false,
          buttonAreaPadding: const EdgeInsets.all(0)),
      image: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: const CircularProgressIndicator(),
      ),
      context: context,
      title: "loading".tr,
      desc: "finding".tr,
    ).show();
  }

  showWarningDialog(
      {required BuildContext context, String? des, String? title}) {
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
          overlayColor: Colors.transparent,
        ),
        image: Image.asset(width: 40, "assets/images/logo_ocwc.jpg"),
        context: context,
        title: title,
        desc: des,
        buttons: [
          DialogButton(
              child: Text(
                "try".tr,
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
  ////////////////////////////////////////////////////////////////

  Future<void> saveWorkerData() async {
    String keyName = "workername";
    String keyDate = "wokerDate";
    storage.write(keyName, nameController.text);
    storage.write(keyDate, dateController.text);
  }

  Future<void> getWorkerData() async {
    String keyName = "workername";
    String keyDate = "wokerDate";
    String indexKey = "index";
    _nameController.text = storage.read(keyName) ?? "";
    _dateController.text = storage.read(keyDate) ?? "";
    index = storage.read(indexKey) ?? 0;
  }

  Future<void> saveIndex(int index) async {
    storage.write("index", index);
  }

  void routeToDetail(int index) async {
    await saveIndex(index);
    workerData = workerModel!.workerData[index];
    if (workerData != null) {
      falseIndex =
          workerData!.tricking.indexWhere((element) => element.check == false);

      Get.rootDelegate.toNamed(Routes.detail);
    }
  }

  initWorkerData() async {
    await getWorkerData();
    String apiUrl = baseUrl + searchWorkerUrl;
    var body = <String, String>{
      "full_name": _nameController.text,
      "dob": _dateController.text.replaceAll("/", "-"),
    };
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers(langCode),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      workerModel = parseFromJson(response.body);
      workerData = workerModel!.workerData[index];
      falseIndex = workerData!.tricking.indexWhere(
        (element) => element.check == false,
      );
      loading = false;
      update();
    }
  }

  dialogShowImage({required BuildContext context, required dynamic path}) {
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
          overlayColor: Colors.transparent,
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

  void showImageCard(BuildContext context) async {
    laodingDailog(context);
    String apiUrl = "$baseUrl$cardImage${workerData!.hashcode}";
    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers(langCode),
      );
      if (response.statusCode == 200) {
        Get.back();
        if (context.mounted) {
          dialogShowImage(context: context, path: response.body);
        }
      } else {
        if (context.mounted) {
          showWarningDialog(context: context, des: "something went wrong");
        }
      }
    } catch (e) {
      Get.back();
    }
  }

  void searchWorker(BuildContext context) async {
    String dateReplace = _dateController.text.replaceAll("/", "-");
    laodingDailog(context);
    try {
      String apiUrl = baseUrl + searchWorkerUrl;
      var body = <String, String>{
        "full_name": _nameController.text,
        "dob": dateReplace,
      };
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers(langCode),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Get.back();
        await saveWorkerData();
        workerModel = parseFromJson(response.body);
        if (workerModel!.workerData.length > 1) {
          Get.toNamed(Routes.detail);
        } else {
          await saveIndex(0);
          workerData = workerModel!.workerData[0];
          falseIndex = workerModel!.workerData[0].tricking
              .indexWhere((element) => element.check == false);
          loading = false;
          Get.toNamed(Routes.detail);
        }
        loading = false;
        update();
      } else if (response.statusCode == 404) {
        Get.back();
        if (!context.mounted) {
        } else {
          showDialog(context, jsonDecode(response.body)["message"]);
        }
      } else if (response.statusCode == 422) {
        Get.back();
        ValidationMessage valiDateMess =
            ValidationMessage.fromJson(jsonDecode(response.body));
        if (context.mounted) {
          showWarningDialog(
              context: context,
              title: valiDateMess.message,
              des: valiDateMess.data.dob?.first ?? "");
        }
      } else {
        Get.back();
      }
    } catch (e) {
      Get.back();
    }
  }

  void showDialogPicker(BuildContext context) {
    selectedDate = showDatePicker(
        context: context,
        helpText: 'dateofbirth'.tr,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
                fontFamily:
                    langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
                useMaterial3: false),
            child: child!,
          );
        },
        locale: Get.locale);
    selectedDate.then((value) {
      setDateController = DateFormat("dd/MM/yyyy").format(
        value ?? DateTime.now(),
      );
    });
  }

  void initData() async {
    //initLocale();
    initWorkerData();
    initChange();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
