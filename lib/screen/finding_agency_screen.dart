import 'package:cloudflare_turnstile/cloudflare_turnstile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/constant/string_constant.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/config/theme/app_theme.dart';
import 'package:tracking_web/controller/home_controller.dart';
import 'package:tracking_web/widget/dialog_widget.dart';
import '../config/routes/app_route.dart';
import '../controller/agency_controller.dart';
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
  final FocusNode _focusNode2 = FocusNode();
  final ScrollController _scrollController = ScrollController();

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
              _focusNode2.unfocus();
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
                            RouteView.home.go(backRoutes: RouteView.home.name);
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
          ),
        );
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
                onTap: () {},
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
                () => agencyController.cloudFlare.value
                    ? Column(
                        children: [
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
                                      fontFamily:
                                          homeController.langCode.value == "en"
                                              ? "SourceSansPro-Regular"
                                              : "Battambang")),
                            ),
                          ),
                          Text("or".tr,
                              style: AppTextStyle.regular16(
                                  fontFamily:
                                      homeController.langCode.value == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang",
                                  color: Colors.white)),
                          InkWell(
                            onTap: () {
                              agencyController.findingAgency(context, "");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text("agencylist".tr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily:
                                        homeController.langCode.value == "en"
                                            ? "SourceSansPro-Regular"
                                            : "Battambang",
                                  )),
                            ),
                          )
                        ].withSpaceBetween(height: 10),
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
              )
            ].withSpaceBetween(height: 16),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
