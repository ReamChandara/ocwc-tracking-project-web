import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/scanner_controller.dart';

import '../../config/routes/app_route.dart';
import '../../widget/popup_menu_widget.dart';
import '../worker/scan_worker_screen.dart';

class ScanRecruiterCardScreen extends GetView<ScannerController> {
  const ScanRecruiterCardScreen({super.key});

  Widget buildAppbar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                RouteView.scanRecruiterCard.go(
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
    );
  }

  _buildBody(BoxConstraints boxConstraints) {
    return Row(
      children: [
        boxConstraints.maxWidth > 850
            ? Expanded(
                child: SizedBox(
                  height: 400,
                  width: 400,
                  child: Image.asset(
                    "assets/images/splash_logo_new.png",
                  ),
                ),
              )
            : const SizedBox(),
        Expanded(
          child: Column(
            children: [
              boxConstraints.maxWidth < 850
                  ? SizedBox(
                      width: 300,
                      child: Image.asset(
                        "assets/images/splash_logo_new.png",
                      ),
                    )
                  : const SizedBox(),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(35, 54, 93, 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  width: 400,
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "scancardTitle".tr,
                      style: const TextStyle(
                          fontFamily: "Battambang",
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Text(
                      "scansubtitle".tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: "Battambang",
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const BuildQRWidget(),
                    const SizedBox(height: 10),
                    Obx(
                      () => controller.qrValid.value.isEmpty
                          ? const SizedBox()
                          : Text(
                              controller.qrValid.value,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontFamily: "Battambang",
                                  fontSize: 14),
                            ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                iconSize: 26,
                                onPressed: () async {
                                  controller.clearImage();
                                },
                                icon: const Icon(
                                  Icons.qr_code,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                "បើកQR",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Battambang",
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                iconSize: 26,
                                onPressed: () {
                                  controller.pickImage();
                                },
                                icon: const Icon(
                                  Icons.image_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "openimage".tr,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Battambang",
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                iconSize: 26,
                                onPressed: () async {
                                  controller.switchCamera();
                                },
                                icon: const Icon(
                                  Icons.camera_front_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "switchCam".tr,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Battambang",
                                    color: Colors.white),
                              )
                            ],
                          )
                        ].withSpaceBetween(width: 10),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, boxConstraints) {
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
          child: Column(children: [
            buildAppbar(),
            boxConstraints.maxWidth > 850
                ? SizedBox(
                    height: boxConstraints.maxHeight * 0.10,
                  )
                : const SizedBox(),
            _buildBody(boxConstraints)
          ]),
        ),
      );
    }));
  }
}
