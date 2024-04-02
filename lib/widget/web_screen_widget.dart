import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            width: Get.width * 0.40,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width * 0.40,
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
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 3,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                controller.workerData!.photo,
                              ),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Table(
                          columnWidths: {
                            0: FixedColumnWidth(Get.width * 0.30 / 2),
                            1: const FixedColumnWidth(20),
                            2: FixedColumnWidth(Get.width * 0.40 / 2 - 20),
                          },
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    child: Text(
                                      'latinname'.tr,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang"),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      ":",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      controller.workerData!.fullName.enName,
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
                                      top: 6,
                                    ),
                                    child: Text(
                                      'khmername'.tr,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang"),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      ":",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      controller.workerData!.fullName.khName,
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
                                      top: 6,
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'ocwcNo'.tr,
                                      style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang"),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      ":",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    child: Text(controller.workerData!.ocwcNo,
                                        textAlign: TextAlign.start,
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
                                      top: 6,
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'gender'.tr,
                                      style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang"),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
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
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      controller.langCode == "en"
                                          ? controller.workerData!.gender.enName
                                          : controller
                                              .workerData!.gender.khName,
                                      style: TextStyle(
                                        fontSize: controller.langCode == "en"
                                            ? 18
                                            : 16,
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
                                      top: 6,
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'country'.tr,
                                      style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang"),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      ":",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      controller.langCode == "en"
                                          ? controller
                                              .workerData!.country.enName
                                          : controller
                                              .workerData!.country.khName,
                                      style: TextStyle(
                                        fontSize: controller.langCode == "en"
                                            ? 18
                                            : 16,
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
                                      top: 6,
                                    ),
                                    child: Text(
                                      'SenderAgency'.tr,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang"),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      ":",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 6,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      controller.langCode == "en"
                                          ? controller
                                              .workerData!.sendingAgency.enName
                                          : controller
                                              .workerData!.sendingAgency.khName,
                                      style: TextStyle(
                                        fontSize: controller.langCode == "en"
                                            ? 18
                                            : 16,
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
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width * 0.40,
                          alignment: Alignment.center,
                          height: 45,
                          color: Colors.blueAccent[100],
                          child: Text("cardDate".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: controller.langCode == "en"
                                      ? "SourceSansPro-Regular"
                                      : "Battambang")),
                        ),
                        Table(
                          columnWidths: {
                            0: FixedColumnWidth(Get.width * 0.30 / 2),
                            1: const FixedColumnWidth(20),
                            2: FixedColumnWidth(Get.width * 0.40 / 2 - 20),
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
                                    child: Text(
                                      textAlign: TextAlign.end,
                                      "issuseDate".tr,
                                      style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang"),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 12, left: 10),
                                    child: const Text(
                                      ":",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      controller.workerData!.issuedDate
                                              .enIssuedDate ??
                                          "noData".tr,
                                      style: TextStyle(
                                        fontFamily: controller.langCode == "en"
                                            ? "SourceSansPro-Regular"
                                            : "Battambang",
                                        fontSize: controller.langCode == "en"
                                            ? 18
                                            : 16,
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
                                    child: Text(
                                      textAlign: TextAlign.end,
                                      'expireDate'.tr,
                                      style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang"),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 12, left: 10),
                                    child: const Text(
                                      ":",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      textAlign: TextAlign.start,
                                      controller.workerData!.expiredDate
                                              .enExpiresDate ??
                                          "noData".tr,
                                      style: TextStyle(
                                        fontFamily: controller.langCode == "en"
                                            ? "SourceSansPro-Regular"
                                            : "Battambang",
                                        fontSize: controller.langCode == "en"
                                            ? 18
                                            : 16,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width * 0.40,
                          alignment: Alignment.center,
                          height: 45,
                          color: Colors.blueAccent[100],
                          child: Text("workAddress".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: controller.langCode == "en"
                                      ? "SourceSansPro-Regular"
                                      : "Battambang")),
                        ),
                        Container(
                          width: Get.width * 0.40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            controller.langCode == "en"
                                ? controller.workerData!.workAddress.enName ==
                                            null ||
                                        controller.workerData!.workAddress
                                            .enName!.isEmpty
                                    ? "noData".tr
                                    : controller.workerData!.workAddress.enName!
                                : controller.workerData!.workAddress.khName ==
                                            null ||
                                        controller.workerData!.workAddress
                                            .khName!.isEmpty
                                    ? "noData".tr
                                    : controller
                                        .workerData!.workAddress.khName!,
                            style: TextStyle(
                                fontSize: controller.langCode == "en" ? 18 : 16,
                                fontFamily: controller.langCode == "en"
                                    ? "SourceSansPro-Regular"
                                    : "Battambang",
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: Get.width * 0.50,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
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
                        height: Get.height * 0.70,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.workerData!.tricking.length,
                            itemBuilder: (context, index) {
                              var track =
                                  controller.workerData!.tricking[index];
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
                                    left: 10, right: 10, top: 10),
                                child: ListTile(
                                    tileColor: index % 2 == 0
                                        ? Colors.grey.shade50
                                        : Colors.white,
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
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.more_vert)),
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
                ],
              ),
            ),
          )
        ]));
  }

  AppBar _buildAppbar() {
    return AppBar(
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
              value: controller.changValue.value,
              onChanged: (value) {
                controller.changeLang(value);
              });
        }),
      ],
    );
  }
}
