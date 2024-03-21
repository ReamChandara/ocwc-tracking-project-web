import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tracking_web/config/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:tracking_web/screen/detial_worker_screen.dart';
import '../models/worker_models.dart';

class WorkerController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  late Future<DateTime?> selectedDate;
  WorkerModel? workerModel;
  RxBool switchValue = false.obs;
  void changeSwitch(bool value) {
    switchValue.value = value;
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

  bool validation() {
    if (globalKey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }

  void searchWorker() async {
    String apiUrl = baseUrl + searchWorkerUrl;
    var body = <String, String>{
      "full_name": nameController.text,
      "dob": dateController.text,
    };
    var response = await http.post(Uri.parse(apiUrl),
        headers: headers(), body: jsonEncode(body));
    if (response.statusCode == 200) {
      workerModel = parseFromJson(response.body);
      var falseIndex = workerModel!.workerData.tricking
          .indexWhere((element) => element.check == false);

      Get.to(() => WorkerDetail(
            workerData: workerModel!.workerData,
            falseIndex: falseIndex,
          ));
    }
  }

  void submit() {
    if (validation()) {
    } else {
      searchWorker();
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
    searchWorker();
    super.onInit();
  }
}
