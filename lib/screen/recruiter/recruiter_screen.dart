import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/home_controller.dart';
import 'package:tracking_web/controller/recruiter/recruiter_controller.dart';
import 'package:tracking_web/widget/dialog_widget.dart';

import '../../config/routes/app_route.dart';
import '../../widget/popup_menu_widget.dart';

class RecruiterScreen extends StatefulWidget {
  const RecruiterScreen({super.key});

  @override
  State<RecruiterScreen> createState() => _RecruiterScreenState();
}

class _RecruiterScreenState extends State<RecruiterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final ScrollController _scrollController = ScrollController();

  late final HomeController homeController;

  final controller = Get.put(RecruiterController());

  TextEditingController nameController = TextEditingController();

  void submit(BuildContext context) async {
    if (validation()) {
    } else {
      DialogWidget.laodingDailog(context, homeController.langCode.value);
      await controller.findRecruiter(context, nameController.text,
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

  Widget buildWebUI(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/splash_logo_new.png",
            width: 400,
          ),
          buildFindOption()
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
        buildFindOption(),
        const SizedBox(height: 10)
      ],
    );
  }

  // Widget buidCardSearch(BuildContext context) {
  //   return Container(
  //     width: 400,
  //     padding: const EdgeInsets.only(bottom: 20),
  //     margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  //     decoration: BoxDecoration(
  //       color: const Color.fromRGBO(35, 54, 93, 0.5),
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Form(
  //       key: formKey,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20),
  //         child: Column(
  //           children: [
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               "agentcytitle".tr,
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 18,
  //                   fontFamily: homeController.langCode.value == "en"
  //                       ? "SourceSansPro-Regular"
  //                       : "Battambang"),
  //             ),
  //             TextFieldWidget(
  //               controller: nameController,
  //               onFieldSubmitted: (val) {
  //                 if (controller.cloudFlare.value) {
  //                   submit(context);
  //                 }
  //               },
  //               onTap: () {},
  //               prefixIcon: Padding(
  //                 padding: const EdgeInsets.all(8),
  //                 child: Image.asset(
  //                   width: 10,
  //                   "assets/icons/id-card.png",
  //                   color: Colors.blueGrey,
  //                 ),
  //               ),
  //               errorStyle: TextStyle(
  //                   fontSize: 14,
  //                   fontFamily: homeController.langCode.value == "en"
  //                       ? "SourceSansPro-Regular"
  //                       : "Battambang"),
  //               hintStyle: TextStyle(
  //                   fontSize: 14,
  //                   fontFamily: homeController.langCode.value == "en"
  //                       ? "SourceSansPro-Regular"
  //                       : "Battambang"),
  //               validator: (val) {
  //                 if (val == null || val.isEmpty) {
  //                   return "nameWarning".tr;
  //                 } else {
  //                   return null;
  //                 }
  //               },
  //               hintText: "agentcyhint".tr,
  //             ),
  //             // Column(
  //             //   children: [
  //             //     InkWell(
  //             //       onTap: () {
  //             //         submit(context);
  //             //       },
  //             //       child: Container(
  //             //         alignment: Alignment.center,
  //             //         height: 45,
  //             //         decoration: BoxDecoration(
  //             //             color: Colors.blue,
  //             //             borderRadius: BorderRadius.circular(10)),
  //             //         child: Text("track".tr,
  //             //             style: TextStyle(
  //             //                 color: Colors.white,
  //             //                 fontSize: 14,
  //             //                 fontFamily: homeController.langCode.value == "en"
  //             //                     ? "SourceSansPro-Regular"
  //             //                     : "Battambang")),
  //             //       ),
  //             //     ),
  //             //   ].withSpaceBetween(height: 10),
  //             // ),
  //             Obx(
  //               () => controller.cloudFlare.value
  //                   ? InkWell(
  //                       onTap: () {
  //                         submit(context);
  //                       },
  //                       child: Container(
  //                         alignment: Alignment.center,
  //                         height: 45,
  //                         decoration: BoxDecoration(
  //                             color: Colors.blue,
  //                             borderRadius: BorderRadius.circular(10)),
  //                         child: Text("track".tr,
  //                             style: TextStyle(
  //                                 color: Colors.white,
  //                                 fontSize: 14,
  //                                 fontFamily:
  //                                     homeController.langCode.value == "en"
  //                                         ? "SourceSansPro-Regular"
  //                                         : "Battambang")),
  //                       ),
  //                     )
  //                   : CloudFlareTurnstile(
  //                       options: TurnstileOptions(
  //                         theme: TurnstileTheme.light,
  //                         retryAutomatically: false,
  //                       ),
  //                       siteKey: siteKey,
  //                       onTokenRecived: (token) async {
  //                         await controller.verifyCloudFlare(token);
  //                       },
  //                     ),
  //             )
  //           ].withSpaceBetween(height: 16),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget buildFindOption() {
    return Container(
      width: 400,
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(35, 54, 93, 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(children: [
              Text(
                "findrecruiter".tr,
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
                "findby".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Battambang"),
              ),
            ]),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    RouteView.findRecruiter.go();
                  },
                  child: Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "inputrecruiter".tr,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: homeController.langCode.value == "en"
                              ? "SourceSansPro-Regular"
                              : "Battambang"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    RouteView.scanRecruiterCard.go(
                      parameters: {"type": "recruiter"},
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "scanrecruiter".tr,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: homeController.langCode.value == "en"
                              ? "SourceSansPro-Regular"
                              : "Battambang"),
                    ),
                  ),
                ),
              ].withSpaceBetween(height: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    homeController = Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          RouteView.home.go(
                            backRoutes: RouteView.home.name,
                          );
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
        );
      }),
    );
  }
}
