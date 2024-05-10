// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:tracking_web/config/helper/function.dart';
// import 'package:tracking_web/controller/home_controller.dart';
// import 'package:tracking_web/controller/new_worker_controller.dart';
// import 'package:tracking_web/controller/scanner_controller.dart';
// import '../config/routes/app_route.dart';
// import '../widget/popup_menu_widget.dart';

// class ScanWorkerCard extends StatefulWidget {
//   const ScanWorkerCard({super.key});

//   @override
//   State<ScanWorkerCard> createState() => _ScanWorkerCardState();
// }

// class _ScanWorkerCardState extends State<ScanWorkerCard> {
//   late NewWorkerController controller = Get.put(NewWorkerController());
//   late HomeController homeController;

//   @override
//   void initState() {
//     homeController = Get.put(HomeController());
//     // mobileScannerController.start();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(builder: (context, boxConstraints) {
//         return Container(
//             width: boxConstraints.maxWidth,
//             height: boxConstraints.maxHeight,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage("assets/images/background.jpg"),
//               ),
//             ),
//             child: SingleChildScrollView(
//                 child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back,
//                           color: Colors.white,
//                         ),
//                       ),
//                       PopupMenuWidget(homeController: homeController),
//                     ],
//                   ),
//                 ),
//                 () {
//                   if (boxConstraints.maxWidth > 1200) {
//                     return Column(
//                       children: [
//                         SizedBox(
//                           height: boxConstraints.maxHeight * 0.10,
//                         ),
//                         //  buildWebUI(),
//                       ],
//                     );
//                   } else {
//                     return buildPhonUI();
//                   }
//                 }()
//               ],
//             )));
//       }),
//     );
//   }

//   // Widget buildWebUI() {
//   //   return Row(
//   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //     children: [
//   //       Image.asset(
//   //         "assets/images/splash_logo_new.png",
//   //         width: 400,
//   //       ),
//   //       // buildQrScanWiget(),
//   //       Container(
//   //         padding: const EdgeInsets.all(6),
//   //         height: 300,
//   //         width: 300,
//   //         child: Container(
//   //           padding: const EdgeInsets.all(6),
//   //           decoration: BoxDecoration(
//   //             borderRadius: BorderRadius.circular(10),
//   //             border: Border.all(
//   //               width: 2,
//   //               color: const Color.fromARGB(255, 71, 122, 211),
//   //             ),
//   //           ),
//   //           child: Container(
//   //             decoration: BoxDecoration(
//   //               borderRadius: BorderRadius.circular(10),
//   //             ),
//   //             child: MobileScanner(
//   //               controller: mobileScannerController,
//   //               errorBuilder: (context, error, child) {
//   //                 return ScannerErrorWidget(error: error);
//   //               },
//   //               // overlayBuilder: (context, boxConstraints) =>
//   //               //     _buildBarcode(homeController),
//   //             ),
//   //             // child: ScanningEffect(
//   //             //   scanningColor: const Color.fromARGB(255, 71, 122, 211),
//   //             //   scanningLinePadding: const EdgeInsets.all(10),
//   //             //   borderLineColor: const Color.fromARGB(255, 71, 122, 211),
//   //             //   delay: const Duration(seconds: 2),
//   //             //   duration: const Duration(seconds: 2),
//   //             //   child:
//   //             // ),
//   //           ),
//   //         ),
//   //       )
//   //     ],
//   //   );
//   // }

//   Widget buildQrScanWiget() {
//     return Container(
//       // height: 550,
//       width: 400,
//       padding: const EdgeInsets.only(bottom: 20),
//       margin: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: Color.fromRGBO(35, 54, 93, 0.5),
//       ),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           Text(
//             "scancardTitle".tr,
//             style: TextStyle(
//                 fontFamily: homeController.langCode.value == "kh"
//                     ? "Battambang"
//                     : "SourceSansPro-Regular",
//                 fontSize: 22,
//                 color: Colors.white),
//           ),
//           Text(
//             "scansubtitle".tr,
//             style: TextStyle(
//                 fontFamily: homeController.langCode.value == "kh"
//                     ? "Battambang"
//                     : "SourceSansPro-Regular",
//                 fontSize: 18,
//                 color: Colors.white),
//           ),
//           Container(
//             padding: const EdgeInsets.all(6),
//             height: 300,
//             width: 280,
//             child: Container(
//               padding: const EdgeInsets.all(6),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   width: 2,
//                   color: const Color.fromARGB(255, 71, 122, 211),
//                 ),
//               ),
//               // child: Container(
//               //   decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(10),
//               //   ),
//               //   child: MobileScanner(
//               //     controller: mobileScannerController,
//               //     errorBuilder: (context, error, child) {
//               //       return ScannerErrorWidget(error: error);
//               //     },
//               //     // overlayBuilder: (context, boxConstraints) =>
//               //     //     _buildBarcode(homeController),
//               //   ),
//               //   // child: ScanningEffect(
//               //   //   scanningColor: const Color.fromARGB(255, 71, 122, 211),
//               //   //   scanningLinePadding: const EdgeInsets.all(10),
//               //   //   borderLineColor: const Color.fromARGB(255, 71, 122, 211),
//               //   //   delay: const Duration(seconds: 2),
//               //   //   duration: const Duration(seconds: 2),
//               //   //   child:
//               //   // ),
//               // ),
//             ),
//           ),
//           // () {
//           //   if (scannerController.file == null) {
//           //     return ScannerWidget(
//           //       homeController: homeController,
//           //       scanController: scannerController,
//           //     );
//           //   } else {
//           //     return Container(
//           //       width: 300,
//           //       height: 300,
//           //       decoration: BoxDecoration(
//           //         borderRadius: BorderRadius.circular(10),
//           //         border: Border.all(
//           //           width: 2,
//           //           color: const Color.fromARGB(255, 71, 122, 211),
//           //         ),
//           //         image: DecorationImage(
//           //           image: MemoryImage(scannerController.file!.bytes!),
//           //         ),
//           //       ),
//           //     );
//           //   }
//           // }(),
//           // Obx(
//           //   () => scannerController.qrValid.value.isEmpty
//           //       ? const SizedBox()
//           //       : Text(
//           //           scannerController.qrValid.value,
//           //           style: TextStyle(
//           //               color: Colors.red,
//           //               fontSize: 14,
//           //               fontFamily: homeController.langCode.value == "kh"
//           //                   ? "Battambang"
//           //                   : "SourceSansPro-Regular"),
//           //         ),
//           // ),
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.center,
//           //   children: [
//           //     // ScaningQR(

//           //     // ),
//           //   //  AnalyzeImageFromGalleryButton(),
//           //     // SwitchCameraButton(
//           //     //   controller: scannerController.mobileScannerController,
//           //     //   homeController: homeController,
//           //     // )
//           //   ].withSpaceBetween(width: 20),
//           // )
//         ].withSpaceBetween(height: 10),
//       ),
//     );
//   }

//   Widget buildPhonUI() {
//     return Column(
//       children: [
//         Image.asset(
//           "assets/images/splash_logo_new.png",
//           width: 250,
//         ),
//         const SizedBox(height: 10),
//         // buildQrScanWiget(),
//         Container(
//             padding: const EdgeInsets.all(6),
//             height: 300,
//             width: 300,
//             child: Container(
//               padding: const EdgeInsets.all(6),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   width: 2,
//                   color: const Color.fromARGB(255, 71, 122, 211),
//                 ),
//               ),
//               // child: Container(
//               //   decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(10),
//               //   ),
//               //   child: MobileScanner(
//               //     controller: mobileScannerController,
//               //     errorBuilder: (context, error, child) {
//               //       return ScannerErrorWidget(error: error);
//               //     },
//               //     // overlayBuilder: (context, boxConstraints) =>
//               //     //     _buildBarcode(homeController),
//               //   ),
//               //   // child: ScanningEffect(
//               //   //   scanningColor: const Color.fromARGB(255, 71, 122, 211),
//               //   //   scanningLinePadding: const EdgeInsets.all(10),
//               //   //   borderLineColor: const Color.fromARGB(255, 71, 122, 211),
//               //   //   delay: const Duration(seconds: 2),
//               //   //   duration: const Duration(seconds: 2),
//               //   //   child:
//               //   // ),
//               // ),
//             ))
//       ],
//     );
//   }
// }

// class ScaningQR extends StatelessWidget {
//   const ScaningQR({required this.controller, super.key});

//   final ScannerController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         IconButton(
//           color: Colors.white,
//           icon: const Icon(Icons.qr_code),
//           iconSize: 26,
//           onPressed: () async {
//             controller.setImageToNull();
//           },
//         ),
//         const Text(
//           "បើកQR",
//           style: TextStyle(
//               color: Colors.white, fontSize: 16, fontFamily: "Battambang"),
//         )
//       ],
//     );
//   }
// }

// class ScannerWidget extends StatelessWidget {
//   final ScannerController scanController;
//   final HomeController homeController;
//   const ScannerWidget({
//     super.key,
//     required this.scanController,
//     required this.homeController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     print("here");
//     return Container(
//       padding: const EdgeInsets.all(6),
//       height: 300,
//       width: 300,
//       child: Container(
//         padding: const EdgeInsets.all(6),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             width: 2,
//             color: const Color.fromARGB(255, 71, 122, 211),
//           ),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: MobileScanner(
//             controller: scanController.mobileScannerController,
//             errorBuilder: (context, error, child) {
//               return ScannerErrorWidget(error: error);
//             },
//             // overlayBuilder: (context, boxConstraints) =>
//             //     _buildBarcode(homeController),
//           ),
//           // child: ScanningEffect(
//           //   scanningColor: const Color.fromARGB(255, 71, 122, 211),
//           //   scanningLinePadding: const EdgeInsets.all(10),
//           //   borderLineColor: const Color.fromARGB(255, 71, 122, 211),
//           //   delay: const Duration(seconds: 2),
//           //   duration: const Duration(seconds: 2),
//           //   child:
//           // ),
//         ),
//       ),
//     );
//   }

//   Widget _buildBarcode(HomeController homeController) {
//     return GetBuilder<ScannerController>(builder: (scannerController) {
//       var value = scannerController.barcode;
//       if (value == null) {
//         return Text(
//           'scanHere'.tr,
//           overflow: TextOverflow.fade,
//           style: TextStyle(
//             color: Colors.white,
//             fontFamily: homeController.langCode.value == "kh"
//                 ? "Battambang"
//                 : "SourceSansPro-Regular",
//           ),
//         );
//       } else {
//         print("value = ${value.displayValue!}");
//         String checkUrl = "/profile?id";
//         if (!value.displayValue!.contains(checkUrl)) {
//           return Text(
//             'validQR'.tr,
//             overflow: TextOverflow.fade,
//             style: TextStyle(
//               color: Colors.red,
//               fontFamily: homeController.langCode.value == "kh"
//                   ? "Battambang"
//                   : "SourceSansPro-Regular",
//             ),
//           );
//         } else {
//           List<String> hashCodes = value.displayValue!.split("=");
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             scannerController.setbarcode = null;
//             Get.toNamed(Routes.detail, parameters: {"id": hashCodes[1]});
//           });
//           return const SizedBox();
//         }
//       }
//     });
//   }
// }

// class AnalyzeImageFromGalleryButton extends StatelessWidget {
//   const AnalyzeImageFromGalleryButton({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         IconButton(
//           color: Colors.white,
//           icon: const Icon(Icons.image_outlined),
//           iconSize: 26,
//           onPressed: () async {
//             // controller.pickImage();
//           },
//         ),
//         const Text(
//           "បើករូបភាព",
//           style: TextStyle(
//               color: Colors.white, fontSize: 16, fontFamily: "Battambang"),
//         )
//       ],
//     );
//   }
// }

// // class SwitchCameraButton extends StatelessWidget {
// //   const SwitchCameraButton(
// //       {required this.controller, required this.homeController, super.key});
// //   final HomeController homeController;
// //   final MobileScannerController controller;

// //   @override
// //   Widget build(BuildContext context) {
// //     return ValueListenableBuilder(
// //       valueListenable: controller,
// //       builder: (context, state, child) {
// //         if (!state.isInitialized || !state.isRunning) {
// //           return const SizedBox.shrink();
// //         }
// //         final int? availableCameras = state.availableCameras;
// //         if (availableCameras != null && availableCameras < 2) {
// //           return const SizedBox.shrink();
// //         }
// //         final Widget icon;
// //         switch (state.cameraDirection) {
// //           case CameraFacing.front:
// //             icon = const Icon(Icons.camera_front_outlined);
// //           case CameraFacing.back:
// //             icon = const Icon(Icons.camera_rear_outlined);
// //         }
// //         return Column(
// //           children: [
// //             IconButton(
// //               color: Colors.white,
// //               iconSize: 26,
// //               icon: icon,
// //               onPressed: () async {
// //                 await controller.switchCamera();
// //               },
// //             ),
// //             Text(
// //               "switchCam".tr,
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 16,
// //                 fontFamily: homeController.langCode.value == "kh"
// //                     ? "Battambang"
// //                     : "SourceSansPro-Regular",
// //               ),
// //             )
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// class ScannerErrorWidget extends StatelessWidget {
//   const ScannerErrorWidget({super.key, required this.error});
//   final MobileScannerException error;
//   @override
//   Widget build(BuildContext context) {
//     String errorMessage;

//     switch (error.errorCode) {
//       case MobileScannerErrorCode.controllerUninitialized:
//         errorMessage = 'Controller not ready.';
//       case MobileScannerErrorCode.permissionDenied:
//         errorMessage = 'Permission denied';
//       case MobileScannerErrorCode.unsupported:
//         errorMessage = 'Scanning is unsupported on this device';
//       default:
//         errorMessage = 'Generic Error';
//         break;
//     }

//     return ColoredBox(
//       color: Colors.black,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(bottom: 16),
//               child: Icon(Icons.error, color: Colors.white),
//             ),
//             Text(
//               errorMessage,
//               style: const TextStyle(color: Colors.white),
//             ),
//             Text(
//               error.errorDetails?.message ?? '',
//               style: const TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
