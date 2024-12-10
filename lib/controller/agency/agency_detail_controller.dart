// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/constant/api_constant.dart';
import '../../models/agency_models.dart';

class AgencyDetailController extends GetxController {
  RxBool loading = RxBool(false);
  final PdfViewerController pdfcontroller = PdfViewerController();

  Rx<AgencyData?> agencyData = Rx<AgencyData?>(null);
  RxList<AgencyData> agencyList = <AgencyData>[].obs;
  Agency? agency;
  Address? address;
  List<Attachment> attachment = [];
  Contact? contact;
  List<Proka> prokas = [];
  Quota? quota;
  RxBool notFound = false.obs;

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

  Future initAgencyDetail(String hashId) async {
    loading.value = true;
    String apiUrl = baseUrl + agencyDetails;
    try {
      var uri = Uri.parse(apiUrl);
      var body = {
        "hash_id": hashId,
      };
      var response = await http.post(
        uri,
        headers: headers(),
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // print(jsonDecode(response.body));
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
        loading.value = false;
      } else {
        loading.value = false;
        notFound.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    await initAgencyDetail(Get.parameters['hash_id'] ?? "");
    super.onInit();
  }
}
