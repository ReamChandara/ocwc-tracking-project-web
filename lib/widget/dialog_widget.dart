import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogWidget {
  static Future<DateTime> showDialogPicker(
      BuildContext context, String fontFamily) async {
    var selectedDate = await showDatePicker(
        context: context,
        helpText: 'dateofbirth'.tr,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(fontFamily: fontFamily, useMaterial3: false),
            child: child!,
          );
        },
        locale: Get.locale);
    return selectedDate ?? DateTime.now();
  }

  static void laodingDailog(BuildContext context, String langCode) {
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

  static showDialog(BuildContext context, String title, String langCode) {
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

  static showWarningDialog(
      {required BuildContext context,
      String? des,
      String? title,
      String? buttomTitle,
      String? langCode}) {
    Alert(
        style: AlertStyle(
          titleStyle: TextStyle(
            fontFamily:
                langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
          ),
          descStyle: TextStyle(
            fontSize: 14,
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
                buttomTitle ?? "try".tr,
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
}
