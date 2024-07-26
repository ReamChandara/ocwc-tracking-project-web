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
  Agency? agency;
  Address? address;
  List<Attachment> attachment = [];
  Contact? contact;
  List<Proka> prokas = [];
  Quota? quota;

  RxBool loading = RxBool(false);

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
    // if (!await launchUrl(url)) {
    //   throw Exception('Could not launch $url');
    // }
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

  Future<void> getAgencyDetail(
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
        agencyData.value = agencyModels.agencydata;
        agency = agencyData.value?.agency;
        address = agencyData.value?.address;
        attachment = agencyData.value!.attachment;
        contact = agencyData.value?.contact;
        prokas = agencyData.value!.prokas;
        quota = agencyData.value?.quota;
        Get.toNamed(
          Routes.agencyDetail,
          parameters: {"name": agencyName},
        );
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
    }
  }

  void initAgencyData(String param) async {
    loading.value = true;
    String apiUrl = baseUrl + searchAgency;
    try {
      var uri = Uri.parse(apiUrl);
      var body = {
        "name": param,
      };
      var response = await http.post(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        AgencyModels agencyModels = AgencyModels.fromJson(
          jsonDecode(response.body),
        );
        agencyData.value = agencyModels.agencydata;
        agency = agencyData.value!.agency;
        address = agencyData.value!.address;
        attachment = agencyData.value!.attachment;
        contact = agencyData.value!.contact;
        prokas = agencyData.value!.prokas;
        quota = agencyData.value!.quota;
        loading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  void initData() {
    if (Get.parameters['name'] == null) {
    } else {
      initAgencyData(Get.parameters['name']!);
    }
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
