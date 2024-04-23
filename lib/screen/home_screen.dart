// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/worker_controller.dart';
import '../widget/textfield_widget.dart';

class HomeScreen extends GetView<WorkerController> {
  HomeScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validateDate(String text) {
    final RegExp dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/(19|20)\d\d$');
    return (dateRegex.hasMatch(text));
  }

  bool validation() {
    if (formKey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }

  void submit(BuildContext context) {
    if (validation()) {
    } else {
      controller.searchWorker(context);
      //  Get.rootDelegate.toNamed(Routes.detail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, boxConstraints) {
        if (boxConstraints.maxWidth > 1000) {
          return Container(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpg"),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/splash_logo_new.png",
                  width: 400,
                ),
                Container(
                  width: 400,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(35, 54, 93, 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                            children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(() => PopupMenuButton(
                                    padding: EdgeInsets.only(bottom: 6),
                                    position: PopupMenuPosition.under,
                                    child: controller.initValue.value == "kh"
                                        ? ClipRRect(
                                            child: Image.asset(
                                            "assets/images/cambodia_flag.png",
                                            width: 30,
                                          ))
                                        : ClipRRect(
                                            child: Image.asset(
                                            "assets/images/english_flag.png",
                                            width: 30,
                                          )),
                                    onSelected: (value) {
                                      if (value == "kh") {
                                        controller.changeLanguage("kh");
                                      } else if (value == "en") {
                                        controller.changeLanguage("en");
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      controller.initValue.value == "kh"
                                          ? PopupMenuItem(
                                              padding: EdgeInsets.all(6),
                                              value: "en",
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/english_flag.png",
                                                    width: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "English",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          : PopupMenuItem(
                                              padding: EdgeInsets.all(6),
                                              value: "kh",
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/cambodia_flag.png",
                                                    width: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "ភាសាខ្មែរ",
                                                    style: TextStyle(
                                                      fontFamily: "Battambang",
                                                      fontSize: 14,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                    ],
                                  ))
                            ],
                          ),
                          Text(
                            "title".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontFamily: controller.langCode == "en"
                                    ? "SourceSansPro-Regular"
                                    : "Battambang"),
                          ),
                          Text(
                            "subTitle".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: controller.langCode == "en"
                                    ? "SourceSansPro-Regular"
                                    : "Battambang"),
                          ),
                          SizedBox(height: 20),
                          TextFieldWidget(
                            onFieldSubmitted: (val) {
                              controller.setNameController = val;
                              submit(context);
                            },
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                width: 10,
                                "assets/icons/id-card.png",
                                color: Colors.blueGrey,
                              ),
                            ),
                            errorStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: controller.langCode == "en"
                                    ? "SourceSansPro-Regular"
                                    : "Battambang"),
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: controller.langCode == "en"
                                    ? "SourceSansPro-Regular"
                                    : "Battambang"),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "nameWarning".tr;
                              } else {
                                return null;
                              }
                            },
                            controller: controller.nameController,
                            hintText: "latin".tr,
                          ),
                          TextFieldWidget(
                            controller: controller.dateController,
                            hintText: "date".tr,
                            errorStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: controller.langCode == "en"
                                    ? "SourceSansPro-Regular"
                                    : "Battambang"),
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: controller.langCode == "en"
                                    ? "SourceSansPro-Regular"
                                    : "Battambang"),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                width: 10,
                                "assets/icons/calendar.png",
                                color: Colors.blueGrey,
                              ),
                            ),
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  controller.showDialogPicker(context);
                                },
                                icon: const Icon(
                                  Icons.date_range,
                                  color: Colors.blueGrey,
                                )),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "dateWarning".tr;
                              } else if (!validateDate(val)) {
                                return "dateMatch".tr;
                              } else {
                                return null;
                              }
                            },
                            onFieldSubmitted: (val) {
                              controller.setDateController = val;
                              submit(context);
                            },
                            inputFormatters: [
                              MaskTextInputFormatter(
                                mask: '##/##/####',
                                filter: {"#": RegExp(r'[0-9]')},
                                type: MaskAutoCompletionType.lazy,
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              submit(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("track".tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang")),
                            ),
                          ),
                          SizedBox(height: 20),
                        ].withSpaceBetween(height: 20)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Container(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpg"),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    "assets/images/splash_logo_new.png",
                    width: 250,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 400,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(35, 54, 93, 0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                              children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Obx(() => PopupMenuButton(
                                      padding: EdgeInsets.only(bottom: 6),
                                      position: PopupMenuPosition.under,
                                      child: controller.initValue.value == "kh"
                                          ? ClipRRect(
                                              child: Image.asset(
                                              "assets/images/cambodia_flag.png",
                                              width: 30,
                                            ))
                                          : ClipRRect(
                                              child: Image.asset(
                                              "assets/images/english_flag.png",
                                              width: 30,
                                            )),
                                      onSelected: (value) {
                                        if (value == "kh") {
                                          controller.changeLanguage("kh");
                                        } else if (value == "en") {
                                          controller.changeLanguage("en");
                                        }
                                      },
                                      itemBuilder: (BuildContext context) => [
                                        controller.initValue.value == "kh"
                                            ? PopupMenuItem(
                                                padding: EdgeInsets.all(6),
                                                value: "en",
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/english_flag.png",
                                                      width: 30,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "English",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            : PopupMenuItem(
                                                padding: EdgeInsets.all(6),
                                                value: "kh",
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/cambodia_flag.png",
                                                      width: 30,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "ភាសាខ្មែរ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Battambang",
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                      ],
                                    ))
                              ],
                            ),
                            Text(
                              "title".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: controller.langCode == "en"
                                      ? "SourceSansPro-Regular"
                                      : "Battambang"),
                            ),
                            Text(
                              "subTitle".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: controller.langCode == "en"
                                      ? "SourceSansPro-Regular"
                                      : "Battambang"),
                            ),
                            SizedBox(height: 20),
                            //Image.asset("assets/images/card_image.png"),
                            TextFieldWidget(
                              onFieldSubmitted: (val) {
                                controller.setNameController = val;
                                submit(context);
                              },
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  width: 10,
                                  "assets/icons/id-card.png",
                                  color: Colors.blueGrey,
                                ),
                              ),
                              errorStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: controller.langCode == "en"
                                      ? "SourceSansPro-Regular"
                                      : "Battambang"),
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: controller.langCode == "en"
                                      ? "SourceSansPro-Regular"
                                      : "Battambang"),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "nameWarning".tr;
                                } else {
                                  return null;
                                }
                              },
                              controller: controller.nameController,
                              hintText: "latin".tr,
                            ),
                            TextFieldWidget(
                              controller: controller.dateController,
                              hintText: "date".tr,
                              errorStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: controller.langCode == "en"
                                      ? "SourceSansPro-Regular"
                                      : "Battambang"),
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: controller.langCode == "en"
                                      ? "SourceSansPro-Regular"
                                      : "Battambang"),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  width: 10,
                                  "assets/icons/calendar.png",
                                  color: Colors.blueGrey,
                                ),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    controller.showDialogPicker(context);
                                  },
                                  icon: const Icon(
                                    Icons.date_range,
                                    color: Colors.blueGrey,
                                  )),
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "dateWarning".tr;
                                } else if (!validateDate(val)) {
                                  return "dateMatch".tr;
                                } else {
                                  return null;
                                }
                              },
                              onFieldSubmitted: (val) {
                                controller.setDateController = val;
                                submit(context);
                              },
                              inputFormatters: [
                                MaskTextInputFormatter(
                                  mask: '##/##/####',
                                  filter: {"#": RegExp(r'[0-9]')},
                                  type: MaskAutoCompletionType.lazy,
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                submit(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("track".tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: controller.langCode == "en"
                                            ? "SourceSansPro-Regular"
                                            : "Battambang")),
                              ),
                            ),
                            SizedBox(height: 20),
                          ].withSpaceBetween(height: 20)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    ));
  }
}
