import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tracking_web/config/helper/function.dart';

import '../config/routes/app_route.dart';
import '../controller/scanner_controller.dart';
import '../widget/popup_menu_widget.dart';

class ScanWorkerScreen extends GetView<ScannerController> {
  const ScanWorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
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
                  buildBody(boxConstraints),
                ]),
              ));
        },
      ),
    );
  }

  Widget buildBody(BoxConstraints boxConstraints) {
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
                    const SizedBox(
                      height: 10,
                    ),
                    const BuildQRWidget(),
                    const SizedBox(
                      height: 10,
                    ),
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
                    const SizedBox(
                      height: 10,
                    ),
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

  Widget buildAppbar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                RouteView.findOcwcmember.go(
                  backRoutes: RouteView.findOcwcmember.name,
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

  Widget phoneUIWidget() {
    return Column(
      children: [
        Image.asset(
          "assets/images/splash_logo_new.png",
          width: 300,
        ),
        const BuildQRScanWidget(),
      ],
    );
  }

  Widget webUIWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "assets/images/splash_logo_new.png",
          width: 400,
        ),
        const SizedBox(
          height: 200,
        ),
        const BuildQRScanWidget(),
      ],
    );
  }
}

class BuildQRScanWidget extends GetView<ScannerController> {
  const BuildQRScanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(35, 54, 93, 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "scancardTitle".tr,
          style: const TextStyle(
              fontFamily: "Battambang", fontSize: 18, color: Colors.white),
        ),
        Text(
          "scansubtitle".tr,
          style: const TextStyle(
              fontFamily: "Battambang", fontSize: 18, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        const BuildQRWidget(),
        const SizedBox(
          height: 10,
        ),
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
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Column(
              //   children: [
              //     IconButton(
              //       iconSize: 26,
              //       onPressed: () async {
              //         controller.clearImage();
              //       },
              //       icon: const Icon(
              //         Icons.qr_code,
              //         color: Colors.white,
              //       ),
              //     ),
              //     const Text(
              //       "បើកQR",
              //       style: TextStyle(
              //           fontSize: 14,
              //           fontFamily: "Battambang",
              //           color: Colors.white),
              //     )
              //   ],
              // ),
              // Column(
              //   children: [
              //     IconButton(
              //       iconSize: 26,
              //       onPressed: () {
              //         controller.pickImage();
              //       },
              //       icon: const Icon(
              //         Icons.image_outlined,
              //         color: Colors.white,
              //       ),
              //     ),
              //     Text(
              //       "openimage".tr,
              //       style: const TextStyle(
              //           fontSize: 14,
              //           fontFamily: "Battambang",
              //           color: Colors.white),
              //     )
              //   ],
              // ),
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
    );
  }
}

class BuildQRWidget extends StatelessWidget {
  const BuildQRWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScannerController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(6),
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 71, 122, 211),
          ),
        ),
        child: controller.file == null
            ? MobileScanner(
                controller: controller.mobileScanner,
                errorBuilder: (context, error, child) {
                  return ScannerErrorWidget(error: error);
                },
              )
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: MemoryImage(controller.file!.bytes!),
                )),
              ),
      );
    });
  }
}

// class BuildPhoneUI extends StatelessWidget {
//   const BuildPhoneUI({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.asset(
//           "assets/images/splash_logo_new.png",
//           width: 250,
//         ),
//         const SizedBox(height: 10),
//         const BuildQRWidget(),
//         Container(
//           padding: const EdgeInsets.all(6),
//           height: 300,
//           width: 300,
//           child: Container(
//             padding: const EdgeInsets.all(6),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 width: 2,
//                 color: const Color.fromARGB(255, 71, 122, 211),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

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
