import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tracking_web/config/helper/function.dart';

import '../controller/scanner_controller.dart';
import '../widget/popup_menu_widget.dart';

class ScanWorkerScreen extends GetView<ScannerController> {
  const ScanWorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          double contraintsWidth = boxConstraints.maxWidth;
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
                    contraintsWidth > 1000
                        ? SizedBox(
                            height: boxConstraints.maxHeight * 0.10,
                          )
                        : const SizedBox(),
                    contraintsWidth < 1000
                        ? Image.asset(
                            "assets/images/splash_logo_new.png",
                            width: 250,
                          )
                        : const SizedBox(),
                    Row(
                        mainAxisAlignment: contraintsWidth > 1000
                            ? MainAxisAlignment.spaceEvenly
                            : MainAxisAlignment.center,
                        children: [
                          contraintsWidth > 1000
                              ? Image.asset(
                                  "assets/images/splash_logo_new.png",
                                  width: 400,
                                )
                              : const SizedBox(),
                          Container(
                            width: 400,
                            height: 550,
                            padding: const EdgeInsets.only(bottom: 20),
                            margin: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(35, 54, 93, 0.5),
                            ),
                            child: Column(
                              children: [
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
                                  style: const TextStyle(
                                      fontFamily: "Battambang",
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                                const BuildQRWidget(),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                              ].withSpaceBetween(height: 10),
                            ),
                          )
                        ]),
                  ],
                ),
              )
              // child: () {
              //   if (boxConstraints.maxWidth > 1200) {
              //     return BuildWebUI(
              //       controller: controller,
              //     );
              //   } else {
              //     return const BuildPhoneUI();
              //   }
              // }(),
              );
        },
      ),
    );
  }
}

class BuildWebUI extends StatelessWidget {
  const BuildWebUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                "assets/images/splash_logo_new.png",
                width: 350,
              ),
              const SizedBox(height: 10),
              Container(
                width: 360,
                height: 500,
                padding: const EdgeInsets.only(bottom: 20),
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(35, 54, 93, 0.5),
                ),
                child: Column(
                  children: [
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
                      style: const TextStyle(
                          fontFamily: "Battambang",
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    const BuildQRWidget(),
                  ].withSpaceBetween(height: 10),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class BuildQRWidget extends GetView<ScannerController> {
  const BuildQRWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(255, 71, 122, 211),
        ),
      ),
      child: MobileScanner(
        controller: controller.mobileScanner,
        errorBuilder: (context, error, child) {
          return ScannerErrorWidget(error: error);
        },
      ),
    );
  }
}

class BuildPhoneUI extends StatelessWidget {
  const BuildPhoneUI({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/splash_logo_new.png",
          width: 250,
        ),
        const SizedBox(height: 10),
        // buildQrScanWiget(),
        Container(
          padding: const EdgeInsets.all(6),
          height: 300,
          width: 300,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 71, 122, 211),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ScannerErrorWidget extends StatelessWidget {
  const ScannerErrorWidget({super.key, required this.error});
  final MobileScannerException error;
  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = 'Controller not ready.';
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = 'Permission denied';
      case MobileScannerErrorCode.unsupported:
        errorMessage = 'Scanning is unsupported on this device';
      default:
        errorMessage = 'Generic Error';
        break;
    }

    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(Icons.error, color: Colors.white),
            ),
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              error.errorDetails?.message ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
