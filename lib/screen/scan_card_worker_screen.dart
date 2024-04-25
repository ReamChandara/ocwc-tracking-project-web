import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanning_effect/scanning_effect.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/worker_controller.dart';

class ScanWorkerCard extends StatefulWidget {
  const ScanWorkerCard({super.key});

  @override
  State<ScanWorkerCard> createState() => _ScanWorkerCardState();
}

class _ScanWorkerCardState extends State<ScanWorkerCard> {
  late WorkerController controller;
  final MobileScannerController scannerController = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
  );
  @override
  void initState() {
    controller = Get.put(WorkerController());
    scannerController.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final scanWindow = Rect.fromCenter(
    //   center: MediaQuery.sizeOf(context).center(Offset.zero),
    //   width: 200,
    //   height: 200,
    // );

    return Scaffold(
      appBar: _buildAppbar(),
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
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  height: 500,
                  width: 500,
                  "assets/images/splash_logo_new.png",
                ),
                Container(
                  height: 600,
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(35, 54, 93, 0.5),
                    // border: Border(
                    //   top: BorderSide(
                    //       color: Color.fromARGB(255, 71, 122, 211), width: 5),
                    //   bottom: BorderSide(
                    //       color: Color.fromARGB(255, 71, 122, 211), width: 5),
                    // ),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.grey,
                    //       offset: Offset(0.50, 0.50),
                    //       blurRadius: 1,
                    //       blurStyle: BlurStyle.outer)
                    // ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "ស្កេនកាត",
                        style: TextStyle(
                            fontFamily: "Battambang",
                            fontSize: 22,
                            color: Colors.white),
                      ),
                      const Text(
                        "ដាក់​កាតស្ថិតក្នុងអេក្រង់កាមេរ៉ា ដើម្បីស្កេន",
                        style: TextStyle(
                            fontFamily: "Battambang",
                            fontSize: 18,
                            color: Colors.white),
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
                                scanningColor: const Color.fromARGB(
                                  255,
                                  71,
                                  122,
                                  211,
                                ),
                                scanningLinePadding: const EdgeInsets.all(10),
                                borderLineColor: const Color.fromARGB(
                                  255,
                                  71,
                                  122,
                                  211,
                                ),
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
                                          controller: controller,
                                          barcodes: scannerController.barcodes,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 71, 122, 211),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/icons/credit-card.png",
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "បើកកាត",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Battambang",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ].withSpaceBetween(height: 10),
                  ),
                ),
              ].withSpaceBetween(width: 20),
            ),
          ),
        );
      }),
    );
  }

  // Stack buildBody(Rect scanWindow) {
  //   return Stack(
  //     fit: StackFit.expand,
  //     children: [
  //       Center(
  //         child: MobileScanner(
  //           // fit: BoxFit.contain,
  //           controller: scannerController,
  //           scanWindow: scanWindow,
  //           errorBuilder: (context, error, child) {
  //             return ScannerErrorWidget(error: error);
  //           },
  //           overlayBuilder: (context, constraints) {
  //             return Padding(
  //               padding: const EdgeInsets.all(16.0),
  //               child: Align(
  //                 alignment: Alignment.bottomCenter,
  //                 child: ScannedBarcodeLabel(
  //                   barcodes: scannerController.barcodes,
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //       ValueListenableBuilder(
  //         valueListenable: scannerController,
  //         builder: (context, value, child) {
  //           if (!value.isInitialized ||
  //               !value.isRunning ||
  //               value.error != null) {
  //             return const SizedBox();
  //           }
  //           return CustomPaint(
  //             painter: ScannerOverlay(scanWindow: scanWindow),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  @override
  Future<void> dispose() async {
    super.dispose();
    await scannerController.dispose();
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
            fontFamily: controller.langCode == "kh"
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
              child: controller.initValue.value == "kh"
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
                  controller.changeLanguage("kh");
                } else if (value == "en") {
                  controller.changeLanguage("en");
                }
              },
              itemBuilder: (BuildContext context) => [
                controller.initValue.value == "kh"
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

class ScannedBarcodeLabel extends StatelessWidget {
  const ScannedBarcodeLabel(
      {super.key, required this.barcodes, required this.controller});
  final WorkerController controller;
  final Stream<BarcodeCapture> barcodes;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: barcodes,
      builder: (context, snapshot) {
        final scannedBarcodes = snapshot.data?.barcodes ?? [];
        if (scannedBarcodes.isEmpty) {
          return const Text(
            'Scan something!',
            overflow: TextOverflow.fade,
            style: TextStyle(color: Colors.white),
          );
        } else {
          controller.searchWorkByQr(scannedBarcodes.first.displayValue!);
          return Text(
            scannedBarcodes.first.displayValue ?? 'No display value.',
            overflow: TextOverflow.fade,
            style: const TextStyle(color: Colors.white),
          );
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

class ScannerOverlay extends CustomPainter {
  const ScannerOverlay({
    required this.scanWindow,
    this.borderRadius = 12.0,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    // we need to pass the size to the custom paint widget
    final backgroundPath = Path()..addRect(Rect.largest);

    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final borderRect = RRect.fromRectAndCorners(
      scanWindow,
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    // First, draw the background,
    // with a cutout area that is a bit larger than the scan window.
    // Finally, draw the scan window itself.
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.drawRRect(borderRect, borderPaint);
  }

  @override
  bool shouldRepaint(ScannerOverlay oldDelegate) {
    return scanWindow != oldDelegate.scanWindow ||
        borderRadius != oldDelegate.borderRadius;
  }
}

class QrScannerOverlayShape extends ShapeBorder {
  QrScannerOverlayShape({
    this.borderColor = Colors.red,
    this.borderWidth = 3.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
    this.borderRadius = 0,
    this.borderLength = 40,
    double? cutOutSize,
    double? cutOutWidth,
    double? cutOutHeight,
    this.cutOutBottomOffset = 0,
  })  : cutOutWidth = cutOutWidth ?? cutOutSize ?? 250,
        cutOutHeight = cutOutHeight ?? cutOutSize ?? 250 {
    assert(
      borderLength <=
          min(this.cutOutWidth, this.cutOutHeight) / 2 + borderWidth * 2,
      "Border can't be larger than ${min(this.cutOutWidth, this.cutOutHeight) / 2 + borderWidth * 2}",
    );
    assert(
        (cutOutWidth == null && cutOutHeight == null) ||
            (cutOutSize == null && cutOutWidth != null && cutOutHeight != null),
        'Use only cutOutWidth and cutOutHeight or only cutOutSize');
  }

  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutWidth;
  final double cutOutHeight;
  final double cutOutBottomOffset;

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(10);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(getOuterPath(rect), Offset.zero);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path getLeftTopPath(Rect rect) {
      return Path()
        ..moveTo(rect.left, rect.bottom)
        ..lineTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top);
    }

    return getLeftTopPath(rect)
      ..lineTo(
        rect.right,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.bottom,
      )
      ..lineTo(
        rect.left,
        rect.top,
      );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final borderWidthSize = width / 2;
    final height = rect.height;
    final borderOffset = borderWidth / 2;
    final mBorderLength =
        borderLength > min(cutOutHeight, cutOutHeight) / 2 + borderWidth * 2
            ? borderWidthSize / 2
            : borderLength;
    final mCutOutWidth =
        cutOutWidth < width ? cutOutWidth : width - borderOffset;
    final mCutOutHeight =
        cutOutHeight < height ? cutOutHeight : height - borderOffset;

    final backgroundPaint = Paint()
      ..color = overlayColor
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final boxPaint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final cutOutRect = Rect.fromLTWH(
      rect.left + width / 2 - mCutOutWidth / 2 + borderOffset,
      -cutOutBottomOffset +
          rect.top +
          height / 2 -
          mCutOutHeight / 2 +
          borderOffset,
      mCutOutWidth - borderOffset * 2,
      mCutOutHeight - borderOffset * 2,
    );

    canvas
      ..saveLayer(
        rect,
        backgroundPaint,
      )
      ..drawRect(
        rect,
        backgroundPaint,
      )
      // Draw top right corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - mBorderLength,
          cutOutRect.top,
          cutOutRect.right,
          cutOutRect.top + mBorderLength,
          topRight: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      // Draw top left corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.top,
          cutOutRect.left + mBorderLength,
          cutOutRect.top + mBorderLength,
          topLeft: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      // Draw bottom right corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.right - mBorderLength,
          cutOutRect.bottom - mBorderLength,
          cutOutRect.right,
          cutOutRect.bottom,
          bottomRight: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      // Draw bottom left corner
      ..drawRRect(
        RRect.fromLTRBAndCorners(
          cutOutRect.left,
          cutOutRect.bottom - mBorderLength,
          cutOutRect.left + mBorderLength,
          cutOutRect.bottom,
          bottomLeft: Radius.circular(borderRadius),
        ),
        borderPaint,
      )
      ..drawRRect(
        RRect.fromRectAndRadius(
          cutOutRect,
          Radius.circular(borderRadius),
        ),
        boxPaint,
      )
      ..restore();
  }

  @override
  ShapeBorder scale(double t) {
    return QrScannerOverlayShape(
      borderColor: borderColor,
      borderWidth: borderWidth,
      overlayColor: overlayColor,
    );
  }
}
