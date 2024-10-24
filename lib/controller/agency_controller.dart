// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:tracking_web/config/constant/api_constant.dart';
import 'package:tracking_web/config/routes/app_route.dart';
import 'package:tracking_web/models/agency_models.dart';
import 'package:tracking_web/models/api_response.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widget/dialog_widget.dart';

class AgencyController extends GetxController {
  final PdfViewerController pdfcontroller = PdfViewerController();
  Rx<AgencyData?> agencyData = Rx<AgencyData?>(null);
  RxList<AgencyData> agencyList = <AgencyData>[].obs;
  Rx<Meta?> meta = Rx<Meta?>(null);
  late final ScrollController scrollController;
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

  String agencyKey = "agencyKey";
  void saveAgencyName(String agencyname) async {
    await storage.write(agencyKey, agencyname);
  }

  String readAgency() {
    return storage.read(agencyKey);
  }

  var currentTotalPage = 6.obs;
  // void countTotalPage() {
  //   currentTotalPage += 1;
  // }

  void loadPageTolast() {
    currentTotalPage.value = meta.value!.lastPage;
  }

  Future getListAgency({String? perpage, String? page, String? name}) async {
    String apiUrl = baseUrl + listAgencyUrl;
    var params = {"per_page": perpage, "page": page, "name": name};
    print(params);

    loading.value = true;
    loadingList.value = true;
    var uri = Uri.parse(apiUrl).replace(queryParameters: params);
    var response = await http.post(
      uri,
      headers: headers(),
    );
    print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      ApiResponse apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
      agencyList.value = apiResponse.data;
      meta.value = apiResponse.meta;
      currentTotalPage.value =
          meta.value!.lastPage >= 6 ? 6 : meta.value!.lastPage;
      print(currentTotalPage.value);
      print("last page : ${meta.value?.lastPage ?? ""}");
      loadingList.value = false;
    } else if (response.statusCode == 429) {
      agencyList.value = [];

      loadingList.value = false;
    } else if (response.statusCode == 404) {
      agencyList.value = [];

      loadingList.value = false;
    }
  }

  Future<void> findingAgency(
    BuildContext context,
    String agencyName, {
    String langCode = "en",
  }) async {
    String apiUrl = baseUrl + listAgencyUrl;
    var params = {"per_page": "", "page": "", "name": agencyName};
    var uri = Uri.parse(apiUrl).replace(queryParameters: params);
    print("params : $uri");
    try {
      var response = await http.post(
        uri,
        headers: headers(langCode),
      );
      print("status code : ${response.statusCode}");
      if (response.statusCode == 200) {
        Get.back();
        AgencyModels agencyModels = AgencyModels.fromJson(
          jsonDecode(response.body),
        );
        saveAgencyName(agencyName);
        print("agency length : ${agencyModels.agencydata.length}");
        if (agencyModels.agencydata.length == 1) {
          await initAgencyDetail(agencyModels.agencydata.first.hashId);
          RouteView.agencyDetail.go(
            parameters: {"id": agencyModels.agencydata.first.hashId},
          );
        } else {
          await getListAgency(name: agencyName);
          RouteView.listAgency.go();
        }
      } else if (response.statusCode == 404) {
        Get.back();
        if (context.mounted) {
          DialogWidget.showDialog(context,
              jsonDecode(response.body)["errors"]["message"], langCode);
        }
      } else {
        if (context.mounted) {
          DialogWidget.showDialog(context, "notfoundAgent".tr, langCode);
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
      print(hashId);
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
        // Get.toNamed(
        //   Routes.agencyDetail,
        //   parameters: {"id": agencyModels.agencyDetail!.hashId},
        // );
        RouteView.agencyDetail.go(
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
  Future initAgencyDetail(String param) async {
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
      } else {
        agencyList.value = [];
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
    // if (Get.parameters['name'] == null) {
    //   getListAgency();
    // }
    // else {
    //   // initAgencyList(Get.parameters['name']!);
    //   getListAgency(name: Get.parameters['name']!);
    // }
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    initData();
    super.onInit();
  }
}
