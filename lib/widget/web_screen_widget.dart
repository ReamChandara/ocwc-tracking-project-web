import 'package:auto_size_text/auto_size_text.dart';
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
      body: SingleChildScrollView(
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
                          width: 180,
                          height: 180,
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
                        SizedBox(
                          width: contanstraintWidth,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        'ocwcNo'.tr,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 12,
                                        style: TextStyle(
                                            fontSize:
                                                controller.langCode == "en"
                                                    ? 18
                                                    : 16,
                                            fontFamily:
                                                controller.langCode == "en"
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
                                          controller.workerData!.ocwcNo,
                                          maxLines: 2,
                                          minFontSize: 12,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        'latinname'.tr,
                                        maxLines: 1,
                                        minFontSize: 12,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang",
                                        ),
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
                                        maxLines: 1,
                                        minFontSize: 12,
                                        textAlign: TextAlign.start,
                                        controller.workerData!.fullName.enName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: "SourceSansPro-Regular",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        'khmername'.tr,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 12,
                                        style: TextStyle(
                                            fontSize:
                                                controller.langCode == "en"
                                                    ? 18
                                                    : 16,
                                            fontFamily:
                                                controller.langCode == "en"
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
                                        textAlign: TextAlign.center,
                                        controller.workerData!.fullName.khName,
                                        minFontSize: 12,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Battambang",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        'gender'.tr,
                                        maxLines: 1,
                                        minFontSize: 12,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                controller.langCode == "en"
                                                    ? 18
                                                    : 16,
                                            fontFamily:
                                                controller.langCode == "en"
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
                                        textAlign: TextAlign.center,
                                        minFontSize: 12,
                                        maxLines: 1,
                                        controller.langCode == "en"
                                            ? controller
                                                .workerData!.gender.enName
                                            : controller
                                                .workerData!.gender.khName,
                                        style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        'country'.tr,
                                        maxLines: 1,
                                        minFontSize: 12,
                                        style: TextStyle(
                                            fontSize:
                                                controller.langCode == "en"
                                                    ? 18
                                                    : 16,
                                            fontFamily:
                                                controller.langCode == "en"
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
                                        textAlign: TextAlign.center,
                                        controller.langCode == "en"
                                            ? controller
                                                .workerData!.country.enName
                                            : controller
                                                .workerData!.country.khName,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: AutoSizeText(
                                        'SenderAgency'.tr,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 12,
                                        style: TextStyle(
                                            fontSize:
                                                controller.langCode == "en"
                                                    ? 18
                                                    : 16,
                                            fontFamily:
                                                controller.langCode == "en"
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
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(10),
                                      child: AutoSizeText(
                                        controller.langCode == "en"
                                            ? controller.workerData!
                                                .sendingAgency.enName
                                            : controller.workerData!
                                                .sendingAgency.khName,
                                        maxLines: 2,
                                        minFontSize: 12,
                                        style: TextStyle(
                                          fontSize: controller.langCode == "en"
                                              ? 18
                                              : 16,
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
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
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.workerData!.tricking.length,
                              itemBuilder: (context, index) {
                                var track =
                                    controller.workerData!.tricking[index];
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
                                      trailing: track.attachment == null ||
                                              track.attachment!.isEmpty
                                          ? null
                                          : IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.folder_open,
                                                color: Colors.blueAccent[100],
                                              )),
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
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                                controller.langCode == "en"
                                                    ? 18
                                                    : 16,
                                            fontFamily:
                                                controller.langCode == "en"
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
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang",
                                          fontSize: controller.langCode == "en"
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                                controller.langCode == "en"
                                                    ? 18
                                                    : 16,
                                            fontFamily:
                                                controller.langCode == "en"
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
                                          fontFamily:
                                              controller.langCode == "en"
                                                  ? "SourceSansPro-Regular"
                                                  : "Battambang",
                                          fontSize: controller.langCode == "en"
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
                ],
              );
            },
          ),
        ),
      ),
    );
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