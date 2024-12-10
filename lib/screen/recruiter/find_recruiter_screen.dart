import 'package:cloudflare_turnstile/cloudflare_turnstile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/constant/string_constant.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/config/routes/app_route.dart';
import 'package:tracking_web/widget/popup_menu_widget.dart';

import '../../controller/home_controller.dart';
import '../../controller/recruiter/recruiter_controller.dart';
import '../../widget/dialog_widget.dart';
import '../../widget/textfield_widget.dart';

class FindRecruiterScreen extends StatefulWidget {
  const FindRecruiterScreen({super.key});

  @override
  State<FindRecruiterScreen> createState() => _FindRecruiterScreenState();
}

final controller = Get.put(RecruiterController());
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final HomeController homeController = Get.put(HomeController());
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

class _FindRecruiterScreenState extends State<FindRecruiterScreen> {
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
                "recruitertitle".tr,
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
                  if (controller.cloudFlare.value) {
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
              Obx(
                () => controller.cloudFlare.value
                    ? InkWell(
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
                      )
                    : CloudFlareTurnstile(
                        options: TurnstileOptions(
                          theme: TurnstileTheme.light,
                          retryAutomatically: false,
                        ),
                        siteKey: siteKey,
                        onTokenRecived: (token) async {
                          await controller.verifyCloudFlare(token);
                        },
                      ),
              )
            ].withSpaceBetween(height: 16),
          ),
        ),
      ),
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
          buidCardSearch(context)
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
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          RouteView.recruiter.go(
                            backRoutes: RouteView.recruiter.name,
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
