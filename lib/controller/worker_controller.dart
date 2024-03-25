import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_web/config/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import '../models/worker_models.dart';

class WorkerController extends GetxController {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  late Future<DateTime?> selectedDate;
  WorkerModel? workerModel;
  int falseIndex = 0;
  RxBool switchValue = false.obs;
  String langCode = "en";
  void changeSwitch(bool value) {
    switchValue.value = value;
    if (value) {
      Get.updateLocale(const Locale("km", "KH"));
      langCode = "kh";
    } else {
      Get.updateLocale(const Locale("en", "US"));
      langCode = "en";
    }
  }

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

  Future<void> saveWorkerData() async {
    String keyName = "workername";
    String dateName = "wokerDate";
    var pfre = await SharedPreferences.getInstance();
    pfre.setString(keyName, nameController.text);
    pfre.setString(dateName, dateController.text);
  }

  Future<void> getWorkerData() async {
    String keyName = "workername";
    String dateName = "wokerDate";
    var pfre = await SharedPreferences.getInstance();
    _nameController.text = pfre.getString(keyName) ?? "";
    _dateController.text = pfre.getString(dateName) ?? "";
  }

  initWorkerData() async {
    await getWorkerData();
    String apiUrl = baseUrl + searchWorkerUrl;
    var body = <String, String>{
      "full_name": _nameController.text,
      "dob": _dateController.text,
    };
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers(langCode),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      workerModel = parseFromJson(response.body);
      falseIndex = workerModel!.workerData.tricking
          .indexWhere((element) => element.check == false);
      update();
    }
  }

  void searchWorker() async {
    String apiUrl = baseUrl + searchWorkerUrl;
    var body = <String, String>{
      "full_name": nameController.text,
      "dob": dateController.text,
    };
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers(langCode),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      await saveWorkerData();
      workerModel = parseFromJson(response.body);
      falseIndex = workerModel!.workerData.tricking
          .indexWhere((element) => element.check == false);
      Get.toNamed('/workerDetail');
    }
  }

  void showDialogPicker(BuildContext context) {
    selectedDate = showDatePicker(
      context: context,
      helpText: 'Your Date of Birth',
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return child!;
      },
    );
    selectedDate.then((value) {
      setDateController = DateFormat("dd/MM/yyyy").format(
        value ?? DateTime.now(),
      );
    });
  }

  @override
  void onInit() {
    initWorkerData();
    super.onInit();
  }
}
