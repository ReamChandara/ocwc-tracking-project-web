import 'package:cloudflare_turnstile/cloudflare_turnstile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/agency_controller.dart';
import '../config/constant/string_constant.dart';
import '../controller/home_controller.dart';
import '../widget/dialog_widget.dart';
import '../widget/popup_menu_widget.dart';
import '../widget/textfield_widget.dart';

class FindingAgency extends StatefulWidget {
  const FindingAgency({super.key});

  @override
  State<FindingAgency> createState() => _FindingAgencyState();
}

class _FindingAgencyState extends State<FindingAgency> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late HomeController homeController;
  final AgencyController agencyController = Get.put(AgencyController());
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  double scrollPosition = 0;
  late Future<DateTime?> selectedDate;

  void submit(BuildContext context) {
    if (validation()) {
    } else {
      DialogWidget.laodingDailog(context, homeController.langCode.value);
      agencyController.findingAgency(context, nameController.text,
          langCode: homeController.langCode.value);
    }
  }

  setDate() async {
    DialogWidget.showDialogPicker(
      context,
      homeController.langCode.value == "en"
          ? "SourceSansPro-Regular"
          : "Battambang",
    ).then((value) {
      dateController.text = DateFormat("dd/MM/yyyy").format(value);
    });
  }

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

  final FocusNode _focusNode1 = FocusNode();
  final ScrollController _scrollController = ScrollController();

  // void _scrollToFocusedNode(FocusNode focusNode) {
  //   if (focusNode.hasFocus) {
  //     _scrollController.animateTo(
  //       focusNode.offset.dy,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }

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
            child: GestureDetector(
              onTap: () {
                _focusNode1.unfocus();
              },
              child: ListView(
                controller: _scrollController,
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
                    if (boxConstraints.maxWidth > 850) {
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

  Widget buidCardSearch(BuildContext context) {
    return Container(
      width: 400,
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
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "findagentcy".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: homeController.langCode.value == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
              ),
              Text(
                "agentcytitle".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: homeController.langCode.value == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
              ),
              TextFieldWidget(
                controller: nameController,
                onFieldSubmitted: (val) {
                  if (agencyController.cloudFlare.value) {
                    submit(context);
                  }
                },
                onTap: () {
                  // _scrollToFocusedNode(_focusNode1);
                },
                // focusNode: _focusNode1,
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
                    return "nameWarning".tr;
                  } else {
                    return null;
                  }
                },
                hintText: "agentcyhint".tr,
              ),
              Obx(
                () => agencyController.cloudFlare.value
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
                          await agencyController.verifyCloudFlare(token);
                        },
                      ),
              ),
              // InkWell(
              //   onTap: () {
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
              // Obx(
              //   () => workerController.cloudFlare.value
              //       ? InkWell(
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
              //                     fontFamily:
              //                         homeController.langCode.value == "en"
              //                             ? "SourceSansPro-Regular"
              //                             : "Battambang")),
              //           ),
              //         )
              //       : CloudFlareTurnstile(
              //           options: TurnstileOptions(
              //             theme: TurnstileTheme.light,
              //             retryAutomatically: false,
              //           ),
              //           siteKey: siteKey,
              //           onTokenRecived: (token) async {
              //             await workerController.verifyCloudFlare(token);
              //           },
              //         ),
              // )
            ].withSpaceBetween(height: 10),
          ),
        ),
      ),
    );
  }
}
