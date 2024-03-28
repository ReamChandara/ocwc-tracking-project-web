import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/widget/build_address_widget.dart';
import '../config/constant/string_constant.dart';
import '../controller/worker_controller.dart';

class WebNewScreen extends StatelessWidget {
  final WorkerController controller;
  const WebNewScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            // width: Get.width * 0.30,
            height: Get.height,
            child: SingleChildScrollView(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Column(
                  children: [
                    Container(
                      width: Get.width * 0.30,
                      alignment: Alignment.center,
                      height: 45,
                      color: Colors.blueAccent[100],
                      child: Text("workerpro".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: controller.langCode == "en"
                                  ? "SourceSansPro-Regular"
                                  : "Battambang")),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade200, width: 3),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            controller.workerModel!.workerData[0].photo,
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Table(
                      columnWidths: const {
                        0: FixedColumnWidth(120),
                        1: FixedColumnWidth(30),
                        2: FixedColumnWidth(190),
                      },
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'ocwcNo'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  ":",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                    controller
                                        .workerModel!.workerData[0].ocwcNo,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'khmername'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  ":",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  controller.workerModel!.workerData[0].fullName
                                      .khName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Battambang",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'latinname'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  ":",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  controller.workerModel!.workerData[0].fullName
                                      .enName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: "SourceSansPro-Regular",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'gender'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  ":",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  controller.langCode == "en"
                                      ? controller.workerModel!.workerData[0]
                                          .gender.enName
                                      : controller.workerModel!.workerData[0]
                                          .gender.khName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: controller.langCode == "en"
                                        ? "SourceSansPro-Regular"
                                        : "Battambang",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'country'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  ":",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  controller.langCode == "en"
                                      ? controller.workerModel!.workerData[0]
                                          .country.enName
                                      : controller.workerModel!.workerData[0]
                                          .country.khName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: controller.langCode == "en"
                                        ? "SourceSansPro-Regular"
                                        : "Battambang",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'SenderAgency'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  ":",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  controller.langCode == "en"
                                      ? controller.workerModel!.workerData[0]
                                          .sendingAgency.enName
                                      : controller.workerModel!.workerData[0]
                                          .sendingAgency.khName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: controller.langCode == "en"
                                        ? "SourceSansPro-Regular"
                                        : "Battambang",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // ListTile(
                    //   title: Text(
                    //     'ocwcNo'.tr,
                    //     style: TextStyle(
                    //         fontSize: 14,
                    //         fontFamily: controller.langCode == "en"
                    //             ? "SourceSansPro-Regular"
                    //             : "Battambang"),
                    //   ),
                    //   subtitle: Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(controller.workerModel!.workerData[0].ocwcNo,
                    //         style: const TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w400)),
                    //   ),
                    // ),
                    // ListTile(
                    //   title: Text(
                    //     'khmername'.tr,
                    //     style: TextStyle(
                    //         fontSize: 14,
                    //         fontFamily: controller.langCode == "en"
                    //             ? "SourceSansPro-Regular"
                    //             : "Battambang"),
                    //   ),
                    //   subtitle: Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       controller.workerModel!.workerData[0].fullName.khName,
                    //       style: const TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 16,
                    //           fontFamily: "Battambang",
                    //           fontWeight: FontWeight.w400),
                    //     ),
                    //   ),
                    // ),
                    // ListTile(
                    //   title: Text(
                    //     'latinname'.tr,
                    //     style: TextStyle(
                    //         fontSize: 14,
                    //         fontFamily: controller.langCode == "en"
                    //             ? "SourceSansPro-Regular"
                    //             : "Battambang"),
                    //   ),
                    //   subtitle: Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       controller.workerModel!.workerData[0].fullName.enName,
                    //       style: const TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 16,
                    //         fontFamily: "SourceSansPro-Regular",
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // ListTile(
                    //   title: Text(
                    //     'gender'.tr,
                    //     style: TextStyle(
                    //         fontSize: 14,
                    //         fontFamily: controller.langCode == "en"
                    //             ? "SourceSansPro-Regular"
                    //             : "Battambang"),
                    //   ),
                    //   subtitle: Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       controller.langCode == "en"
                    //           ? controller.workerModel!.workerData[0].gender.enName
                    //           : controller
                    //               .workerModel!.workerData.gender.khName,
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         color: Colors.black,
                    //         fontFamily: controller.langCode == "en"
                    //             ? "SourceSansPro-Regular"
                    //             : "Battambang",
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // ListTile(
                    //   title: Text(
                    //     'country'.tr,
                    //     style: TextStyle(
                    //         fontSize: 14,
                    //         fontFamily: controller.langCode == "en"
                    //             ? "SourceSansPro-Regular"
                    //             : "Battambang"),
                    //   ),
                    //   subtitle: Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       controller.langCode == "en"
                    //           ? controller
                    //               .workerModel!.workerData.country.enName
                    //           : controller
                    //               .workerModel!.workerData.country.khName,
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontFamily: controller.langCode == "en"
                    //             ? "SourceSansPro-Regular"
                    //             : "Battambang",
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // ListTile(
                    //   title: Text(
                    //     'SenderAgency'.tr,
                    //     style: TextStyle(
                    //         fontSize: 14,
                    //         fontFamily: controller.langCode == "en"
                    //             ? "SourceSansPro-Regular"
                    //             : "Battambang"),
                    //   ),
                    //   subtitle: Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       controller.langCode == "en"
                    //           ? controller
                    //               .workerModel!.workerData.sendingAgency.enName
                    //           : controller
                    //               .workerModel!.workerData.sendingAgency.khName,
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         color: Colors.black,
                    //         fontFamily: controller.langCode == "en"
                    //             ? "SourceSansPro-Regular"
                    //             : "Battambang",
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.60,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                      child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: 45,
                        width: Get.width * 0.60,
                        color: Colors.blueAccent[100],
                        child: Text("trackInfo".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: controller.langCode == "en"
                                    ? "SourceSansPro-Regular"
                                    : "Battambang")),
                      ),
                      SizedBox(
                        height: Get.height * 0.50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller
                                .workerModel!.workerData[0].tricking.length,
                            itemBuilder: (context, index) {
                              var track = controller
                                  .workerModel!.workerData[0].tricking[index];
                              var textColor = Colors.green;
                              if (track.check!) {
                                textColor = Colors.green;
                              } else {
                                if (index == controller.falseIndex) {
                                  textColor = Colors.orange;
                                } else {
                                  textColor = Colors.red;
                                }
                              }
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 20),
                                child: ListTile(
                                    title: Text(
                                      controller.langCode == "en"
                                          ? track.title.enTitle
                                          : track.title.khTilte,
                                      style: TextStyle(
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang"),
                                    ),
                                    leading: Image.asset(
                                      iconImage[index],
                                      color: Colors.blueAccent.shade100,
                                      width: 20,
                                    ),
                                    subtitle: () {
                                      return Text(
                                        controller.langCode == "en"
                                            ? track.date.enDate
                                            : track.date.khTilte,
                                        style: TextStyle(
                                            color: textColor,
                                            fontFamily:
                                                controller.langCode == "en"
                                                    ? "SourceSansPro-Regular"
                                                    : "Battambang"),
                                      );
                                    }()),
                              );
                            }),
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  BuildAddress(controller: controller)
                ],
              ),
            ),
          )
        ]));
  }

  AppBar _buildAppbar() {
    return AppBar(
      automaticallyImplyLeading: false,
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
        Obx(() {
          return Switch(
              trackColor: MaterialStateProperty.all(Colors.grey),
              activeColor: Colors.white,
              inactiveThumbColor: Colors.white,
              activeThumbImage: const AssetImage(
                'assets/images/cambodia_flag.png',
              ),
              inactiveThumbImage:
                  const AssetImage('assets/images/english_flag.png'),
              value: controller.switchValue.value,
              onChanged: (value) {
                controller.changeSwitch(value);
              });
        }),
      ],
    );
  }
}
