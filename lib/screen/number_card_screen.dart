import 'package:cloudflare_turnstile/cloudflare_turnstile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tracking_web/config/constant/string_constant.dart';
import '../config/theme/app_theme.dart';
import '../controller/home_controller.dart';
import '../controller/new_worker_controller.dart';
import '../widget/dialog_widget.dart';
import '../widget/popup_menu_widget.dart';
import '../widget/textfield_widget.dart';

class NumberCardScreen extends StatefulWidget {
  const NumberCardScreen({super.key});

  @override
  State<NumberCardScreen> createState() => _NumberCardScreenState();
}

class _NumberCardScreenState extends State<NumberCardScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  late HomeController homeController;

  late NewWorkerController workerController = Get.put(NewWorkerController());

  void submit(BuildContext context) {
    if (validation()) {
    } else {
      DialogWidget.laodingDailog(context, homeController.langCode.value);
      workerController.findWorkerByNumberCard(context, numberController.text,
          langCode: homeController.langCode.value);
    }
  }

  bool validation() {
    if (formKey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    homeController = Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, boxConstraints) {
        return Container(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpg"),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        const PopupMenuWidget(),
                      ],
                    ),
                  ),
                  () {
                    if (boxConstraints.maxWidth > 856) {
                      return Column(
                        children: [
                          SizedBox(
                            height: boxConstraints.maxHeight * 0.20,
                          ),
                          buildWebUI(context),
                        ],
                      );
                    } else {
                      return _buildPhoneUI(context);
                    }
                  }(),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  )
                ],
              ),
            ));
      }),
    );
  }

  Widget buildWebUI(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/splash_logo_new.png",
            width: 400,
          ),
          buidCardSearch(context),
        ],
      ),
    );
  }

  Widget _buildPhoneUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Image.asset(
          "assets/images/splash_logo_new.png",
          width: 300,
        ),
        const SizedBox(height: 20),
        buidCardSearch(context),
        const SizedBox(height: 10)
      ],
    );
  }

  dialogShowImage({required BuildContext context}) {
    Alert(
        title: "របៀបស្វែងរកលេខកាត",
        style: AlertStyle(
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: homeController.langCode.value == "en"
                ? "SourceSansPro-Regular"
                : "Battambang",
          ),
          descStyle: TextStyle(
            fontSize: 14,
            fontFamily: homeController.langCode.value == "en"
                ? "SourceSansPro-Regular"
                : "Battambang",
          ),
          // descPadding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          animationType: AnimationType.grow,
          overlayColor: Colors.grey.shade100.withOpacity(0.9),
        ),
        content: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ជ្រើសរើសលេខកូដនៅកន្លែងគូសប្រអប់ព៏ណក្រហម​ (លេខ1)(ឧ.ហ​ KH-MOU)",
                  style: AppTextStyle.regular14(),
                ),
                Text(
                  "បញ្ចូលេខកូដ8ខ្ទង់នៅកន្លែងគូសប្រអប់ព៏ណក្រហម(លេខ2)(ឧ.ហ​ 00461287)",
                  style: AppTextStyle.regular14(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 400,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/ocwc_card1.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
        context: context,
        buttons: [
          DialogButton(
              color: const Color.fromARGB(255, 71, 122, 211),
              child: Text(
                "close".tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: homeController.langCode.value == "en"
                      ? "SourceSansPro-Regular"
                      : "Battambang",
                ),
              ),
              onPressed: () {
                Get.back();
              })
        ]).show();
  }

  Widget buidCardSearch(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(35, 54, 93, 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "title".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: homeController.langCode.value == "en"
                      ? "SourceSansPro-Regular"
                      : "Battambang"),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "numbercardtile".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: homeController.langCode.value == "en"
                      ? "SourceSansPro-Regular"
                      : "Battambang"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              controller: numberController,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  width: 10,
                  "assets/icons/id-card.png",
                  color: Colors.blueGrey,
                ),
              ),
              onFieldSubmitted: (val) {
                if (workerController.cloudFlare.value) {
                  submit(context);
                }
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              errorStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: homeController.langCode.value == "en"
                      ? "SourceSansPro-Regular"
                      : "Battambang"),
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: homeController.langCode.value == "en"
                      ? "SourceSansPro-Regular"
                      : "Battambang"),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "cardnumbervalidate".tr;
                } else if (val.length != 6) {
                  return "cardnumberlengthvalidate".tr;
                } else {
                  return null;
                }
              },
              hintText: "numbercardhint".tr,
            ),
            // Table(columnWidths: const {
            //   0: FixedColumnWidth(130),
            // }, children: [
            //   TableRow(children: [
            //     TableCell(
            //       child: Obx(
            //         () => DropdownWidget<String>(
            //           hintText: "selectprefix".tr,
            //           maxHeight: 200,
            //           items: workerController.prefixCodes,
            //           selectedItem:
            //               workerController.prefixCodeSelected.value.isEmpty
            //                   ? null
            //                   : workerController.prefixCodeSelected.value,
            //           validator: (val) {
            //             if (val == null || val.isEmpty) {
            //               return "The prefix field\nis required.";
            //             } else {
            //               return null;
            //             }
            //           },
            //           onChanged: (val) {
            //             workerController.onChange(val!);
            //           },
            //           itemBuilder: (context, code, selected) {
            //             return Container(
            //               alignment: Alignment.centerLeft,
            //               margin: const EdgeInsets.only(top: 10),
            //               padding: const EdgeInsets.only(
            //                   left: 16, right: 10, bottom: 10),
            //               child: Text(
            //                 code,
            //                 style: AppTextStyle.regular14(color: Colors.black),
            //               ),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     TableCell(
            //       child: TextFieldWidget(
            //         controller: numberController,
            //         border: const OutlineInputBorder(
            //             borderRadius: BorderRadius.only(
            //                 topRight: Radius.circular(10),
            //                 bottomRight: Radius.circular(10))),
            //         errorStyle: TextStyle(
            //             fontSize: 14,
            //             fontFamily: homeController.langCode.value == "en"
            //                 ? "SourceSansPro-Regular"
            //                 : "Battambang"),
            //         hintStyle: TextStyle(
            //             fontSize: 14,
            //             fontFamily: homeController.langCode.value == "en"
            //                 ? "SourceSansPro-Regular"
            //                 : "Battambang"),
            //         validator: (val) {
            //           if (val == null || val.isEmpty) {
            //             return "cardnumbervalidate".tr;
            //           } else if (val.length < 8) {
            //             return "cardnumberlengthvalidate".tr;
            //           } else {
            //             return null;
            //           }
            //         },
            //         hintText: "numbercardhint".tr,
            //       ),
            //     ),
            //   ])
            // ]),

            const SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const SizedBox(),
            //     TextButton(
            //       onPressed: () {
            //         dialogShowImage(context: context);
            //       },
            //       child: Text(
            //         "help".tr,
            //         style: AppTextStyle.regular14(color: Colors.white),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // InkWell(
            //   onTap: () async {
            //     submit(context);
            //   },
            //   child: Container(
            //     alignment: Alignment.center,
            //     height: 45,
            //     decoration: BoxDecoration(
            //         color: Colors.blue,
            //         borderRadius: BorderRadius.circular(10)),
            //     child: Text("track".tr,
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 14,
            //             fontFamily: homeController.langCode.value == "en"
            //                 ? "SourceSansPro-Regular"
            //                 : "Battambang")),
            //   ),
            // )
            Obx(
              () => workerController.cloudFlare.value
                  ? InkWell(
                      onTap: () async {
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
                                fontFamily:
                                    homeController.langCode.value == "en"
                                        ? "SourceSansPro-Regular"
                                        : "Battambang")),
                      ),
                    )
                  : CloudFlareTurnstile(
                      options: TurnstileOptions(
                        theme: TurnstileTheme.light,
                        retryAutomatically: false,
                      ),
                      siteKey: siteKey,
                      onTokenRecived: (token) async {
                        await workerController.verifyCloudFlare(token);
                      },
                    ),
            )
          ]),
        ),
      ),
    );
  }
}
