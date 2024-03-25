import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking_web/config/theme/app_theme.dart';
import 'package:tracking_web/controller/worker_controller.dart';
import '../config/constant/string_constant.dart';

class WorkerDetail extends StatelessWidget {
  const WorkerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkerController>(builder: (controller) {
      if (controller.workerModel == null) {
        return const Center(
          child: Text(
            "Not Found",
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        );
      } else {
        return LayoutBuilder(builder: (context, constrained) {
          if (constrained.maxWidth > 900) {
            return WebNewScreen(controller: controller);
          } else {
            return PhoneNewScreen(
              controller: controller,
            );
          }
        });
      }
    });
  }
}

class WebNewScreen extends StatelessWidget {
  final WorkerController controller;
  const WebNewScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "ប្រព័ន្ធតាមដាន OCWC",
          style: TextStyle(fontSize: 20, fontFamily: "Battambang"),
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
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width * 0.40,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: Get.width * 0.40,
                    color: Colors.blueAccent[100],
                    child: Text(
                      "Worker Profile",
                      style: AppTextStyle.bold18(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      fit: BoxFit.cover,
                      controller.workerModel!.workerData.photo,
                    ),
                  ),
                  Table(
                    columnWidths: const {
                      0: FixedColumnWidth(150),
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
                                    fontSize: 18,
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
                                  controller.workerModel!.workerData.ocwcNo,
                                  style: const TextStyle(
                                    fontSize: 18,
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
                                    fontSize: 18,
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
                                    .workerModel!.workerData.fullName.khName,
                                style: const TextStyle(
                                  fontSize: 18,
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
                                    fontSize: 18,
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
                              child: const Text(":"),
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
                                    .workerModel!.workerData.fullName.enName,
                                style: const TextStyle(
                                  fontSize: 18,
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
                                    fontSize: 18,
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
                                    ? controller
                                        .workerModel!.workerData.gender.enName
                                    : controller
                                        .workerModel!.workerData.gender.khName,
                                style: TextStyle(
                                  fontSize: 18,
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
                                    fontSize: 18,
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
                                    ? controller
                                        .workerModel!.workerData.country.enName
                                    : controller
                                        .workerModel!.workerData.country.khName,
                                style: TextStyle(
                                  fontSize: 18,
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
                                    fontSize: 18,
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
                                    ? controller.workerModel!.workerData
                                        .sendingAgency.enName
                                    : controller.workerModel!.workerData
                                        .sendingAgency.khName,
                                style: TextStyle(
                                  fontSize: 18,
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
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: Get.width * 0.60,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: Get.width * 0.60,
                    color: Colors.blueAccent[100],
                    child: Text(
                      "Track Information",
                      style: AppTextStyle.bold18(color: Colors.white),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          controller.workerModel!.workerData.tricking.length,
                      itemBuilder: (context, index) {
                        var track =
                            controller.workerModel!.workerData.tricking[index];
                        var textColor = Colors.green;
                        if (track.check) {
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
                                    fontFamily: controller.langCode == "en"
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
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                );
                              }()),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 45,
            width: Get.width,
            color: Colors.blueAccent[100],
            child: Text(
              "Worker Address",
              style: AppTextStyle.bold18(color: Colors.white),
            ),
          ),
          Container(
            height: 45,
            width: Get.width,
            color: Colors.white,
            child: Text(
              controller.workerModel!.workerData.workAddress.enName,
              style: AppTextStyle.regular16(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneNewScreen extends StatelessWidget {
  final WorkerController controller;
  const PhoneNewScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "ប្រព័ន្ធតាមដាន OCWC",
          style: TextStyle(fontSize: 20, fontFamily: "Battambang"),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: Get.width,
                  color: Colors.blueAccent[100],
                  child: Text(
                    "Worker Profile",
                    style: AppTextStyle.bold18(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Table(
                      columnWidths: const {
                        0: FixedColumnWidth(150),
                        1: FixedColumnWidth(30),
                        2: FixedColumnWidth(190),
                      },
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'ocwcNo'.tr,
                                  style: TextStyle(
                                      fontSize:
                                          controller.langCode == "en" ? 18 : 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  ":",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    controller.workerModel!.workerData.ocwcNo,
                                    style: const TextStyle(
                                      fontSize: 18,
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
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'khmername'.tr,
                                  style: TextStyle(
                                      fontSize:
                                          controller.langCode == "en" ? 18 : 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  ":",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  controller
                                      .workerModel!.workerData.fullName.khName,
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
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'latinname'.tr,
                                  style: TextStyle(
                                      fontSize: controller.langCode == "en" ? 18 : 16,
                                      fontFamily: controller.langCode == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang"),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(":"),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  controller
                                      .workerModel!.workerData.fullName.enName,
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
                                child: Text(
                                  controller.langCode == "en"
                                      ? controller
                                          .workerModel!.workerData.gender.enName
                                      : controller.workerModel!.workerData
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
                                child: Text(
                                  controller.langCode == "en"
                                      ? controller.workerModel!.workerData
                                          .country.enName
                                      : controller.workerModel!.workerData
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
                                child: Text(
                                  controller.langCode == "en"
                                      ? controller.workerModel!.workerData
                                          .sendingAgency.enName
                                      : controller.workerModel!.workerData
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
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Image.network(
                        fit: BoxFit.cover,
                        controller.workerModel!.workerData.photo,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: Get.width,
                  color: Colors.blueAccent[100],
                  child: Text(
                    "Track Information",
                    style: AppTextStyle.bold18(color: Colors.white),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.workerModel!.workerData.tricking.length,
                  itemBuilder: (context, index) {
                    var track =
                        controller.workerModel!.workerData.tricking[index];
                    var textColor = Colors.green;
                    if (track.check) {
                      textColor = Colors.green;
                    } else {
                      if (index == controller.falseIndex) {
                        textColor = Colors.orange;
                      } else {
                        textColor = Colors.red;
                      }
                    }
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: ListTile(
                          title: Text(
                            controller.langCode == "en"
                                ? track.title.enTitle
                                : track.title.khTilte,
                            style: TextStyle(
                                fontFamily: controller.langCode == "en"
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
                                  fontFamily: controller.langCode == "en"
                                      ? "SourceSansPro-Regular"
                                      : "Battambang"),
                            );
                          }()),
                    );
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: Get.width,
                  color: Colors.blueAccent[100],
                  child: Text(
                    "Worker Address",
                    style: AppTextStyle.bold18(color: Colors.white),
                  ),
                ),
                Container(
                  height: 45,
                  width: Get.width,
                  color: Colors.white,
                  child: Text(
                    controller.workerModel!.workerData.workAddress.enName,
                    style: AppTextStyle.regular16(color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WebScreen extends StatelessWidget {
  const WebScreen({
    super.key,
    required this.controller,
  });

  final WorkerController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "workerDetail".tr,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              width: Get.width * 0.30,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    controller.workerModel!.workerData.photo))),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.workerModel!.workerData.fullName.khName,
                        style: GoogleFonts.battambang(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.workerModel!.workerData.fullName.enName,
                        style: AppTextStyle.regular18(color: Colors.black),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "gender".tr,
                            style: AppTextStyle.regular16(color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          controller.langCode == "en"
                              ? controller.workerModel!.workerData.gender.enName
                              : controller
                                  .workerModel!.workerData.gender.khName,
                          style: AppTextStyle.regular16(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "ocwcNo".tr,
                            style: AppTextStyle.regular16(color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          controller.workerModel!.workerData.ocwcNo,
                          style: AppTextStyle.regular16(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "country".tr,
                            style: AppTextStyle.regular16(color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          controller.langCode == "en"
                              ? controller
                                  .workerModel!.workerData.country.enName
                              : controller
                                  .workerModel!.workerData.country.khName,
                          style: AppTextStyle.regular16(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "SenderAgency".tr,
                            style: AppTextStyle.regular16(color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          controller.langCode == "en"
                              ? controller
                                  .workerModel!.workerData.sendingAgency.enName
                              : controller
                                  .workerModel!.workerData.sendingAgency.khName,
                          style: AppTextStyle.regular16(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width * 0.70,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 45,
                    color: Colors.blueAccent.shade100,
                    child: Row(
                      children: [
                        Text(
                          "trackInfo".tr,
                          style: AppTextStyle.bold18(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Number of columns
                                childAspectRatio: 18 / 9),
                        itemCount:
                            controller.workerModel!.workerData.tricking.length,
                        itemBuilder: (context, index) {
                          var track = controller
                              .workerModel!.workerData.tricking[index];
                          var textColor = Colors.green;
                          if (track.check) {
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
                                title: Text(controller.langCode == "en"
                                    ? track.title.enTitle
                                    : track.title.khTilte),
                                leading: Image.asset(
                                  iconImage[index],
                                  color: Colors.blueAccent.shade100,
                                  width: 30,
                                ),
                                subtitle: () {
                                  return Text(
                                    controller.langCode == "en"
                                        ? track.date.enDate
                                        : track.date.khTilte,
                                    style: TextStyle(color: textColor),
                                  );
                                }()),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 45,
                    color: Colors.blueAccent.shade100,
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          "workAddress".tr,
                          style: AppTextStyle.bold18(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 60,
                      color: Colors.white,
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        controller.langCode == "en"
                            ? controller
                                .workerModel!.workerData.workAddress.enName
                            : controller
                                .workerModel!.workerData.workAddress.khName,
                        style: AppTextStyle.regular18(color: Colors.black),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//  Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(left: 10, top: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(controller.workerModel!.workerData.fullName.khName,
//                           style: AppTextStyle.bold20(
//                               color: Colors.black, fontFamily: "Battambang")),
//                       Text(controller.workerModel!.workerData.fullName.enName,
//                           style: AppTextStyle.bold18()),
//                       Table(
//                         columnWidths: {
//                           0: controller.langCode == 'en'
//                               ? const FixedColumnWidth(120)
//                               : const FixedColumnWidth(120),
//                           1: FixedColumnWidth(Get.width * 0.60 - 130),
//                         },
//                         children: [
//                           TableRow(
//                             children: [
//                               TableCell(
//                                 child: Container(
//                                   padding: const EdgeInsets.only(
//                                     top: 5,
//                                     bottom: 5,
//                                   ),
//                                   child: Text(
//                                     'gender'.tr,
//                                   ),
//                                 ),
//                               ),
//                               TableCell(
//                                 child: Container(
//                                   padding: const EdgeInsets.only(
//                                     top: 5,
//                                     bottom: 5,
//                                   ),
//                                   child: Text(
//                                     controller.langCode == "en"
//                                         ? controller.workerModel!.workerData
//                                             .gender.enName
//                                         : controller.workerModel!.workerData
//                                             .gender.khName,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               TableCell(
//                                 child: Container(
//                                   padding: const EdgeInsets.only(
//                                     top: 5,
//                                     bottom: 5,
//                                   ),
//                                   child: Text(
//                                     'ocwcNo'.tr,
//                                   ),
//                                 ),
//                               ),
//                               TableCell(
//                                 child: Container(
//                                   padding: const EdgeInsets.only(
//                                     top: 5,
//                                     bottom: 5,
//                                   ),
//                                   child: Text(
//                                     controller.workerModel!.workerData.ocwcNo,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               TableCell(
//                                 child: Container(
//                                   padding: const EdgeInsets.only(
//                                     top: 5,
//                                     bottom: 5,
//                                   ),
//                                   child: Text(
//                                     'country'.tr,
//                                   ),
//                                 ),
//                               ),
//                               TableCell(
//                                 child: Container(
//                                   padding: const EdgeInsets.only(
//                                     top: 5,
//                                     bottom: 5,
//                                   ),
//                                   child: Text(
//                                     controller.langCode == "en"
//                                         ? controller.workerModel!.workerData
//                                             .country.enName
//                                         : controller.workerModel!.workerData
//                                             .country.khName,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           TableRow(
//                             children: [
//                               TableCell(
//                                 child: Container(
//                                   padding: const EdgeInsets.only(
//                                     top: 5,
//                                     bottom: 5,
//                                   ),
//                                   child: Text(
//                                     'SenderAgency'.tr,
//                                   ),
//                                 ),
//                               ),
//                               TableCell(
//                                 child: Container(
//                                   padding: const EdgeInsets.only(
//                                     top: 5,
//                                     bottom: 5,
//                                   ),
//                                   child: Text(
//                                     controller.langCode == "en"
//                                         ? controller.workerModel!.workerData
//                                             .sendingAgency.enName
//                                         : controller.workerModel!.workerData
//                                             .sendingAgency.khName,
//                                   ),

//                                   // Text(
//                                   //   style: AppTextStyle.regular10(
//                                   //       color: Colors.black),
//                                   //   controller.langCode == "en"
//                                   //       ? controller.workerModel!.workerData
//                                   //           .sendingAgency.enName
//                                   //       : controller.workerModel!.workerData
//                                   //           .sendingAgency.khName,
//                                   // ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.only(left: 20),
//                       //   child: Column(
//                       //     crossAxisAlignment: CrossAxisAlignment.start,
//                       //     children: [
//                       //       Text(
//                       //         controller.langCode == "en"
//                       //             ? controller
//                       //                 .workerModel!.workerData.gender.enName
//                       //             : controller
//                       //                 .workerModel!.workerData.gender.khName,
//                       //         overflow: TextOverflow.ellipsis,
//                       //       ),
//                       //       Text(
//                       //         controller.workerModel!.workerData.ocwcNo,
//                       //       ),
//                       //       Text(
//                       //         minFontSize: 10,
//                       //         maxFontSize: 16,
//                       //         controller.langCode == "en"
//                       //             ? controller
//                       //                 .workerModel!.workerData.country.enName
//                       //             : controller
//                       //                 .workerModel!.workerData.country.khName,
//                       //       ),
//                       //       Text(
//                       //         minFontSize: 10,
//                       //         maxFontSize: 16,
//                       //         controller.langCode == "en"
//                       //             ? controller.workerModel!.workerData
//                       //                 .sendingAgency.enName
//                       //             : controller.workerModel!.workerData
//                       //                 .sendingAgency.khName,
//                       //       )
//                       //     ],
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: Get.height * 0.10,
//                   margin: const EdgeInsets.all(10),
//                   padding: const EdgeInsets.all(5),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white),
//                   child: Image.network(
//                     controller.workerModel!.workerData.photo,
//                   ),
//                 )
//               ],
//             ),

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key, required this.controller});
  final WorkerController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
              width: Get.width,
              height: Get.height * 0.30,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller
                                    .workerModel!.workerData.fullName.khName,
                                style: AppTextStyle.bold20(
                                    color: Colors.black,
                                    fontFamily: "Battambang"),
                              ),
                              Text(
                                  controller
                                      .workerModel!.workerData.fullName.enName,
                                  style: AppTextStyle.bold18()),
                            ],
                          ),
                          Container(
                            height: Get.height * 0.10,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Image.network(
                              controller.workerModel!.workerData.photo,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Table(
                        columnWidths: {
                          0: controller.langCode == 'en'
                              ? const FixedColumnWidth(120)
                              : const FixedColumnWidth(120),
                          1: FixedColumnWidth(Get.width),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    'gender'.tr,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    controller.langCode == "en"
                                        ? controller.workerModel!.workerData
                                            .gender.enName
                                        : controller.workerModel!.workerData
                                            .gender.khName,
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
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    'ocwcNo'.tr,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    controller.workerModel!.workerData.ocwcNo,
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
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    'country'.tr,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    controller.langCode == "en"
                                        ? controller.workerModel!.workerData
                                            .country.enName
                                        : controller.workerModel!.workerData
                                            .country.khName,
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
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    'SenderAgency'.tr,
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    controller.langCode == "en"
                                        ? controller.workerModel!.workerData
                                            .sendingAgency.enName
                                        : controller.workerModel!.workerData
                                            .sendingAgency.khName,
                                  ),

                                  // Text(
                                  //   style: AppTextStyle.regular10(
                                  //       color: Colors.black),
                                  //   controller.langCode == "en"
                                  //       ? controller.workerModel!.workerData
                                  //           .sendingAgency.enName
                                  //       : controller.workerModel!.workerData
                                  //           .sendingAgency.khName,
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 45,
            color: Colors.blueAccent.shade100,
            child: Row(
              children: [
                Text(
                  "trackInfo".tr,
                  style: AppTextStyle.bold18(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.workerModel!.workerData.tricking.length,
                itemBuilder: (context, index) {
                  var track =
                      controller.workerModel!.workerData.tricking[index];
                  var textColor = Colors.green;
                  if (track.check) {
                    textColor = Colors.green;
                  } else {
                    if (index == controller.falseIndex) {
                      textColor = Colors.orange;
                    } else {
                      textColor = Colors.red;
                    }
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: ListTile(
                        title: Text(
                          controller.langCode == "en"
                              ? track.title.enTitle
                              : track.title.khTilte,
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
                            style: TextStyle(color: textColor),
                          );
                        }()),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 45,
            color: Colors.blueAccent.shade100,
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  "workAddress".tr,
                  style: AppTextStyle.bold18(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 5, bottom: 5),
              color: Colors.white,
              child: Text(
                controller.langCode == "en"
                    ? controller.workerModel!.workerData.workAddress.enName
                    : controller.workerModel!.workerData.workAddress.khName,
                style: AppTextStyle.regular16(color: Colors.black),
              )),
        ],
      ),
    );
  }
}

// Container(
//               width: MediaQuery.of(context).size.width * 0.20,
//               height: MediaQuery.of(context).size.height,
//               color: Colors.white,
//               child: Scaffold(
//                 appBar: AppBar(
//                   elevation: 1,
//                   backgroundColor: Colors.white,
//                   centerTitle: true,
//                   title: Text(
//                     "Worker Detail",
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                 ),
//                 body: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(top: 20),
//                           width: 150,
//                           height: 200,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: NetworkImage(workerData.photo))),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           workerData.fullName.khName,
//                           style: GoogleFonts.battambang(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           workerData.fullName.enName,
//                           style: AppTextStyle.regular18(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                     const Divider(),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: Text(
//                               "Gender",
//                               style:
//                                   AppTextStyle.regular16(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             workerData.gender.enName,
//                             style:
//                                 AppTextStyle.regular16(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Divider(),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: Text(
//                               "OCWC No",
//                               style:
//                                   AppTextStyle.regular16(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             workerData.ocwcNo,
//                             style:
//                                 AppTextStyle.regular16(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Divider(),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: Text(
//                               "Country",
//                               style:
//                                   AppTextStyle.regular16(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             workerData.country.enName,
//                             style:
//                                 AppTextStyle.regular16(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Divider(),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 10),
//                             child: Text(
//                               "Send Agency ",
//                               style:
//                                   AppTextStyle.regular16(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             workerData.sendingAgency.enName,
//                             style:
//                                 AppTextStyle.regular16(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )),
//           Container(
//             width: MediaQuery.of(context).size.width * 0.80,
//             height: MediaQuery.of(context).size.height,
//             color: Colors.grey.shade200,
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(left: 10),
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   width: MediaQuery.of(context).size.width * 0.80,
//                   height: 50,
//                   alignment: Alignment.centerLeft,
//                   color: Colors.blueAccent.shade100,
//                   child: Text(
//                     "Tracking Information",
//                     style: AppTextStyle.bold18(color: Colors.white),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 20),
//                   width: MediaQuery.of(context).size.width * 0.80,
//                   height: MediaQuery.of(context).size.height * 0.50,
//                   color: Colors.white,
//                   child: GridView.builder(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3, // Number of columns
//                               childAspectRatio: 3),
//                       itemCount: workerData.tricking.length,
//                       itemBuilder: (context, index) {
//                         var track = workerData.tricking[index];
//                         var textColor = Colors.green;
//                         if (track.check) {
//                           textColor = Colors.green;
//                         } else {
//                           if (index == falseIndex) {
//                             textColor = Colors.orange;
//                           } else {
//                             textColor = Colors.red;
//                           }
//                         }
//                         return Padding(
//                           padding: const EdgeInsets.only(
//                               left: 10, right: 10, top: 20),
//                           child: ListTile(
//                               title: Text(track.title.enTitle),
//                               leading: Image.asset(
//                                 iconImage[index],
//                                 color: Colors.blueAccent.shade100,
//                                 width: 30,
//                               ),
//                               subtitle: () {
//                                 return Text(
//                                   track.date.enDate,
//                                   style: TextStyle(color: textColor),
//                                 );
//                               }()),
//                         );
//                       }),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.only(left: 10),
//                       margin: const EdgeInsets.symmetric(horizontal: 20),
//                       width: MediaQuery.of(context).size.width * 0.80,
//                       height: 50,
//                       alignment: Alignment.centerLeft,
//                       color: Colors.blueAccent.shade100,
//                       child: Text(
//                         "Address work",
//                         style: AppTextStyle.bold18(color: Colors.white),
//                       ),
//                     ),
//                     Container(
//                         padding: const EdgeInsets.all(10),
//                         width: MediaQuery.of(context).size.width * 0.80,
//                         height: MediaQuery.of(context).size.height * 0.08,
//                         margin: const EdgeInsets.symmetric(horizontal: 20),
//                         color: Colors.white,
//                         child: Row(
//                           children: [
//                             Icon(Icons.apartment,
//                                 color: Colors.blue.shade100),
//                             const VerticalDivider(),
//                             Text(
//                               "Sub-District Phra Borom Maha Ratchawa District Phra Nakhon Province Bangkok",
//                               style:
//                                   AppTextStyle.regular18(color: Colors.black),
//                             ),
//                           ],
//                         )),
//                   ],
//                 ),
//               ],
//             ),
//           )
