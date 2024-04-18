import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../config/constant/string_constant.dart';
import '../controller/worker_controller.dart';

class WebNewScreen extends StatelessWidget {
  final WorkerController controller;
  const WebNewScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    dialogShowImage(String path) {
      Alert(
          style: AlertStyle(
            titleStyle: TextStyle(
              fontFamily: controller.langCode == "en"
                  ? "SourceSansPro-Regular"
                  : "Battambang",
            ),
            descStyle: TextStyle(
              fontFamily: controller.langCode == "en"
                  ? "SourceSansPro-Regular"
                  : "Battambang",
            ),
            descPadding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            animationType: AnimationType.grow,
            overlayColor: Colors.transparent,
          ),
          image: Container(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(path),
          ),
          context: context,
          buttons: [
            DialogButton(
                child: Text(
                  "close".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang",
                  ),
                ),
                onPressed: () {
                  Get.back();
                })
          ]).show();
    }

    return Scaffold(
      appBar: _buildAppbar(),
      body: Container(
        width: Get.width,
        height: Get.height,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     fit: BoxFit.cover,
        //     image: NetworkImage(
        //         "https://img.freepik.com/free-vector/white-smooth-wavy-lines-design_1017-36615.jpg?t=st=1713413104~exp=1713416704~hmac=5add2f8e30ce56a5ac8d7caef3d1f479e7da5b353cdf4768bde5c666e232822d&w=2000"),
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Center(
            child: LayoutBuilder(
              builder: (context, boxConstraints) {
                var contanstraintWidth = 700.0;
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        // image: const DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(
                        //       "https://media.istockphoto.com/id/1146367620/vector/abstract-white-background.jpg?s=612x612&w=0&k=20&c=v6spf6OW1BS6KaM4Lz3BEfYK8_o5hUHF_4NvcpBpn6w="),
                        // ),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.50, 0.50),
                              blurRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: contanstraintWidth,
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Text("workerpro".tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: controller.langCode == "en"
                                        ? "SourceSansPro-Regular"
                                        : "Battambang")),
                          ),
                          Container(
                            width: contanstraintWidth,
                            height: 1,
                            color: Colors.grey.shade200,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            width: contanstraintWidth,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  bottom: 35,
                                  child: Container(
                                    height: 230,
                                    width: 200,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/ministry_logo-removebg-preview.png"),
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: AutoSizeText(
                                                        'latinname'.tr,
                                                        minFontSize: 12,
                                                        maxLines: 1,
                                                        maxFontSize: 16,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: controller
                                                                        .langCode ==
                                                                    "en"
                                                                ? 16
                                                                : 16,
                                                            fontFamily: controller
                                                                        .langCode ==
                                                                    "en"
                                                                ? "SourceSansPro-Regular"
                                                                : "Battambang"),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 20,
                                                    alignment:
                                                        Alignment.centerRight,
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: const Text(":"),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: AutoSizeText(
                                                        controller.workerData!
                                                            .fullName.enName,
                                                        minFontSize: 12,
                                                        maxLines: 1,
                                                        maxFontSize: 16,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: controller
                                                                        .langCode ==
                                                                    "en"
                                                                ? 16
                                                                : 16,
                                                            fontFamily:
                                                                "SourceSansPro-Regular"),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: AutoSizeText(
                                                        'khmername'.tr,
                                                        minFontSize: 12,
                                                        maxLines: 1,
                                                        maxFontSize: 16,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: controller
                                                                        .langCode ==
                                                                    "en"
                                                                ? 16
                                                                : 16,
                                                            fontFamily: controller
                                                                        .langCode ==
                                                                    "en"
                                                                ? "SourceSansPro-Regular"
                                                                : "Battambang"),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 20,
                                                    alignment:
                                                        Alignment.centerRight,
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: const Text(":"),
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: AutoSizeText(
                                                        controller.workerData!
                                                            .fullName.khName,
                                                        minFontSize: 12,
                                                        maxLines: 1,
                                                        maxFontSize: 16,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: controller
                                                                        .langCode ==
                                                                    "en"
                                                                ? 16
                                                                : 16,
                                                            fontFamily:
                                                                "Battambang"),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  dialogShowImage(controller
                                                      .workerData!.photo);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 80,
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color:
                                                          Colors.grey.shade200,
                                                      width: 3,
                                                    ),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        controller
                                                            .workerData!.photo,
                                                      ),
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(8),
                                            child: AutoSizeText(
                                              'gender'.tr,
                                              minFontSize: 12,
                                              maxLines: 1,
                                              maxFontSize: 16,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      controller.langCode ==
                                                              "en"
                                                          ? 16
                                                          : 16,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 20,
                                          alignment: Alignment.centerRight,
                                          padding: const EdgeInsets.all(8),
                                          child: const Text(":"),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(8),
                                            child: AutoSizeText(
                                              controller.langCode == "en"
                                                  ? controller
                                                      .workerData!.gender.enName
                                                  : controller.workerData!
                                                      .gender.khName,
                                              minFontSize: 12,
                                              maxLines: 1,
                                              maxFontSize: 16,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      controller.langCode ==
                                                              "en"
                                                          ? 16
                                                          : 16,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(8),
                                            child: AutoSizeText(
                                              'country'.tr,
                                              minFontSize: 12,
                                              maxLines: 1,
                                              maxFontSize: 16,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      controller.langCode ==
                                                              "en"
                                                          ? 16
                                                          : 16,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 20,
                                          alignment: Alignment.centerRight,
                                          padding: const EdgeInsets.all(8),
                                          child: const Text(":"),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(8),
                                            child: AutoSizeText(
                                              controller.langCode == "en"
                                                  ? controller.workerData!
                                                      .country.enName
                                                  : controller.workerData!
                                                      .country.khName,
                                              minFontSize: 12,
                                              maxLines: 1,
                                              maxFontSize: 16,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      controller.langCode ==
                                                              "en"
                                                          ? 16
                                                          : 16,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(8),
                                            child: AutoSizeText(
                                              'SenderAgency'.tr,
                                              minFontSize: 12,
                                              maxLines: 2,
                                              maxFontSize: 16,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      controller.langCode ==
                                                              "en"
                                                          ? 16
                                                          : 16,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 20,
                                          alignment: Alignment.centerRight,
                                          padding: const EdgeInsets.all(8),
                                          child: const Text(":"),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(8),
                                            child: AutoSizeText(
                                              controller.langCode == "en"
                                                  ? controller.workerData!
                                                      .sendingAgency.enName
                                                  : controller.workerData!
                                                      .sendingAgency.khName,
                                              minFontSize: 12,
                                              maxLines: 2,
                                              maxFontSize: 16,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      controller.langCode ==
                                                              "en"
                                                          ? 16
                                                          : 16,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      child: TextButton(
                                        onPressed: () {
                                          controller.showImageCard(context);
                                        },
                                        child: Text(
                                          "viewcard".tr,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily:
                                                  controller.langCode == "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: contanstraintWidth,
                          //   child: Row(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Flexible(
                          //         child: Table(
                          //           columnWidths: {
                          //             0: FixedColumnWidth(
                          //               contanstraintWidth / 2 * 0.50 - 50,
                          //             ),
                          //             1: const FixedColumnWidth(20),
                          //             2: FixedColumnWidth(
                          //               Get.width * 0.50,
                          //             ),
                          //           },
                          //           children: [
                          //             TableRow(
                          //               children: [
                          //                 TableCell(
                          //                   child: Container(
                          //                     alignment: Alignment.centerLeft,
                          //                     padding: const EdgeInsets.all(8),
                          //                     child: AutoSizeText(
                          //                       'latinname'.tr,
                          //                       textAlign: TextAlign.center,
                          //                       minFontSize: 12,
                          //                       maxLines: 1,
                          //                       style: TextStyle(
                          //                           fontSize:
                          //                               controller.langCode ==
                          //                                       "en"
                          //                                   ? 18
                          //                                   : 16,
                          //                           fontFamily: controller
                          //                                       .langCode ==
                          //                                   "en"
                          //                               ? "SourceSansPro-Regular"
                          //                               : "Battambang"),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     padding: const EdgeInsets.all(8),
                          //                     alignment: Alignment.centerLeft,
                          //                     child: const Text(
                          //                       ":",
                          //                       style: TextStyle(fontSize: 18),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     alignment: Alignment.centerLeft,
                          //                     padding: const EdgeInsets.all(10),
                          //                     child: AutoSizeText(
                          //                       textAlign: TextAlign.start,
                          //                       controller
                          //                           .workerData!.fullName.enName,
                          //                       minFontSize: 12,
                          //                       maxLines: 1,
                          //                       style: const TextStyle(
                          //                         fontSize: 18,
                          //                         fontFamily:
                          //                             "SourceSansPro-Regular",
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             TableRow(
                          //               children: [
                          //                 TableCell(
                          //                   child: Container(
                          //                     alignment: Alignment.centerLeft,
                          //                     padding: const EdgeInsets.all(8),
                          //                     child: AutoSizeText(
                          //                       'khmername'.tr,
                          //                       textAlign: TextAlign.end,
                          //                       maxLines: 1,
                          //                       style: TextStyle(
                          //                           fontSize:
                          //                               controller.langCode ==
                          //                                       "en"
                          //                                   ? 18
                          //                                   : 16,
                          //                           fontFamily: controller
                          //                                       .langCode ==
                          //                                   "en"
                          //                               ? "SourceSansPro-Regular"
                          //                               : "Battambang"),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     padding: const EdgeInsets.all(8),
                          //                     alignment: Alignment.centerLeft,
                          //                     child: const Text(
                          //                       ":",
                          //                       style: TextStyle(fontSize: 18),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     alignment: Alignment.centerLeft,
                          //                     padding: const EdgeInsets.all(8),
                          //                     child: AutoSizeText(
                          //                       textAlign: TextAlign.start,
                          //                       controller
                          //                           .workerData!.fullName.khName,
                          //                       minFontSize: 12,
                          //                       maxLines: 1,
                          //                       style: const TextStyle(
                          //                         fontSize: 16,
                          //                         fontFamily: "Battambang",
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             TableRow(
                          //               children: [
                          //                 TableCell(
                          //                   child: Container(
                          //                     padding: const EdgeInsets.all(8),
                          //                     alignment: Alignment.centerLeft,
                          //                     child: AutoSizeText(
                          //                       'ocwcNo'.tr,
                          //                       maxLines: 1,
                          //                       minFontSize: 12,
                          //                       style: TextStyle(
                          //                           fontSize:
                          //                               controller.langCode ==
                          //                                       "en"
                          //                                   ? 18
                          //                                   : 16,
                          //                           fontFamily: controller
                          //                                       .langCode ==
                          //                                   "en"
                          //                               ? "SourceSansPro-Regular"
                          //                               : "Battambang"),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     padding: const EdgeInsets.all(8),
                          //                     alignment: Alignment.centerLeft,
                          //                     child: const Text(
                          //                       ":",
                          //                       style: TextStyle(fontSize: 18),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     alignment: Alignment.centerLeft,
                          //                     padding: const EdgeInsets.all(8),
                          //                     child: AutoSizeText(
                          //                         controller.workerData!.ocwcNo,
                          //                         textAlign: TextAlign.start,
                          //                         maxLines: 1,
                          //                         style: const TextStyle(
                          //                           fontSize: 18,
                          //                           fontWeight: FontWeight.bold,
                          //                         )),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             TableRow(
                          //               children: [
                          //                 TableCell(
                          //                   child: Container(
                          //                     padding: const EdgeInsets.all(8),
                          //                     alignment: Alignment.centerLeft,
                          //                     child: AutoSizeText(
                          //                       'gender'.tr,
                          //                       minFontSize: 12,
                          //                       maxLines: 1,
                          //                       style: TextStyle(
                          //                           fontSize:
                          //                               controller.langCode ==
                          //                                       "en"
                          //                                   ? 18
                          //                                   : 16,
                          //                           fontFamily: controller
                          //                                       .langCode ==
                          //                                   "en"
                          //                               ? "SourceSansPro-Regular"
                          //                               : "Battambang"),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     padding: const EdgeInsets.all(8),
                          //                     alignment: Alignment.centerLeft,
                          //                     child: const Text(
                          //                       ":",
                          //                       style: TextStyle(fontSize: 16),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     alignment: Alignment.centerLeft,
                          //                     padding: const EdgeInsets.all(8),
                          //                     child: AutoSizeText(
                          //                       textAlign: TextAlign.start,
                          //                       controller.langCode == "en"
                          //                           ? controller
                          //                               .workerData!.gender.enName
                          //                           : controller.workerData!
                          //                               .gender.khName,
                          //                       maxLines: 1,
                          //                       style: TextStyle(
                          //                         fontSize:
                          //                             controller.langCode == "en"
                          //                                 ? 18
                          //                                 : 16,
                          //                         fontFamily: controller
                          //                                     .langCode ==
                          //                                 "en"
                          //                             ? "SourceSansPro-Regular"
                          //                             : "Battambang",
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             TableRow(
                          //               children: [
                          //                 TableCell(
                          //                   child: Container(
                          //                     padding: const EdgeInsets.all(8),
                          //                     alignment: Alignment.centerLeft,
                          //                     child: AutoSizeText(
                          //                       'country'.tr,
                          //                       maxLines: 1,
                          //                       style: TextStyle(
                          //                           fontSize:
                          //                               controller.langCode ==
                          //                                       "en"
                          //                                   ? 18
                          //                                   : 16,
                          //                           fontFamily: controller
                          //                                       .langCode ==
                          //                                   "en"
                          //                               ? "SourceSansPro-Regular"
                          //                               : "Battambang"),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     padding: const EdgeInsets.all(8),
                          //                     alignment: Alignment.centerLeft,
                          //                     child: const Text(
                          //                       ":",
                          //                       style: TextStyle(fontSize: 18),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     alignment: Alignment.centerLeft,
                          //                     padding: const EdgeInsets.all(8),
                          //                     child: AutoSizeText(
                          //                       textAlign: TextAlign.start,
                          //                       maxLines: 1,
                          //                       controller.langCode == "en"
                          //                           ? controller.workerData!
                          //                               .country.enName
                          //                           : controller.workerData!
                          //                               .country.khName,
                          //                       style: TextStyle(
                          //                         fontSize:
                          //                             controller.langCode == "en"
                          //                                 ? 18
                          //                                 : 16,
                          //                         fontFamily: controller
                          //                                     .langCode ==
                          //                                 "en"
                          //                             ? "SourceSansPro-Regular"
                          //                             : "Battambang",
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             TableRow(
                          //               children: [
                          //                 TableCell(
                          //                   child: Container(
                          //                     alignment: Alignment.centerLeft,
                          //                     padding: const EdgeInsets.all(8),
                          //                     child: AutoSizeText(
                          //                       'SenderAgency'.tr,
                          //                       textAlign: TextAlign.start,
                          //                       maxLines: 1,
                          //                       style: TextStyle(
                          //                           fontSize:
                          //                               controller.langCode ==
                          //                                       "en"
                          //                                   ? 18
                          //                                   : 16,
                          //                           fontFamily: controller
                          //                                       .langCode ==
                          //                                   "en"
                          //                               ? "SourceSansPro-Regular"
                          //                               : "Battambang"),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     padding: const EdgeInsets.all(8),
                          //                     alignment: Alignment.centerLeft,
                          //                     child: const Text(
                          //                       ":",
                          //                       style: TextStyle(fontSize: 18),
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 TableCell(
                          //                   child: Container(
                          //                     alignment: Alignment.centerLeft,
                          //                     padding: const EdgeInsets.all(8),
                          //                     child: AutoSizeText(
                          //                       maxLines: 2,
                          //                       minFontSize: 12,
                          //                       textAlign: TextAlign.start,
                          //                       controller.langCode == "en"
                          //                           ? controller.workerData!
                          //                               .sendingAgency.enName
                          //                           : controller.workerData!
                          //                               .sendingAgency.khName,
                          //                       style: TextStyle(
                          //                         fontSize:
                          //                             controller.langCode == "en"
                          //                                 ? 18
                          //                                 : 16,
                          //                         fontFamily: controller
                          //                                     .langCode ==
                          //                                 "en"
                          //                             ? "SourceSansPro-Regular"
                          //                             : "Battambang",
                          //                         fontWeight: FontWeight.bold,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       Flexible(
                          //         child: Container(
                          //           width: 100,
                          //           height: 100,
                          //           margin: const EdgeInsets.all(10),
                          //           padding: const EdgeInsets.all(10),
                          //           decoration: BoxDecoration(
                          //             border: Border.all(
                          //               color: Colors.grey.shade200,
                          //               width: 3,
                          //             ),
                          //             image: DecorationImage(
                          //               fit: BoxFit.cover,
                          //               image: NetworkImage(
                          //                 controller.workerData!.photo,
                          //               ),
                          //             ),
                          //             shape: BoxShape.circle,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        // image: const DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(
                        //       "https://media.istockphoto.com/id/1146367620/vector/abstract-white-background.jpg?s=612x612&w=0&k=20&c=v6spf6OW1BS6KaM4Lz3BEfYK8_o5hUHF_4NvcpBpn6w="),
                        // ),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.50, 0.50),
                              blurRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            width: contanstraintWidth,
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Text("cardDate".tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: controller.langCode == "en"
                                        ? "SourceSansPro-Regular"
                                        : "Battambang")),
                          ),
                          Container(
                            width: contanstraintWidth,
                            height: 1,
                            color: Colors.grey.shade200,
                          ),
                          SizedBox(
                            width: contanstraintWidth,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/ministry_logo-removebg-preview.png"),
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: AutoSizeText(
                                              minFontSize: 12,
                                              "issuseDate".tr,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize:
                                                      controller.langCode ==
                                                              "en"
                                                          ? 18
                                                          : 16,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: const Text(
                                              ":",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(10),
                                            child: AutoSizeText(
                                              controller.workerData!.issuedDate
                                                      .enIssuedDate ??
                                                  "noData".tr,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontFamily: controller
                                                            .langCode ==
                                                        "en"
                                                    ? "SourceSansPro-Regular"
                                                    : "Battambang",
                                                fontSize:
                                                    controller.langCode == "en"
                                                        ? 18
                                                        : 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: AutoSizeText(
                                              'expireDate'.tr,
                                              maxLines: 1,
                                              minFontSize: 12,
                                              style: TextStyle(
                                                  fontSize:
                                                      controller.langCode ==
                                                              "en"
                                                          ? 18
                                                          : 16,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: const Text(
                                              ":",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: const EdgeInsets.all(10),
                                            child: AutoSizeText(
                                              controller.workerData!.expiredDate
                                                      .enExpiresDate ??
                                                  "noData".tr,
                                              maxLines: 1,
                                              minFontSize: 12,
                                              style: TextStyle(
                                                fontFamily: controller
                                                            .langCode ==
                                                        "en"
                                                    ? "SourceSansPro-Regular"
                                                    : "Battambang",
                                                fontSize:
                                                    controller.langCode == "en"
                                                        ? 18
                                                        : 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        // image: const DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(
                        //       "https://media.istockphoto.com/id/1146367620/vector/abstract-white-background.jpg?s=612x612&w=0&k=20&c=v6spf6OW1BS6KaM4Lz3BEfYK8_o5hUHF_4NvcpBpn6w="),
                        // ),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.50, 0.50),
                              blurRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: contanstraintWidth,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Text("trackInfo".tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: controller.langCode == "en"
                                        ? "SourceSansPro-Regular"
                                        : "Battambang")),
                          ),
                          Container(
                            width: contanstraintWidth,
                            height: 1,
                            color: Colors.grey.shade200,
                          ),
                          SizedBox(
                            width: contanstraintWidth,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 230,
                                    width: 200,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/ministry_logo-removebg-preview.png"),
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        controller.workerData!.tricking.length,
                                    itemBuilder: (context, index) {
                                      var track = controller
                                          .workerData!.tricking[index];
                                      Color? textColor = Colors.green;
                                      if (track.check!) {
                                        textColor = Colors.green;
                                      } else {
                                        if (index == controller.falseIndex) {
                                          textColor = Colors.orange;
                                        } else {
                                          textColor = Colors.red[300];
                                        }
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: ListTile(
                                            title: Text(
                                              controller.langCode == "en"
                                                  ? track.title.enTitle
                                                  : track.title.khTilte,
                                              style: TextStyle(
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                            leading: Image.asset(
                                              iconImage[index],
                                              color: Colors.blueAccent.shade100,
                                              width: 20,
                                            ),
                                            trailing: track.attachment ==
                                                        null ||
                                                    track.attachment!.isEmpty
                                                ? null
                                                : IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.folder_open,
                                                      color: Colors
                                                          .blueAccent[100],
                                                    )),
                                            subtitle: () {
                                              return Text(
                                                controller.langCode == "en"
                                                    ? track.date.enDate
                                                    : track.date.khTilte,
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontFamily: controller
                                                                .langCode ==
                                                            "en"
                                                        ? "SourceSansPro-Regular"
                                                        : "Battambang"),
                                              );
                                            }()),
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        // image: const DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(
                        //       "https://media.istockphoto.com/id/1146367620/vector/abstract-white-background.jpg?s=612x612&w=0&k=20&c=v6spf6OW1BS6KaM4Lz3BEfYK8_o5hUHF_4NvcpBpn6w="),
                        // ),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.50, 0.50),
                              blurRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            width: contanstraintWidth,
                            alignment: Alignment.center,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Text("workAddress".tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: controller.langCode == "en"
                                        ? "SourceSansPro-Regular"
                                        : "Battambang")),
                          ),
                          Container(
                            width: contanstraintWidth,
                            height: 1,
                            color: Colors.grey.shade200,
                          ),
                          Container(
                            width: contanstraintWidth,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/ministry_logo-removebg-preview.png"),
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  controller.langCode == "en"
                                      ? controller.workerData!.workAddress
                                                      .enName ==
                                                  null ||
                                              controller.workerData!.workAddress
                                                  .enName!.isEmpty
                                          ? "noData".tr
                                          : controller
                                              .workerData!.workAddress.enName!
                                      : controller.workerData!.workAddress
                                                      .khName ==
                                                  null ||
                                              controller.workerData!.workAddress
                                                  .khName!.isEmpty
                                          ? "noData".tr
                                          : controller
                                              .workerData!.workAddress.khName!,
                                  style: TextStyle(
                                      fontSize:
                                          controller.langCode == "en" ? 18 : 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang",
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 71, 122, 211),
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Text(
        "appbarTitle".tr,
        style: TextStyle(
            fontSize: 20,
            fontFamily: controller.langCode == "kh"
                ? "Battambang"
                : "SourceSansPro-Regular"),
      ),
      actions: [
        Obx(() => Padding(
              padding: const EdgeInsets.all(10),
              child: PopupMenuButton(
                padding: const EdgeInsets.all(10),
                position: PopupMenuPosition.under,
                child: controller.initValue.value == "kh"
                    ? ClipRRect(
                        child: Image.asset(
                        "assets/images/cambodia_flag.png",
                        width: 30,
                      ))
                    : ClipRRect(
                        child: Image.asset(
                        "assets/images/english_flag.png",
                        width: 30,
                      )),
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
                              Image.asset(
                                "assets/images/english_flag.png",
                                width: 30,
                              ),
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
                              Image.asset(
                                "assets/images/cambodia_flag.png",
                                width: 30,
                              ),
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
            ))
      ],
    );
  }
}

// Table(
//                                       columnWidths: const {
//                                         0: FixedColumnWidth(100),
//                                         1: FixedColumnWidth(20),
//                                         2: FixedColumnWidth(100)
//                                       },
//                                       defaultColumnWidth:
//                                           const FixedColumnWidth(100),
//                                       defaultVerticalAlignment:
//                                           TableCellVerticalAlignment.middle,
//                                       children: [
//                                         TableRow(
//                                           children: [
//                                             TableCell(
//                                               child: Container(
//                                                 alignment:
//                                                     Alignment.centerRight,
//                                                 padding:
//                                                     const EdgeInsets.all(8),
//                                                 child: AutoSizeText(
//                                                   'latinname'.tr,
//                                                   minFontSize: 12,
//                                                   maxLines: 1,
//                                                   maxFontSize: 18,
//                                                   style: TextStyle(
//                                                       fontSize:
//                                                           controller.langCode ==
//                                                                   "en"
//                                                               ? 18
//                                                               : 16,
//                                                       fontFamily: controller
//                                                                   .langCode ==
//                                                               "en"
//                                                           ? "SourceSansPro-Regular"
//                                                           : "Battambang"),
//                                                 ),
//                                               ),
//                                             ),
//                                             TableCell(
//                                               child: Container(
//                                                 padding:
//                                                     const EdgeInsets.all(8),
//                                                 alignment: Alignment.centerLeft,
//                                                 child: const Text(
//                                                   ":",
//                                                   style:
//                                                       TextStyle(fontSize: 18),
//                                                 ),
//                                               ),
//                                             ),
//                                             TableCell(
//                                               child: Container(
//                                                 alignment: Alignment.centerLeft,
//                                                 padding:
//                                                     const EdgeInsets.all(10),
//                                                 child: AutoSizeText(
//                                                   controller.workerData!
//                                                       .fullName.enName,
//                                                   minFontSize: 12,
//                                                   maxLines: 1,
//                                                   style: const TextStyle(
//                                                     fontSize: 18,
//                                                     fontFamily:
//                                                         "SourceSansPro-Regular",
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         TableRow(
//                                           children: [
//                                             TableCell(
//                                               child: Container(
//                                                 alignment:
//                                                     Alignment.centerRight,
//                                                 padding:
//                                                     const EdgeInsets.all(8),
//                                                 child: AutoSizeText(
//                                                   'khmername'.tr,
//                                                   textAlign: TextAlign.end,
//                                                   maxLines: 1,
//                                                   minFontSize: 12,
//                                                   style: TextStyle(
//                                                       fontSize:
//                                                           controller.langCode ==
//                                                                   "en"
//                                                               ? 18
//                                                               : 16,
//                                                       fontFamily: controller
//                                                                   .langCode ==
//                                                               "en"
//                                                           ? "SourceSansPro-Regular"
//                                                           : "Battambang"),
//                                                 ),
//                                               ),
//                                             ),
//                                             TableCell(
//                                               child: Container(
//                                                 padding:
//                                                     const EdgeInsets.all(8),
//                                                 alignment: Alignment.centerLeft,
//                                                 child: const Text(
//                                                   ":",
//                                                   style:
//                                                       TextStyle(fontSize: 18),
//                                                 ),
//                                               ),
//                                             ),
//                                             TableCell(
//                                               child: Container(
//                                                 alignment: Alignment.centerLeft,
//                                                 padding:
//                                                     const EdgeInsets.all(8),
//                                                 child: AutoSizeText(
//                                                   textAlign: TextAlign.start,
//                                                   controller.workerData!
//                                                       .fullName.khName,
//                                                   minFontSize: 10,
//                                                   maxLines: 1,
//                                                   style: const TextStyle(
//                                                     fontSize: 16,
//                                                     fontFamily: "Battambang",
//                                                     fontWeight: FontWeight.bold,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
  // TableRow(
  //                                         children: [
  //                                           TableCell(
  //                                             child: Container(
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               alignment:
  //                                                   Alignment.centerRight,
  //                                               child: AutoSizeText(
  //                                                 'ocwcNo'.tr,
  //                                                 maxLines: 1,
  //                                                 minFontSize: 12,
  //                                                 style: TextStyle(
  //                                                     fontSize:
  //                                                         controller.langCode ==
  //                                                                 "en"
  //                                                             ? 18
  //                                                             : 16,
  //                                                     fontFamily: controller
  //                                                                 .langCode ==
  //                                                             "en"
  //                                                         ? "SourceSansPro-Regular"
  //                                                         : "Battambang"),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           TableCell(
  //                                             child: Container(
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               alignment: Alignment.centerLeft,
  //                                               child: const Text(
  //                                                 ":",
  //                                                 style:
  //                                                     TextStyle(fontSize: 18),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           TableCell(
  //                                             child: Container(
  //                                               alignment: Alignment.centerLeft,
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               child: AutoSizeText(
  //                                                   controller
  //                                                       .workerData!.ocwcNo,
  //                                                   textAlign: TextAlign.start,
  //                                                   maxLines: 1,
  //                                                   style: const TextStyle(
  //                                                     fontSize: 18,
  //                                                     fontWeight:
  //                                                         FontWeight.bold,
  //                                                   )),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                       TableRow(
  //                                         children: [
  //                                           TableCell(
  //                                             child: Container(
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               alignment:
  //                                                   Alignment.centerRight,
  //                                               child: AutoSizeText(
  //                                                 'gender'.tr,
  //                                                 minFontSize: 12,
  //                                                 maxLines: 1,
  //                                                 style: TextStyle(
  //                                                     fontSize:
  //                                                         controller.langCode ==
  //                                                                 "en"
  //                                                             ? 18
  //                                                             : 16,
  //                                                     fontFamily: controller
  //                                                                 .langCode ==
  //                                                             "en"
  //                                                         ? "SourceSansPro-Regular"
  //                                                         : "Battambang"),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           TableCell(
  //                                             child: Container(
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               alignment: Alignment.centerLeft,
  //                                               child: const Text(
  //                                                 ":",
  //                                                 style:
  //                                                     TextStyle(fontSize: 16),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           TableCell(
  //                                             child: Container(
  //                                               alignment: Alignment.centerLeft,
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               child: AutoSizeText(
  //                                                 textAlign: TextAlign.start,
  //                                                 controller.langCode == "en"
  //                                                     ? controller.workerData!
  //                                                         .gender.enName
  //                                                     : controller.workerData!
  //                                                         .gender.khName,
  //                                                 maxLines: 1,
  //                                                 style: TextStyle(
  //                                                   fontSize:
  //                                                       controller.langCode ==
  //                                                               "en"
  //                                                           ? 18
  //                                                           : 16,
  //                                                   fontFamily: controller
  //                                                               .langCode ==
  //                                                           "en"
  //                                                       ? "SourceSansPro-Regular"
  //                                                       : "Battambang",
  //                                                   fontWeight: FontWeight.bold,
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                       TableRow(
  //                                         children: [
  //                                           TableCell(
  //                                             child: Container(
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               alignment:
  //                                                   Alignment.centerRight,
  //                                               child: AutoSizeText(
  //                                                 'country'.tr,
  //                                                 maxLines: 1,
  //                                                 style: TextStyle(
  //                                                     fontSize:
  //                                                         controller.langCode ==
  //                                                                 "en"
  //                                                             ? 18
  //                                                             : 16,
  //                                                     fontFamily: controller
  //                                                                 .langCode ==
  //                                                             "en"
  //                                                         ? "SourceSansPro-Regular"
  //                                                         : "Battambang"),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           TableCell(
  //                                             child: Container(
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               alignment: Alignment.centerLeft,
  //                                               child: const Text(
  //                                                 ":",
  //                                                 style:
  //                                                     TextStyle(fontSize: 18),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           TableCell(
  //                                             child: Container(
  //                                               alignment: Alignment.centerLeft,
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               child: AutoSizeText(
  //                                                 textAlign: TextAlign.start,
  //                                                 maxLines: 1,
  //                                                 controller.langCode == "en"
  //                                                     ? controller.workerData!
  //                                                         .country.enName
  //                                                     : controller.workerData!
  //                                                         .country.khName,
  //                                                 style: TextStyle(
  //                                                   fontSize:
  //                                                       controller.langCode ==
  //                                                               "en"
  //                                                           ? 18
  //                                                           : 16,
  //                                                   fontFamily: controller
  //                                                               .langCode ==
  //                                                           "en"
  //                                                       ? "SourceSansPro-Regular"
  //                                                       : "Battambang",
  //                                                   fontWeight: FontWeight.bold,
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                       TableRow(
  //                                         children: [
  //                                           TableCell(
  //                                             child: Container(
  //                                               alignment:
  //                                                   Alignment.centerRight,
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               child: AutoSizeText(
  //                                                 'SenderAgency'.tr,
  //                                                 textAlign: TextAlign.start,
  //                                                 maxLines: 1,
  //                                                 style: TextStyle(
  //                                                     fontSize:
  //                                                         controller.langCode ==
  //                                                                 "en"
  //                                                             ? 18
  //                                                             : 16,
  //                                                     fontFamily: controller
  //                                                                 .langCode ==
  //                                                             "en"
  //                                                         ? "SourceSansPro-Regular"
  //                                                         : "Battambang"),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           TableCell(
  //                                             child: Container(
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               alignment: Alignment.centerLeft,
  //                                               child: const Text(
  //                                                 ":",
  //                                                 style:
  //                                                     TextStyle(fontSize: 18),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           TableCell(
  //                                             child: Container(
  //                                               alignment: Alignment.centerLeft,
  //                                               padding:
  //                                                   const EdgeInsets.all(8),
  //                                               child: AutoSizeText(
  //                                                 maxLines: 2,
  //                                                 minFontSize: 12,
  //                                                 textAlign: TextAlign.start,
  //                                                 controller.langCode == "en"
  //                                                     ? controller.workerData!
  //                                                         .sendingAgency.enName
  //                                                     : controller.workerData!
  //                                                         .sendingAgency.khName,
  //                                                 style: TextStyle(
  //                                                   fontSize:
  //                                                       controller.langCode ==
  //                                                               "en"
  //                                                           ? 18
  //                                                           : 16,
  //                                                   fontFamily: controller
  //                                                               .langCode ==
  //                                                           "en"
  //                                                       ? "SourceSansPro-Regular"
  //                                                       : "Battambang",
  //                                                   fontWeight: FontWeight.bold,
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
                      // Table(
                        //   columnWidths: {
                        //     0: FixedColumnWidth(contanstraintWidth / 2 - 60),
                        //     1: const FixedColumnWidth(20),
                        //     2: FixedColumnWidth(contanstraintWidth / 2 - 40),
                        //   },
                        //   children: [
                        //     // TableRow(
                        //     //   children: [
                        //     //     TableCell(
                        //     //       child: Container(
                        //     //         padding: const EdgeInsets.only(
                        //     //           top: 10,
                        //     //           bottom: 10,
                        //     //         ),
                        //     //         child: Text(
                        //     //           textAlign: TextAlign.end,
                        //     //           "issuseDate".tr,
                        //     //           style: TextStyle(
                        //     //               fontSize: controller.langCode == "en"
                        //     //                   ? 18
                        //     //                   : 16,
                        //     //               fontFamily:
                        //     //                   controller.langCode == "en"
                        //     //                       ? "SourceSansPro-Regular"
                        //     //                       : "Battambang"),
                        //     //         ),
                        //     //       ),
                        //     //     ),
                        //     //     TableCell(
                        //     //       child: Container(
                        //     //         padding: const EdgeInsets.only(
                        //     //             top: 12, left: 10),
                        //     //         child: const Text(
                        //     //           ":",
                        //     //           style: TextStyle(fontSize: 16),
                        //     //         ),
                        //     //       ),
                        //     //     ),
                        //     //     TableCell(
                        //     //       child: Container(
                        //     //         padding: const EdgeInsets.only(top: 12),
                        //     //         child: Text(
                        //     //           textAlign: TextAlign.start,
                        //     //           controller.workerData!.issuedDate
                        //     //                   .enIssuedDate ??
                        //     //               "noData".tr,
                        //     //           style: TextStyle(
                        //     //             fontFamily: controller.langCode == "en"
                        //     //                 ? "SourceSansPro-Regular"
                        //     //                 : "Battambang",
                        //     //             fontSize: controller.langCode == "en"
                        //     //                 ? 18
                        //     //                 : 16,
                        //     //             fontWeight: FontWeight.bold,
                        //     //           ),
                        //     //         ),
                        //     //       ),
                        //     //     ),
                        //     //   ],
                        //     // ),

                        //     // TableRow(
                        //     //   children: [
                        //     //     TableCell(
                        //     //       child: Container(
                        //     //         padding: const EdgeInsets.only(
                        //     //           top: 10,
                        //     //           bottom: 10,
                        //     //         ),
                        //     //         child: Text(
                        //     //           textAlign: TextAlign.end,
                        //     //           'expireDate'.tr,
                        //     //           style: TextStyle(
                        //     //               fontSize: controller.langCode == "en"
                        //     //                   ? 18
                        //     //                   : 16,
                        //     //               fontFamily:
                        //     //                   controller.langCode == "en"
                        //     //                       ? "SourceSansPro-Regular"
                        //     //                       : "Battambang"),
                        //     //         ),
                        //     //       ),
                        //     //     ),
                        //     //     TableCell(
                        //     //       child: Container(
                        //     //         padding: const EdgeInsets.only(
                        //     //             top: 12, left: 10),
                        //     //         child: const Text(
                        //     //           ":",
                        //     //           style: TextStyle(fontSize: 16),
                        //     //         ),
                        //     //       ),
                        //     //     ),
                        //     //     TableCell(
                        //     //       child: Container(
                        //     //         padding: const EdgeInsets.only(
                        //     //           top: 10,
                        //     //           bottom: 10,
                        //     //         ),
                        //     //         child: Text(
                        //     //           textAlign: TextAlign.start,
                        //     //           controller.workerData!.expiredDate
                        //     //                   .enExpiresDate ??
                        //     //               "noData".tr,
                        //     //           style: TextStyle(
                        //     //             fontFamily: controller.langCode == "en"
                        //     //                 ? "SourceSansPro-Regular"
                        //     //                 : "Battambang",
                        //     //             fontSize: controller.langCode == "en"
                        //     //                 ? 18
                        //     //                 : 16,
                        //     //             fontWeight: FontWeight.bold,
                        //     //           ),
                        //     //         ),
                        //     //       ),
                        //     //     ),
                        //     //   ],
                        //     // ),

                        //   ],
                        // ),
  // Container(
  //                               color: Colors.red,
  //                               child: Column(
  //                                 children: [
  //                                   Row(
  //                                     children: [
  //                                       Container(
  //                                         alignment: Alignment.centerRight,
  //                                         child: AutoSizeText(
  //                                           'ocwcNo'.tr,
  //                                           textAlign: TextAlign.center,
  //                                           maxLines: 1,
  //                                           minFontSize: 12,
  //                                           style: TextStyle(
  //                                               fontSize:
  //                                                   controller.langCode == "en"
  //                                                       ? 18
  //                                                       : 16,
  //                                               fontFamily: controller
  //                                                           .langCode ==
  //                                                       "en"
  //                                                   ? "SourceSansPro-Regular"
  //                                                   : "Battambang"),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         padding: const EdgeInsets.all(8),
  //                                         child: const Text(
  //                                           ":",
  //                                           style: TextStyle(fontSize: 18),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         alignment: Alignment.centerLeft,
  //                                         padding: const EdgeInsets.all(10),
  //                                         child: AutoSizeText(
  //                                             controller.workerData!.ocwcNo,
  //                                             maxLines: 2,
  //                                             minFontSize: 12,
  //                                             style: const TextStyle(
  //                                               fontSize: 18,
  //                                               fontWeight: FontWeight.bold,
  //                                             )),
  //                                       )
  //                                     ],
  //                                   ),
  //                                   Row(
  //                                     children: [
  //                                       Container(
  //                                         alignment: Alignment.centerRight,
  //                                         child: AutoSizeText(
  //                                           'latinname'.tr,
  //                                           maxLines: 1,
  //                                           minFontSize: 12,
  //                                           textAlign: TextAlign.center,
  //                                           style: TextStyle(
  //                                             fontSize:
  //                                                 controller.langCode == "en"
  //                                                     ? 18
  //                                                     : 16,
  //                                             fontFamily:
  //                                                 controller.langCode == "en"
  //                                                     ? "SourceSansPro-Regular"
  //                                                     : "Battambang",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         padding: const EdgeInsets.all(8),
  //                                         child: const Text(
  //                                           ":",
  //                                           style: TextStyle(fontSize: 18),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         alignment: Alignment.centerLeft,
  //                                         padding: const EdgeInsets.all(10),
  //                                         child: AutoSizeText(
  //                                           maxLines: 1,
  //                                           minFontSize: 12,
  //                                           textAlign: TextAlign.start,
  //                                           controller
  //                                               .workerData!.fullName.enName,
  //                                           style: const TextStyle(
  //                                             fontSize: 18,
  //                                             fontFamily:
  //                                                 "SourceSansPro-Regular",
  //                                             fontWeight: FontWeight.bold,
  //                                           ),
  //                                         ),
  //                                       )
  //                                     ],
  //                                   ),
  //                                   Row(
  //                                     children: [
  //                                       Container(
  //                                         alignment: Alignment.centerRight,
  //                                         child: AutoSizeText(
  //                                           'khmername'.tr,
  //                                           textAlign: TextAlign.center,
  //                                           maxLines: 1,
  //                                           minFontSize: 12,
  //                                           style: TextStyle(
  //                                               fontSize:
  //                                                   controller.langCode == "en"
  //                                                       ? 18
  //                                                       : 16,
  //                                               fontFamily: controller
  //                                                           .langCode ==
  //                                                       "en"
  //                                                   ? "SourceSansPro-Regular"
  //                                                   : "Battambang"),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         padding: const EdgeInsets.all(8),
  //                                         child: const Text(
  //                                           ":",
  //                                           style: TextStyle(fontSize: 18),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         alignment: Alignment.centerLeft,
  //                                         padding: const EdgeInsets.all(10),
  //                                         child: AutoSizeText(
  //                                           textAlign: TextAlign.center,
  //                                           controller
  //                                               .workerData!.fullName.khName,
  //                                           minFontSize: 12,
  //                                           maxLines: 1,
  //                                           style: const TextStyle(
  //                                             fontSize: 16,
  //                                             fontFamily: "Battambang",
  //                                             fontWeight: FontWeight.bold,
  //                                           ),
  //                                         ),
  //                                       )
  //                                     ],
  //                                   ),
  //                                   Row(
  //                                     children: [
  //                                       Container(
  //                                         alignment: Alignment.centerRight,
  //                                         child: AutoSizeText(
  //                                           'gender'.tr,
  //                                           maxLines: 1,
  //                                           minFontSize: 12,
  //                                           textAlign: TextAlign.center,
  //                                           style: TextStyle(
  //                                               fontSize:
  //                                                   controller.langCode == "en"
  //                                                       ? 18
  //                                                       : 16,
  //                                               fontFamily: controller
  //                                                           .langCode ==
  //                                                       "en"
  //                                                   ? "SourceSansPro-Regular"
  //                                                   : "Battambang"),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         padding: const EdgeInsets.all(8),
  //                                         child: const Text(
  //                                           ":",
  //                                           style: TextStyle(fontSize: 18),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         alignment: Alignment.centerLeft,
  //                                         padding: const EdgeInsets.all(10),
  //                                         child: AutoSizeText(
  //                                           textAlign: TextAlign.center,
  //                                           minFontSize: 12,
  //                                           maxLines: 1,
  //                                           controller.langCode == "en"
  //                                               ? controller
  //                                                   .workerData!.gender.enName
  //                                               : controller
  //                                                   .workerData!.gender.khName,
  //                                           style: TextStyle(
  //                                             fontSize:
  //                                                 controller.langCode == "en"
  //                                                     ? 18
  //                                                     : 16,
  //                                             fontFamily:
  //                                                 controller.langCode == "en"
  //                                                     ? "SourceSansPro-Regular"
  //                                                     : "Battambang",
  //                                             fontWeight: FontWeight.bold,
  //                                           ),
  //                                         ),
  //                                       )
  //                                     ],
  //                                   ),
  //                                   Row(
  //                                     children: [
  //                                       Container(
  //                                         alignment: Alignment.centerRight,
  //                                         child: AutoSizeText(
  //                                           'country'.tr,
  //                                           maxLines: 1,
  //                                           minFontSize: 12,
  //                                           style: TextStyle(
  //                                               fontSize:
  //                                                   controller.langCode == "en"
  //                                                       ? 18
  //                                                       : 16,
  //                                               fontFamily: controller
  //                                                           .langCode ==
  //                                                       "en"
  //                                                   ? "SourceSansPro-Regular"
  //                                                   : "Battambang"),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         padding: const EdgeInsets.all(8),
  //                                         child: const Text(
  //                                           ":",
  //                                           style: TextStyle(fontSize: 18),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         alignment: Alignment.centerLeft,
  //                                         padding: const EdgeInsets.all(10),
  //                                         child: AutoSizeText(
  //                                           textAlign: TextAlign.center,
  //                                           controller.langCode == "en"
  //                                               ? controller
  //                                                   .workerData!.country.enName
  //                                               : controller
  //                                                   .workerData!.country.khName,
  //                                           maxLines: 1,
  //                                           style: TextStyle(
  //                                             fontSize:
  //                                                 controller.langCode == "en"
  //                                                     ? 18
  //                                                     : 16,
  //                                             fontFamily:
  //                                                 controller.langCode == "en"
  //                                                     ? "SourceSansPro-Regular"
  //                                                     : "Battambang",
  //                                             fontWeight: FontWeight.bold,
  //                                           ),
  //                                         ),
  //                                       )
  //                                     ],
  //                                   ),
  //                                   Row(
  //                                     children: [
  //                                       Container(
  //                                         alignment: Alignment.centerRight,
  //                                         child: AutoSizeText(
  //                                           'SenderAgency'.tr,
  //                                           textAlign: TextAlign.center,
  //                                           maxLines: 1,
  //                                           minFontSize: 12,
  //                                           style: TextStyle(
  //                                               fontSize:
  //                                                   controller.langCode == "en"
  //                                                       ? 18
  //                                                       : 16,
  //                                               fontFamily: controller
  //                                                           .langCode ==
  //                                                       "en"
  //                                                   ? "SourceSansPro-Regular"
  //                                                   : "Battambang"),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         padding: const EdgeInsets.all(8),
  //                                         child: const Text(
  //                                           ":",
  //                                           style: TextStyle(fontSize: 18),
  //                                         ),
  //                                       ),
  //                                       Container(
  //                                         alignment: Alignment.centerLeft,
  //                                         padding: const EdgeInsets.all(10),
  //                                         child: AutoSizeText(
  //                                           controller.langCode == "en"
  //                                               ? controller.workerData!
  //                                                   .sendingAgency.enName
  //                                               : controller.workerData!
  //                                                   .sendingAgency.khName,
  //                                           maxLines: 2,
  //                                           minFontSize: 12,
  //                                           style: TextStyle(
  //                                             fontSize:
  //                                                 controller.langCode == "en"
  //                                                     ? 18
  //                                                     : 16,
  //                                             fontFamily:
  //                                                 controller.langCode == "en"
  //                                                     ? "SourceSansPro-Regular"
  //                                                     : "Battambang",
  //                                             fontWeight: FontWeight.bold,
  //                                           ),
  //                                         ),
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
 
  // Table(
                        //   columnWidths: const {
                        //     0: FixedColumnWidth(150),
                        //     1: FixedColumnWidth(20),
                        //     2: FixedColumnWidth(150),
                        //   },
                        //   children: [
                        //     TableRow(
                        //       children: [
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             child: Text(
                        //               'latinname'.tr,
                        //               textAlign: TextAlign.end,
                        //               style: TextStyle(
                        //                   fontSize: controller.langCode == "en"
                        //                       ? 18
                        //                       : 16,
                        //                   fontFamily:
                        //                       controller.langCode == "en"
                        //                           ? "SourceSansPro-Regular"
                        //                           : "Battambang"),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             alignment: Alignment.center,
                        //             child: const Text(
                        //               ":",
                        //               style: TextStyle(fontSize: 18),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(10),
                        //             child: Text(
                        //               textAlign: TextAlign.start,
                        //               controller.workerData!.fullName.enName,
                        //               style: const TextStyle(
                        //                 fontSize: 18,
                        //                 fontFamily: "SourceSansPro-Regular",
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     TableRow(
                        //       children: [
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             child: Text(
                        //               'khmername'.tr,
                        //               textAlign: TextAlign.end,
                        //               style: TextStyle(
                        //                   fontSize: controller.langCode == "en"
                        //                       ? 18
                        //                       : 16,
                        //                   fontFamily:
                        //                       controller.langCode == "en"
                        //                           ? "SourceSansPro-Regular"
                        //                           : "Battambang"),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             alignment: Alignment.center,
                        //             child: const Text(
                        //               ":",
                        //               style: TextStyle(fontSize: 18),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             child: Text(
                        //               textAlign: TextAlign.start,
                        //               controller.workerData!.fullName.khName,
                        //               style: const TextStyle(
                        //                 fontSize: 16,
                        //                 fontFamily: "Battambang",
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     TableRow(
                        //       children: [
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             alignment: Alignment.centerRight,
                        //             child: Text(
                        //               'ocwcNo'.tr,
                        //               style: TextStyle(
                        //                   fontSize: controller.langCode == "en"
                        //                       ? 18
                        //                       : 16,
                        //                   fontFamily:
                        //                       controller.langCode == "en"
                        //                           ? "SourceSansPro-Regular"
                        //                           : "Battambang"),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             alignment: Alignment.center,
                        //             child: const Text(
                        //               ":",
                        //               style: TextStyle(fontSize: 18),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             child: Text(controller.workerData!.ocwcNo,
                        //                 textAlign: TextAlign.start,
                        //                 style: const TextStyle(
                        //                   fontSize: 18,
                        //                   fontWeight: FontWeight.bold,
                        //                 )),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     TableRow(
                        //       children: [
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             alignment: Alignment.centerRight,
                        //             child: Text(
                        //               'gender'.tr,
                        //               style: TextStyle(
                        //                   fontSize: controller.langCode == "en"
                        //                       ? 18
                        //                       : 16,
                        //                   fontFamily:
                        //                       controller.langCode == "en"
                        //                           ? "SourceSansPro-Regular"
                        //                           : "Battambang"),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             alignment: Alignment.center,
                        //             child: const Text(
                        //               ":",
                        //               style: TextStyle(fontSize: 16),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             child: Text(
                        //               textAlign: TextAlign.start,
                        //               controller.langCode == "en"
                        //                   ? controller.workerData!.gender.enName
                        //                   : controller
                        //                       .workerData!.gender.khName,
                        //               style: TextStyle(
                        //                 fontSize: controller.langCode == "en"
                        //                     ? 18
                        //                     : 16,
                        //                 fontFamily: controller.langCode == "en"
                        //                     ? "SourceSansPro-Regular"
                        //                     : "Battambang",
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     TableRow(
                        //       children: [
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             alignment: Alignment.centerRight,
                        //             child: Text(
                        //               'country'.tr,
                        //               style: TextStyle(
                        //                   fontSize: controller.langCode == "en"
                        //                       ? 18
                        //                       : 16,
                        //                   fontFamily:
                        //                       controller.langCode == "en"
                        //                           ? "SourceSansPro-Regular"
                        //                           : "Battambang"),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             alignment: Alignment.center,
                        //             child: const Text(
                        //               ":",
                        //               style: TextStyle(fontSize: 18),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.all(8),
                        //             child: Text(
                        //               textAlign: TextAlign.start,
                        //               controller.langCode == "en"
                        //                   ? controller
                        //                       .workerData!.country.enName
                        //                   : controller
                        //                       .workerData!.country.khName,
                        //               style: TextStyle(
                        //                 fontSize: controller.langCode == "en"
                        //                     ? 18
                        //                     : 16,
                        //                 fontFamily: controller.langCode == "en"
                        //                     ? "SourceSansPro-Regular"
                        //                     : "Battambang",
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     TableRow(
                        //       children: [
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.only(
                        //               top: 6,
                        //             ),
                        //             child: Text(
                        //               'SenderAgency'.tr,
                        //               textAlign: TextAlign.end,
                        //               style: TextStyle(
                        //                   fontSize: controller.langCode == "en"
                        //                       ? 18
                        //                       : 16,
                        //                   fontFamily:
                        //                       controller.langCode == "en"
                        //                           ? "SourceSansPro-Regular"
                        //                           : "Battambang"),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.only(
                        //               top: 6,
                        //             ),
                        //             alignment: Alignment.center,
                        //             child: const Text(
                        //               ":",
                        //               style: TextStyle(fontSize: 18),
                        //             ),
                        //           ),
                        //         ),
                        //         TableCell(
                        //           child: Container(
                        //             padding: const EdgeInsets.only(
                        //               top: 6,
                        //             ),
                        //             child: Text(
                        //               textAlign: TextAlign.start,
                        //               controller.langCode == "en"
                        //                   ? controller
                        //                       .workerData!.sendingAgency.enName
                        //                   : controller
                        //                       .workerData!.sendingAgency.khName,
                        //               style: TextStyle(
                        //                 fontSize: controller.langCode == "en"
                        //                     ? 18
                        //                     : 16,
                        //                 fontFamily: controller.langCode == "en"
                        //                     ? "SourceSansPro-Regular"
                        //                     : "Battambang",
                        //                 fontWeight: FontWeight.bold,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),