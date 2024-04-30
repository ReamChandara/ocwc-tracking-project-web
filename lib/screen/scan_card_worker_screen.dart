import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanning_effect/scanning_effect.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/home_controller.dart';
import 'package:tracking_web/controller/new_worker_controller.dart';

import '../config/routes/app_route.dart';
import '../widget/popup_menu_widget.dart';

class ScanWorkerCard extends StatefulWidget {
  const ScanWorkerCard({super.key});

  @override
  State<ScanWorkerCard> createState() => _ScanWorkerCardState();
}

class _ScanWorkerCardState extends State<ScanWorkerCard> {
  late NewWorkerController controller = Get.put(NewWorkerController());
  late HomeController homeController;

  final MobileScannerController scannerController = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );

  @override
  void initState() {
    homeController = Get.put(HomeController());
    scannerController.start();
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
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
                        PopupMenuWidget(homeController: homeController),
                      ],
                    ),
                  ),
                  () {
                    if (boxConstraints.maxWidth > 900) {
                      return Column(
                        children: [
                          SizedBox(
                            height: boxConstraints.maxHeight * 0.10,
                          ),
                          buildWebUI(context),
                        ],
                      );
                    } else {
                      return buildPhonUI();
                    }
                  }()
                ],
              ),
            ));
      }),
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
        buildQrScanWiget(),
      ],
    );
  }

  Widget buildQrScanWiget() {
    return Container(
      height: 500,
      width: 400,
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(35, 54, 93, 0.5),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "ស្កេនកាត",
            style: TextStyle(
                fontFamily: "Battambang", fontSize: 22, color: Colors.white),
          ),
          const Text(
            "ដាក់​កាតស្ថិតក្នុងអេក្រង់កាមេរ៉ា ដើម្បីស្កេន",
            style: TextStyle(
                fontFamily: "Battambang", fontSize: 18, color: Colors.white),
          ),
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ScanningEffect(
                    scanningColor: const Color.fromARGB(255, 71, 122, 211),
                    scanningLinePadding: const EdgeInsets.all(10),
                    borderLineColor: const Color.fromARGB(255, 71, 122, 211),
                    delay: const Duration(seconds: 2),
                    duration: const Duration(seconds: 2),
                    child: MobileScanner(
                      controller: scannerController,
                      errorBuilder: (context, error, child) {
                        return ScannerErrorWidget(error: error);
                      },
                      overlayBuilder: (context, constraints) {
                        return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ScannedBarcodeLabel(
                                barcodes: scannerController.barcodes,
                              ),
                            ));
                      },
                    ),
                  ),
                )),
          ),
          // Column(
          //   children: [
          //     Container(
          //       height: 50,
          //       width: 50,
          //       padding: const EdgeInsets.all(10),
          //       decoration: const BoxDecoration(
          //         color: Color.fromARGB(255, 71, 122, 211),
          //         shape: BoxShape.circle,
          //       ),
          //       child: Image.asset(
          //         "assets/icons/credit-card.png",
          //         color: Colors.white,
          //       ),
          //     ),
          //     const Text(
          //       "បើកកាត",
          //       style: TextStyle(
          //         fontSize: 14,
          //         fontFamily: "Battambang",
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     )
          //   ],
          // )
        ].withSpaceBetween(height: 10),
      ),
    );
  }

  Widget buildPhonUI() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            "assets/images/splash_logo_new.png",
            width: 400,
          ),
        ),
        const SizedBox(height: 20),
        buildQrScanWiget(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    scannerController.dispose();
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 71, 122, 211),
      centerTitle: true,
      title: Text(
        "appbarTitle".tr,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: homeController.langCode.value == "kh"
                ? "Battambang"
                : "SourceSansPro-Regular"),
      ),
      actions: [
        Obx(
          () => Padding(
            padding: const EdgeInsets.all(10),
            child: PopupMenuButton(
              padding: const EdgeInsets.all(10),
              position: PopupMenuPosition.under,
              child: homeController.langCode.value == "kh"
                  ? Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/cambodia_flag.png",
                          ),
                        ),
                      ),
                      height: 30,
                      width: 30,
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/english_flag.png",
                          ),
                        ),
                      ),
                      height: 30,
                      width: 30,
                    ),
              onSelected: (value) {
                if (value == "kh") {
                  homeController.changeLang("kh");
                } else if (value == "en") {
                  homeController.changeLang("en");
                }
              },
              itemBuilder: (BuildContext context) => [
                homeController.langCode.value == "kh"
                    ? PopupMenuItem(
                        padding: const EdgeInsets.all(10),
                        value: "en",
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/english_flag.png",
                                  ),
                                ),
                              ),
                              height: 30,
                              width: 30,
                            ),
                            // Image.asset(
                            //   "assets/images/english_flag.png",
                            //   width: 30,
                            // ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "English",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      )
                    : PopupMenuItem(
                        padding: const EdgeInsets.all(10),
                        value: "kh",
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/cambodia_flag.png",
                                  ),
                                ),
                              ),
                              height: 30,
                              width: 30,
                            ),
                            // Image.asset(
                            //   "assets/images/cambodia_flag.png",
                            //   width: 30,
                            // ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
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
            ),
          ),
        )
      ],
    );
  }
}

class ScannedBarcodeLabel extends StatefulWidget {
  const ScannedBarcodeLabel({
    super.key,
    required this.barcodes,
  });
  final Stream<BarcodeCapture> barcodes;

  @override
  State<ScannedBarcodeLabel> createState() => _ScannedBarcodeLabelState();
}

class _ScannedBarcodeLabelState extends State<ScannedBarcodeLabel> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.barcodes,
      builder: (context, snapshot) {
        final scannedBarcodes = snapshot.data?.barcodes.first;
        if (scannedBarcodes == null) {
          return const Text(
            'Scan something!',
            overflow: TextOverflow.fade,
            style: TextStyle(color: Colors.white),
          );
        } else {
          String checkUrl = "/profile?id";
          String data = scannedBarcodes.displayValue!;
          if (!data.contains(checkUrl)) {
            return const Text(
              "QR Code Not valid",
              overflow: TextOverflow.fade,
              style: TextStyle(color: Colors.red),
            );
          } else {
            List<String> hashCodes = data.split("=");
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                Get.toNamed(Routes.detail, parameters: {"id": hashCodes[1]});
              }
            });
            return Text(
              data,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            );
          }
        }
      },
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
