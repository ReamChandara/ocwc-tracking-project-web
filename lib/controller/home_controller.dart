import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  GetStorage storage = GetStorage();
  String key = "langCode";
  RxString langCode = "".obs;

  saveLang(String lang) {
    storage.write(key, lang);
  }

  readLang() {
    langCode.value = storage.read(key) ?? "kh";
  }

  void changeLang(String lang) {
    if (lang == "kh") {
      Get.updateLocale(const Locale("km", "KH"));
      langCode.value = lang;
      saveLang("kh");
    } else {
      Get.updateLocale(const Locale("en", "US"));
      langCode.value = lang;
      saveLang("en");
    }
  }

  @override
  void onInit() {
    readLang();
    super.onInit();
  }
}
