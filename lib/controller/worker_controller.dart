import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tracking_web/config/constant/api_constant.dart';
import 'package:http/http.dart' as http;
import '../models/validation_message.dart';
import '../models/worker_models.dart';

class WorkerController extends GetxController {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  late Future<DateTime?> selectedDate;
  WorkerModel? workerModel;
  int falseIndex = 0;
  RxBool changValue = false.obs;
  bool loading = true;
  String langCode = "en";
  GetStorage storage = GetStorage();
  String storageKey = "langCode";

  saveLocale(String langCode) {
    storage.write(storageKey, langCode);
  }
  //init for change value on switch widget
  initValueChange() {
    if(langCode == "en") {
      changValue.value = false;
    }else {
      changValue.value = true;
    }
  }  

  // init for change language
  Future<void> initLocale() async {
    langCode = storage.read(storageKey) ?? 'en';
    if (langCode == "en") {
      Get.updateLocale(const Locale("en", "US"));
    } else {
      Get.updateLocale(const Locale("km", "KH"));
    }
  }

  void changeLang(bool value) async {
    changValue.value = value;
    if (value) {
      Get.updateLocale(const Locale("km", "KH"));
      langCode = "kh";
      saveLocale("kh");
    } else {
      Get.updateLocale(const Locale("en", "US"));
      langCode = "en";
      saveLocale("en");
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

  Future<void> saveWorkerData() async {
    String keyName = "workername";
    String dateName = "wokerDate";
    storage.write(keyName, nameController.text);
    storage.write(dateName, dateController.text);
  }

  Future<void> getWorkerData() async {
    String keyName = "workername";
    String dateName = "wokerDate";
    _nameController.text = storage.read(keyName) ?? "";
    _dateController.text = storage.read(dateName) ?? "";
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
      falseIndex = workerModel!.workerData[0].tricking
          .indexWhere((element) => element.check == false);
      loading = false;
      update();
    }
  }

  void searchWorker(BuildContext context) async {
    laodingDailog(context);
    String apiUrl = baseUrl + searchWorkerUrl;
    var body = <String, String>{
      "full_name": _nameController.text,
      "dob": _dateController.text,
    };
    print(body);
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers(langCode),
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      Get.back();

      // await saveWorkerData();
      workerModel = parseFromJson(response.body);
      for (var temp in workerModel!.workerData) {
        print(temp.fullName.khName);
      }
      // falseIndex = workerModel!.workerData.tricking
      //     .indexWhere((element) => element.check == false);
      // loading = false;
      // Get.toNamed('/workerDetail');
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
            // data: Theme.of(context).copyWith(
            //   dialogBackgroundColor: Colors.yellow, // days/years gridview
            //   textTheme: TextTheme(
            //     headlineSmall: GoogleFonts.greatVibes(), // Selected Date landscape
            //     titleLarge: GoogleFonts.greatVibes(), // Selected Date portrait
            //     labelSmall: GoogleFonts.greatVibes(), // Title - SELECT DATE
            //     bodyLarge: GoogleFonts.greatVibes(), // year gridbview picker
            //     titleMedium: GoogleFonts.greatVibes(color: Colors.black), // input
            //     titleSmall: GoogleFonts.greatVibes(), // month/year picker
            //     bodySmall: GoogleFonts.greatVibes(), // days
            //   ),
            //   colorScheme: Theme.of(context).colorScheme.copyWith(
            //         // Title, selected date and day selection background (dark and light mode)
            //         surface: Colors.amber,
            //         primary: Colors.amber,
            //         // Title, selected date and month/year picker color (dark and light mode)
            //         onSurface: Colors.black,
            //         onPrimary: Colors.black,
            //       ),
            //   // Buttons
            //   textButtonTheme: TextButtonThemeData(
            //     style: TextButton.styleFrom(
            //       foregroundColor: Colors.yellow,
            //       backgroundColor: Colors.pink,
            //       textStyle: GoogleFonts.greatVibes(),
            //     ),
            //   ),
            //   // Input
            //   inputDecorationTheme: InputDecorationTheme(
            //     labelStyle: GoogleFonts.greatVibes(), // Input label
            //   ),
            // ),
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
    await initLocale();
    initValueChange();
    initWorkerData();
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
