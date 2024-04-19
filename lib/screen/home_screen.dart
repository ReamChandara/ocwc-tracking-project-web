// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
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
    }
  }

  get buildNewBody {
    return Form(
        key: formKey,
        child: Container(
          color: Colors.yellow,
        ));
  }

  // This function is used to update the page title
  void setPageTitle(String title, BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: title,
      primaryColor:
          Theme.of(context).primaryColor.value, // This line is required
    ));
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
                // Obx(() => controller.isScanCard.value ||
                //         controller.isSearchName.value
                //     ? SizedBox()
                //     : Container(
                //         width: 400,
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                //         decoration: BoxDecoration(
                //           color: Color.fromRGBO(35, 54, 93, 0.5),
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //         child: SingleChildScrollView(
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               SizedBox(height: 20),
                //               Text(
                //                 "Wellome !",
                //                 style: TextStyle(
                //                     fontSize: 26, color: Colors.white),
                //               ),
                //               SizedBox(
                //                 height: 20,
                //               ),
                //               Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 8),
                //                 child: Text(
                //                   textAlign: TextAlign.center,
                //                   "You can find Your OCWC in information by scan card and by your full name\n",
                //                   style: TextStyle(
                //                       fontSize: 18, color: Colors.white),
                //                 ),
                //               ),
                //               InkWell(
                //                 onTap: () {
                //                   Get.toNamed("/scanqr");
                //                 },
                //                 child: Container(
                //                   width: 350,
                //                   height: 60,
                //                   padding: EdgeInsets.only(
                //                       left: 6, top: 6, bottom: 6),
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(20),
                //                     color: Colors.white,
                //                   ),
                //                   child: Row(
                //                     children: [
                //                       Container(
                //                         width: 50,
                //                         height: 50,
                //                         padding: EdgeInsets.all(8),
                //                         decoration: BoxDecoration(
                //                           color:
                //                               Color.fromARGB(255, 71, 122, 211),
                //                           shape: BoxShape.circle,
                //                         ),
                //                         child: Image.asset(
                //                           "assets/icons/credit-card.png",
                //                           width: 30,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         width: 20,
                //                       ),
                //                       Text(
                //                         "Scan Card",
                //                         style: TextStyle(
                //                           fontWeight: FontWeight.bold,
                //                           color:
                //                               Color.fromARGB(255, 71, 122, 211),
                //                           fontSize: 18,
                //                         ),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //               InkWell(
                //                 onTap: () {
                //                   controller.selectOption("search");
                //                 },
                //                 child: Container(
                //                   margin: EdgeInsets.all(10),
                //                   width: 350,
                //                   height: 60,
                //                   padding: EdgeInsets.only(
                //                       left: 6, top: 6, bottom: 6),
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(20),
                //                     color: Colors.white,
                //                   ),
                //                   child: Row(
                //                     children: [
                //                       Container(
                //                         width: 50,
                //                         height: 50,
                //                         padding: EdgeInsets.all(8),
                //                         decoration: BoxDecoration(
                //                           color:
                //                               Color.fromARGB(255, 71, 122, 211),
                //                           shape: BoxShape.circle,
                //                         ),
                //                         child: Image.asset(
                //                           "assets/icons/edit.png",
                //                           width: 40,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         width: 20,
                //                       ),
                //                       Text(
                //                         "Search Name",
                //                         style: TextStyle(
                //                           fontWeight: FontWeight.bold,
                //                           color:
                //                               Color.fromARGB(255, 71, 122, 211),
                //                           fontSize: 18,
                //                         ),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 20,
                //               ),
                //             ],
                //           ),
                //         ),
                //       )),
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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: const [
                            //     // IconButton(
                            //     //     onPressed: () {
                            //     //       controller.isSearchName.value = false;
                            //     //     },
                            //     //     icon: Icon(
                            //     //       Icons.arrow_back,
                            //     //       color: Colors.white,
                            //     //     )),
                            //     // Obx(() {
                            //     //   return Switch(
                            //     //       trackColor: MaterialStateProperty.all(
                            //     //           Colors.grey),
                            //     //       activeColor: Colors.white,
                            //     //       inactiveThumbColor: Colors.white,
                            //     //       activeThumbImage: const AssetImage(
                            //     //         'assets/images/english_flag.png',
                            //     //       ),
                            //     //       inactiveThumbImage: const AssetImage(
                            //     //         'assets/images/cambodia_flag.png',
                            //     //       ),
                            //     //       value: controller.changValue.value,
                            //     //       onChanged: (value) {
                            //     //         controller.changeLang(value);
                            //     //       });
                            //     // }),
                            //   ],
                            // ),
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
                  // Obx(() => controller.isScanCard.value ||
                  //         controller.isSearchName.value
                  //     ? SizedBox()
                  //     : Container(
                  //         width: 400,
                  //         margin: EdgeInsets.symmetric(
                  //             vertical: 10, horizontal: 20),
                  //         decoration: BoxDecoration(
                  //           color: Color.fromRGBO(35, 54, 93, 0.5),
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //         child: SingleChildScrollView(
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               SizedBox(height: 20),
                  //               Text(
                  //                 "Wellome !",
                  //                 style: TextStyle(
                  //                     fontSize: 26, color: Colors.white),
                  //               ),
                  //               SizedBox(
                  //                 height: 20,
                  //               ),
                  //               Padding(
                  //                 padding:
                  //                     const EdgeInsets.symmetric(horizontal: 8),
                  //                 child: Text(
                  //                   textAlign: TextAlign.center,
                  //                   "You can find Your OCWC in information by scan card and by your full name\n",
                  //                   style: TextStyle(
                  //                       fontSize: 18, color: Colors.white),
                  //                 ),
                  //               ),
                  //               InkWell(
                  //                 onTap: () {
                  //                   Get.toNamed("/scanqr");
                  //                 },
                  //                 child: Container(
                  //                   width: 350,
                  //                   height: 60,
                  //                   padding: EdgeInsets.only(
                  //                       left: 6, top: 6, bottom: 6),
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(20),
                  //                     color: Colors.white,
                  //                   ),
                  //                   child: Row(
                  //                     children: [
                  //                       Container(
                  //                         width: 50,
                  //                         height: 50,
                  //                         padding: EdgeInsets.all(8),
                  //                         decoration: BoxDecoration(
                  //                           color: Color.fromARGB(
                  //                               255, 71, 122, 211),
                  //                           shape: BoxShape.circle,
                  //                         ),
                  //                         child: Image.asset(
                  //                           "assets/icons/credit-card.png",
                  //                           width: 30,
                  //                           color: Colors.white,
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         width: 20,
                  //                       ),
                  //                       Text(
                  //                         "Scan Card",
                  //                         style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Color.fromARGB(
                  //                               255, 71, 122, 211),
                  //                           fontSize: 18,
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               InkWell(
                  //                 onTap: () {
                  //                   controller.selectOption("search");
                  //                 },
                  //                 child: Container(
                  //                   margin: EdgeInsets.all(10),
                  //                   width: 350,
                  //                   height: 60,
                  //                   padding: EdgeInsets.only(
                  //                       left: 6, top: 6, bottom: 6),
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(20),
                  //                     color: Colors.white,
                  //                   ),
                  //                   child: Row(
                  //                     children: [
                  //                       Container(
                  //                         width: 50,
                  //                         height: 50,
                  //                         padding: EdgeInsets.all(8),
                  //                         decoration: BoxDecoration(
                  //                           color: Color.fromARGB(
                  //                               255, 71, 122, 211),
                  //                           shape: BoxShape.circle,
                  //                         ),
                  //                         child: Image.asset(
                  //                           "assets/icons/edit.png",
                  //                           width: 40,
                  //                           color: Colors.white,
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         width: 20,
                  //                       ),
                  //                       Text(
                  //                         "Search Name",
                  //                         style: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Color.fromARGB(
                  //                               255, 71, 122, 211),
                  //                           fontSize: 18,
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 height: 20,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       )),

                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  //   width: 400,
                  //   decoration: BoxDecoration(
                  //     color: Color.fromRGBO(35, 54, 93, 0.5),
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Form(
                  //     key: formKey,
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 20, vertical: 10),
                  //       child: Column(
                  //           children: [
                  //         SizedBox(height: 20),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.end,
                  //           children: [
                  //             Obx(() {
                  //               return Switch(
                  //                   trackColor:
                  //                       MaterialStateProperty.all(Colors.grey),
                  //                   activeColor: Colors.white,
                  //                   inactiveThumbColor: Colors.white,
                  //                   activeThumbImage: const AssetImage(
                  //                     'assets/images/cambodia_flag.png',
                  //                   ),
                  //                   inactiveThumbImage: const AssetImage(
                  //                     'assets/images/english_flag.png',
                  //                   ),
                  //                   value: controller.changValue.value,
                  //                   onChanged: (value) {
                  //                     controller.changeLang(value);
                  //                   });
                  //             }),
                  //           ],
                  //         ),
                  //         Text(
                  //           "title".tr,
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //               fontSize: 22,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w300,
                  //               fontFamily: controller.langCode == "en"
                  //                   ? "SourceSansPro-Regular"
                  //                   : "Battambang"),
                  //         ),
                  //         Text(
                  //           "subTitle".tr,
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 16,
                  //               fontFamily: controller.langCode == "en"
                  //                   ? "SourceSansPro-Regular"
                  //                   : "Battambang"),
                  //         ),
                  //         //Image.asset("assets/images/card_image.png"),
                  //         TextFieldWidget(
                  //           onFieldSubmitted: (val) {
                  //             controller.setNameController = val;
                  //             submit(context);
                  //           },
                  //           prefixIcon: Padding(
                  //             padding: const EdgeInsets.all(8),
                  //             child: Image.asset(
                  //               width: 10,
                  //               "assets/icons/id-card.png",
                  //               color: Colors.blueGrey,
                  //             ),
                  //           ),
                  //           errorStyle: TextStyle(
                  //               fontSize: 14,
                  //               fontFamily: controller.langCode == "en"
                  //                   ? "SourceSansPro-Regular"
                  //                   : "Battambang"),
                  //           hintStyle: TextStyle(
                  //               fontSize: 14,
                  //               fontFamily: controller.langCode == "en"
                  //                   ? "SourceSansPro-Regular"
                  //                   : "Battambang"),
                  //           validator: (val) {
                  //             if (val == null || val.isEmpty) {
                  //               return "nameWarning".tr;
                  //             } else {
                  //               return null;
                  //             }
                  //           },
                  //           controller: controller.nameController,
                  //           hintText: "latin".tr,
                  //         ),
                  //         TextFieldWidget(
                  //           controller: controller.dateController,
                  //           hintText: "DD/MM/YYYY",
                  //           errorStyle: TextStyle(
                  //               fontSize: 14,
                  //               fontFamily: controller.langCode == "en"
                  //                   ? "SourceSansPro-Regular"
                  //                   : "Battambang"),
                  //           hintStyle: TextStyle(
                  //               fontSize: 14,
                  //               fontFamily: controller.langCode == "en"
                  //                   ? "SourceSansPro-Regular"
                  //                   : "Battambang"),
                  //           prefixIcon: Padding(
                  //             padding: const EdgeInsets.all(10),
                  //             child: Image.asset(
                  //               width: 10,
                  //               "assets/icons/calendar.png",
                  //               color: Colors.blueGrey,
                  //             ),
                  //           ),
                  //           suffixIcon: IconButton(
                  //               onPressed: () async {
                  //                 controller.showDialogPicker(context);
                  //               },
                  //               icon: const Icon(
                  //                 Icons.date_range,
                  //                 color: Colors.blueGrey,
                  //               )),
                  //           validator: (val) {
                  //             if (val == null || val.isEmpty) {
                  //               return "dateWarning".tr;
                  //             } else if (!validateDate(val)) {
                  //               return "dateMatch".tr;
                  //             } else {
                  //               return null;
                  //             }
                  //           },
                  //           onFieldSubmitted: (val) {
                  //             controller.setDateController = val;
                  //             submit(context);
                  //           },
                  //           inputFormatters: [
                  //             MaskTextInputFormatter(
                  //               mask: '##/##/####',
                  //               filter: {"#": RegExp(r'[0-9]')},
                  //               type: MaskAutoCompletionType.lazy,
                  //             )
                  //           ],
                  //         ),
                  //         InkWell(
                  //           onTap: () {
                  //             submit(context);
                  //           },
                  //           child: Container(
                  //             alignment: Alignment.center,
                  //             height: 45,
                  //             decoration: BoxDecoration(
                  //                 color: Colors.blue,
                  //                 borderRadius: BorderRadius.circular(10)),
                  //             child: Text("track".tr,
                  //                 style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 14,
                  //                     fontFamily: controller.langCode == "en"
                  //                         ? "SourceSansPro-Regular"
                  //                         : "Battambang")),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 50,
                  //         ),
                  //       ].withSpaceBetween(height: 20)),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          );
        }
      },
    ));
  }

//  body: Center(child: SingleChildScrollView(child: _buildBody(context))),

  Widget _buildBody(context) {
    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 400,
        height: 500,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  // Obx(() {
                  //   return Switch(
                  //       trackColor: MaterialStateProperty.all(Colors.grey),
                  //       activeColor: Colors.white,
                  //       inactiveThumbColor: Colors.white,
                  //       activeThumbImage: const AssetImage(
                  //         'assets/images/cambodia_flag.png',
                  //       ),
                  //       inactiveThumbImage: const AssetImage(
                  //         'assets/images/english_flag.png',
                  //       ),
                  //       value: controller.changValue.value,
                  //       onChanged: (value) {
                  //         controller.changeLang(value);
                  //       });
                  // }),
                ],
              ),
              SizedBox(
                height: 30,
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
              SizedBox(
                height: 10,
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
              SizedBox(
                height: 40,
              ),
              TextFieldWidget(
                onFieldSubmitted: (val) {
                  controller.setNameController = val;
                  submit(context);
                },
                errorStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                labelStyle: TextStyle(
                    fontSize: 16,
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
                labelText: "latin".tr,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                controller: controller.dateController,
                labelText: "date".tr,
                hintText: "DD/MM/YYYY",
                errorStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                labelStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                suffixIcon: IconButton(
                    onPressed: () async {
                      controller.showDialogPicker(context);
                    },
                    icon: const Icon(
                      Icons.date_range,
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
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  submit(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("track".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: controller.langCode == "en"
                              ? "SourceSansPro-Regular"
                              : "Battambang")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry A')),
            ),
          ),
          const Divider(),
          Container(
            height: 50,
            color: Colors.amber[200],
            child: const Center(child: Text('Entry B')),
          ),
          const Divider(),
          Container(
            height: 50,
            color: Colors.amber[300],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
