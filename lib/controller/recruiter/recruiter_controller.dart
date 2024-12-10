// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tracking_web/config/constant/api_constant.dart';
import 'package:tracking_web/widget/alert_widget.dart';

import '../../config/routes/app_route.dart';
import '../../models/recruiter_models.dart';
import '../../widget/dialog_widget.dart';

class RecruiterController extends GetxController {
  RxBool loading = false.obs;
  RxBool cloudFlare = false.obs;

  Rx<RecruiterModels?> recruiterModels = Rx<RecruiterModels?>(null);
  RxList<RecruiterData> listRecruiter = <RecruiterData>[].obs;
  Rx<Meta?> meta = Rx<Meta?>(null);
  var currentTotalPage = 6.obs;
  Future<void> verifyCloudFlare(String token) async {
    await Future.delayed(const Duration(seconds: 1)).whenComplete(
      () => token != '' ? cloudFlare.value = true : cloudFlare.value = false,
    );
  }

  Rx<int?> perpageSelected = Rx<int?>(null);
  void onChange<T>(T? val) {
    if (val is int) {
      perpageSelected.value = val;
    }
  }

  Future findRecruiter(
    BuildContext context,
    String? name, {
    String langCode = "en",
  }) async {
    String apiUrl = baseUrl + findRecruiterUrl;
    var response = await http.get(
      headers: headers(langCode),
      Uri.parse(apiUrl).replace(queryParameters: {'name': name}),
    );
    print("status code : ${response.statusCode}");
    if (response.statusCode == 200) {
      var jsondata = response.body;
      recruiterModels.value = RecruiterModels.fromJson(jsonDecode(jsondata));
      listRecruiter.value = recruiterModels.value!.data;
      meta.value = recruiterModels.value?.meta;
      currentTotalPage.value =
          meta.value!.lastPage >= 6 ? 6 : meta.value!.lastPage;
      Get.back();
      if (listRecruiter.length > 1) {
        RouteView.recruiterList.go(parameters: {'name': name ?? ""});
      } else {
        RouteView.recruiterDetail.go(
          parameters: {'hash_id': listRecruiter.first.hashId},
        );
      }
    } else if (response.statusCode == 400) {
      Get.back();
      if (context.mounted) {
        DialogWidget.showDialog(
          context,
          jsonDecode(response.body)["message"],
          langCode,
        );
      }
    } else if (response.statusCode == 404) {
      Get.back();
      if (context.mounted) {
        DialogWidget.showDialog(
            context, jsonDecode(response.body)["errors"]["message"], langCode);
      }
    } else {
      if (context.mounted) {
        DialogWidget.showDialog(context, "notfoundAgent".tr, langCode);
      }
    }
  }

  // RxString htmlRaw = "".obs;
  // var loadingDetial = true.obs;

  // Future<void> getRecruiterDetail(String hashId) async {
  //   String apiUrl = "$baseUrl$recruiterDetailUrl/$hashId";
  //   var response = await http.post(Uri.parse(apiUrl), headers: headers());
  //   print("response status: ${response.statusCode}");
  //   if (response.statusCode == 200) {
  //     loadingDetial.value = false;
  //     htmlRaw.value = response.body;
  //   } else {
  //     loadingDetial.value = true;
  //   }
  // }

  void getRecruiterByPage(String langCode,
      {String? perpage, String? page, String name = ""}) async {
    loading.value = true;
    print(name);
    String apiUrl = baseUrl + findRecruiterUrl;
    try {
      var response = await http.get(
        headers: headers(langCode),
        Uri.parse(apiUrl).replace(queryParameters: {
          'name': name.isEmpty ? (Get.parameters["name"] ?? "") : ""
        }),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        recruiterModels.value = RecruiterModels.fromJson(jsonData);
        listRecruiter.value = recruiterModels.value?.data ?? [];
        meta.value = recruiterModels.value?.meta;
        currentTotalPage.value =
            meta.value!.lastPage >= 6 ? 6 : meta.value!.lastPage;
        loading.value = false;
      } else if (response.statusCode == 400) {
        listRecruiter.value = [];
        loading.value = false;
      } else if (response.statusCode == 429) {
        listRecruiter.value = [];
        loading.value = false;
      } else if (response.statusCode == 404) {
        listRecruiter.value = [];
        loading.value = false;
      } else {
        listRecruiter.value = [];
        loading.value = false;
      }
    } catch (e) {
      print(e);
      notificationAlert("Somthing went wrong!");
      loading.value = false;
    }
  }

  Future initRecruter(String name, {String langCode = "en"}) async {
    loading.value = true;
    String apiUrl = baseUrl + findRecruiterUrl;
    try {
      var response = await http.get(
        headers: headers(langCode),
        Uri.parse(apiUrl).replace(queryParameters: {'name': name}),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        recruiterModels.value = RecruiterModels.fromJson(jsonData);
        listRecruiter.value = recruiterModels.value?.data ?? [];
        meta.value = recruiterModels.value?.meta;
        currentTotalPage.value =
            meta.value!.lastPage >= 6 ? 6 : meta.value!.lastPage;
        loading.value = false;
      } else if (response.statusCode == 400) {
        var jsonData = jsonDecode(response.body);
        listRecruiter.value = [];
        loading.value = false;
        notificationAlert(jsonData["errors"]['message']);
      } else if (response.statusCode == 429) {
        listRecruiter.value = [];
        loading.value = false;
        notificationAlert("កាស្នើលើសកំណត់សូមរង់ចាំ ១ នាទី");
      } else if (response.statusCode == 404) {
        var jsonData = jsonDecode(response.body);
        listRecruiter.value = [];
        notificationAlert(jsonData['message']);
        loading.value = false;
      } else {
        notificationAlert("Somthing went wrong!");
      }
    } catch (e) {
      print(e);
      notificationAlert("Somthing went wrong!");
      loading.value = false;
    }
  }

  @override
  void onInit() async {
    if (Get.parameters['name'] != null) {
      await initRecruter(Get.parameters['name'] ?? "");
    }
    //  else if (Get.parameters['hash_id'] != null) {
    //   await getRecruiterDetail(Get.parameters['hash_id'] ?? '');
    // } else {}

    super.onInit();
  }
}

class RecruiterDetialController extends GetxController {
  RxBool loading = true.obs;
  RxString htmlRaw = "".obs;
  Future<void> getDetail(String hashId) async {
    String apiUrl = "$baseUrl$recruiterDetailUrl/$hashId";
    var response = await http.post(Uri.parse(apiUrl), headers: headers());
    print("response status: ${response.statusCode}");
    if (response.statusCode == 200) {
      loading.value = false;
      htmlRaw.value = response.body;
    } else {
      loading.value = true;
    }
  }

  @override
  void onInit() {
    getDetail(Get.parameters['hash_id'] ?? '');
    super.onInit();
  }
}
