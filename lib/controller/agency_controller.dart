// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:tracking_web/config/constant/api_constant.dart';
import 'package:tracking_web/models/agency_models.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/routes/app_route.dart';
import '../widget/dialog_widget.dart';

class AgencyController extends GetxController {
  final PdfViewerController pdfcontroller = PdfViewerController();
  Rx<AgencyData?> agencyData = Rx<AgencyData?>(null);
  RxList<AgencyData> agencyList = <AgencyData>[].obs;
  Agency? agency;
  Address? address;
  List<Attachment> attachment = [];
  Contact? contact;
  List<Proka> prokas = [];
  Quota? quota;

  RxBool loading = RxBool(false);

  RxBool loadingList = RxBool(false);

  RxBool cloudFlare = false.obs;

  double zoomRatio = 0.0;

  Future<void> launchPdf(String path) async {
    var url = Uri.parse(path);
    try {
      bool res = await launchUrl(url);
      if (res == true) {
      } else {}
    } on http.ClientException {
      print("Failed to launch");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final dio = Dio();
  void fetchImageBytes(String url) async {
    try {
      final response = await dio.get(url,
          options: Options(responseType: ResponseType.bytes));
      print(response.statusCode);
      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      print(e);
    } finally {}
  }

  onZoomRatio() {
    zoomRatio = pdfcontroller.zoomRatio;
    print(zoomRatio);
  }

  Future<void> verifyCloudFlare(String token) async {
    await Future.delayed(const Duration(seconds: 1)).whenComplete(
      () => token != '' ? cloudFlare.value = true : cloudFlare.value = false,
    );
  }

  GetStorage storage = GetStorage();
  String storageKey = "imagePath";

  Future saveImagePath(String path) async {
    await storage.write(storageKey, path);
  }

  String readImagePath() {
    return storage.read(storageKey);
  }

  String splitUrl(String url) {
    List<String> parts = url.split('.');
    String extension = parts.last;
    return extension;
  }

  List<String> splitString(String data) {
    return data.split(" - ");
  }

  bool checkExtenstion(String extension) {
    if (extension == "jpg" || extension == "jpeg" || extension == "png") {
      return true;
    } else {
      return false;
    }
  }

  Future<void> findingAgency(
    BuildContext context,
    String agencyName, {
    String langCode = "en",
  }) async {
    String apiUrl = baseUrl + searchAgency;
    var uri = Uri.parse(apiUrl);
    var body = {
      "name": agencyName,
    };
    try {
      var response = await http.post(
        uri,
        headers: headers(langCode),
        body: jsonEncode(body),
      );
      print("status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.back();
        AgencyModels agencyModels = AgencyModels.fromJson(
          jsonDecode(response.body),
        );

        if (agencyModels.agencydata.length == 1) {
          agencyData.value = agencyModels.agencydata.firstWhere(
            (element) => element.agency.country.englishName
                .toLowerCase()
                .contains("Cambodia".toLowerCase()),
          );
          initAgencyDetail(agencyData.value!.hashId);
          Get.toNamed(
            Routes.agencyDetail,
            parameters: {"id": agencyData.value!.hashId},
          );
        } else {
          agencyList.value = agencyModels.agencydata;
          Get.toNamed(Routes.listAgency, parameters: {'name': agencyName});
        }
      }
      if (response.statusCode == 404) {
        Get.back();
        if (context.mounted) {
          DialogWidget.showDialog(context,
              jsonDecode(response.body)["errors"]["message"], langCode);
        }
      }
    } catch (e) {
      print(e);
      if (context.mounted) {
        DialogWidget.showDialog(context, "notfoundAgent".tr, langCode);
      }
    }
  }

  void getAgencyDetails(
    BuildContext context,
    String hashId, [
    String langCode = "en",
  ]) async {
    String apiUrl = baseUrl + agencyDetails;
    try {
      var uri = Uri.parse(apiUrl);
      var body = {
        "hash_id": hashId,
      };
      var response = await http.post(
        uri,
        headers: headers(langCode),
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        Get.back();
        AgencyModels agencyModels = AgencyModels.fromJsonNew(
          jsonDecode(response.body),
        );
        agencyData.value = agencyModels.agencyDetail;
        agency = agencyData.value!.agency;
        address = agencyData.value!.address;
        attachment = agencyData.value!.attachment;
        contact = agencyData.value!.contact;
        prokas = agencyData.value!.prokas;
        quota = agencyData.value!.quota;
        Get.toNamed(
          Routes.agencyDetail,
          parameters: {"id": agencyModels.agencyDetail!.hashId},
        );
      } else if (response.statusCode == 404) {
        Get.back();
        if (context.mounted) {
          DialogWidget.showDialog(context,
              jsonDecode(response.body)["errors"]["message"], langCode);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  RxBool notFound = false.obs;
  void initAgencyDetail(String param) async {
    loading.value = true;
    String apiUrl = baseUrl + agencyDetails;
    try {
      var uri = Uri.parse(apiUrl);
      var body = {
        "hash_id": param,
      };
      var response = await http.post(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        // print(jsonDecode(response.body));
        AgencyModels agencyModels = AgencyModels.fromJsonNew(
          jsonDecode(response.body),
        );
        print(agencyModels.agencyDetail!.hashId);
        agencyData.value = agencyModels.agencyDetail;
        agency = agencyData.value!.agency;
        address = agencyData.value!.address;
        attachment = agencyData.value!.attachment;
        contact = agencyData.value!.contact;
        prokas = agencyData.value!.prokas;
        quota = agencyData.value!.quota;
        loading.value = false;
      } else {
        loading.value = false;
        notFound.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  void initAgencyList(String params, {String langCode = "en"}) async {
    String apiUrl = baseUrl + searchAgency;
    var uri = Uri.parse(apiUrl);
    var body = {
      "name": params,
    };
    loadingList.value = true;
    try {
      var response = await http.post(
        uri,
        headers: headers(langCode),
        body: jsonEncode(body),
      );
      print("status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        AgencyModels agencyModels = AgencyModels.fromJson(
          jsonDecode(response.body),
        );
        agencyList.value = agencyModels.agencydata;
        loadingList.value = false;
      }
    } catch (e) {
      if (e is Exception) {
        print(e);
      }
    }
  }

  void initData() {
    if (Get.parameters['id'] == null) {
    } else {
      initAgencyDetail(Get.parameters['id']!);
    }
    if (Get.parameters['name'] == null) {
    } else {
      initAgencyList(Get.parameters['name']!);
    }
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
