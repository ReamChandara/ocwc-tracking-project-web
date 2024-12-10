import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/home_controller.dart';

import '../../config/routes/app_route.dart';
import '../../widget/popup_menu_widget.dart';

class FindOCWCMember extends GetView<HomeController> {
  const FindOCWCMember({super.key});

  Widget buildAppbar() {
    return Padding(
      padding: const EdgeInsets.all(16),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          return Container(
            // alignment: Alignment.center,
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
                buildAppbar(),
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
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buidOptionSearch(BuildContext context) {
    return Container(
      // height: 400,
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
                "findocwc".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontFamily: controller.langCode.value == "en"
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
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.numberCard);
                    RouteView.numberCard.go();
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
                      "enternumbercard".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: controller.langCode.value == "en"
                              ? "SourceSansPro-Regular"
                              : "Battambang"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.searchwoker);
                    RouteView.searchWorker.go();
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
                      "enterdate".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: controller.langCode.value == "en"
                              ? "SourceSansPro-Regular"
                              : "Battambang"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.scanWorker);
                    RouteView.scanWorker.go();
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
                      "scancard".tr,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: controller.langCode.value == "en"
                              ? "SourceSansPro-Regular"
                              : "Battambang"),
                    ),
                  ),
                ),
              ].withSpaceBetween(height: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWebUI(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "assets/images/splash_logo_new.png",
          width: 400,
        ),
        buidOptionSearch(context),
      ],
    );
  }

  Widget _buildPhoneUI(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            "assets/images/splash_logo_new.png",
            width: 300,
          ),
        ),
        const SizedBox(height: 20),
        buidOptionSearch(context),
        const SizedBox(height: 20),
      ],
    );
  }
}
