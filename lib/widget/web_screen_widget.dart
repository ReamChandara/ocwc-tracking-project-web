import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/home_controller.dart';
import 'package:tracking_web/controller/new_worker_controller.dart';
import 'package:tracking_web/widget/custom_card.dart';
import 'package:tracking_web/widget/custom_text.dart';
import 'package:tracking_web/widget/dialog_widget.dart';
import '../config/constant/string_constant.dart';
import 'button_show_card.dart';
import 'custom_header.dart';

class WebNewScreen extends StatelessWidget {
  final HomeController homeController;
  final NewWorkerController controller;
  const WebNewScreen({
    super.key,
    required this.controller,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    dialogShowImage(String path) {
      Alert(
          style: AlertStyle(
            titleStyle: TextStyle(
              fontFamily: homeController.langCode.value == "en"
                  ? "SourceSansPro-Regular"
                  : "Battambang",
            ),
            descStyle: TextStyle(
              fontFamily: homeController.langCode.value == "en"
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
                color: const Color.fromARGB(255, 71, 122, 211),
                child: Text(
                  "close".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: homeController.langCode.value == "en"
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
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          var contanstraintWidth = 600.0;
          double height = 500;
          if (boxConstraints.maxWidth >= 1000) {
            return SingleChildScrollView(
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      child: Column(
                        children: [
                          CustomHeader(
                            homeController: homeController,
                            title: "workerpro".tr,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 10,
                            ),
                            width: 400,
                            height: height,
                            child: Column(
                                children: [
                              InkWell(
                                onTap: () {
                                  dialogShowImage(
                                    controller.workerData!.photo,
                                  );
                                },
                                child: Container(
                                  width: 120,
                                  height: 100,
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                      width: 3,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        controller.workerData!.photo,
                                      ),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AutoSizeText(
                                  controller.workerData!.fullName.enName,
                                  minFontSize: 12,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: "SourceSansPro-Regular"),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AutoSizeText(
                                  controller.workerData!.fullName.khName,
                                  minFontSize: 12,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: "Battambang"),
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                  dataFlex: 2,
                                  maxFontSize: 18,
                                  title: 'ocwcNo'.tr,
                                  data: controller.workerData!.ocwcNo,
                                  homeController: homeController),
                              CustomText(
                                  dataFlex: 2,
                                  maxFontSize: 18,
                                  title: 'gender'.tr,
                                  data: homeController.langCode.value == "en"
                                      ? controller.workerData!.gender.enName
                                      : controller.workerData!.gender.khName,
                                  homeController: homeController),
                              CustomText(
                                  dataFlex: 2,
                                  maxFontSize: 18,
                                  title: 'country'.tr,
                                  data: homeController.langCode.value == "en"
                                      ? controller.workerData!.country.enName
                                      : controller.workerData!.country.khName,
                                  homeController: homeController),
                              CustomText(
                                  dataFlex: 2,
                                  title: 'SenderAgency'.tr,
                                  maxFontSize: 18,
                                  minFontSize: 12,
                                  maxLine: 2,
                                  data: homeController.langCode.value == "en"
                                      ? controller
                                          .workerData!.sendingAgency.enName
                                      : controller
                                          .workerData!.sendingAgency.khName,
                                  homeController: homeController),
                              const SizedBox(
                                height: 10,
                              ),
                              ButtonShowCard(
                                  onTap: () {
                                    DialogWidget.laodingDailog(
                                        context, homeController.langCode.value);
                                    controller.showImageCard(
                                      context,
                                      homeController.langCode.value,
                                    );
                                  },
                                  controller: homeController),
                            ].withSpaceBetween(height: 10)),
                          )
                        ],
                      ),
                    ),
                    CustomCard(
                      child: Column(
                        children: [
                          CustomHeader(
                            headerWidth: boxConstraints.maxWidth - 520,
                            title: "trackInfo".tr,
                            homeController: homeController,
                          ),
                          Container(
                            width: boxConstraints.maxWidth - 520,
                            height: 1,
                            color: Colors.grey.shade200,
                          ),
                          SizedBox(
                            width: boxConstraints.maxWidth - 520,
                            height: height,
                            child: ListView.builder(
                              itemCount:
                                  (controller.workerData!.tricking.length / 2)
                                      .ceil(),
                              itemBuilder: (BuildContext context, int index) {
                                var track =
                                    controller.workerData!.tricking[index * 2];
                                var track2 = controller
                                    .workerData!.tricking[index * 2 + 1];
                                Color? textColor = Colors.green;
                                Color? textColor2 = Colors.green;
                                int falseIndex =
                                    controller.workerData!.tricking.indexWhere(
                                  (element) => element.check == false,
                                );

                                if (track.check!) {
                                  textColor = Colors.green;
                                } else {
                                  if (index * 2 == falseIndex) {
                                    textColor = Colors.orange;
                                  } else {
                                    textColor = Colors.red[300];
                                  }
                                }
                                if (track2.check!) {
                                  textColor = Colors.green;
                                } else {
                                  if (index * 2 + 1 == falseIndex) {
                                    textColor2 = Colors.orange;
                                  } else {
                                    textColor2 = Colors.red[300];
                                  }
                                }
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 10),
                                        child: ListTile(
                                            title: Text(
                                              homeController.langCode.value ==
                                                      "en"
                                                  ? track.title.enTitle
                                                  : track.title.khTilte,
                                              style: TextStyle(
                                                  fontFamily: homeController
                                                              .langCode.value ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                            ),
                                            leading: Image.asset(
                                              iconImage[index * 2],
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
                                                homeController.langCode.value ==
                                                        "en"
                                                    ? track.date.enDate
                                                    : track.date.khTilte,
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontFamily: homeController
                                                                .langCode
                                                                .value ==
                                                            "en"
                                                        ? "SourceSansPro-Regular"
                                                        : "Battambang"),
                                              );
                                            }()),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ), // Adjust spacing between items
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, top: 10),
                                      child: index * 2 + 1 <
                                              controller
                                                  .workerData!.tricking.length
                                          ? ListTile(
                                              title: Text(
                                                homeController.langCode.value ==
                                                        "en"
                                                    ? track2.title.enTitle
                                                    : track2.title.khTilte,
                                                style: TextStyle(
                                                    fontFamily: homeController
                                                                .langCode
                                                                .value ==
                                                            "en"
                                                        ? "SourceSansPro-Regular"
                                                        : "Battambang"),
                                              ),
                                              // title: index * 2 + 1 < items.length
                                              // ? Text(items[index * 2 + 1])
                                              // : Text("hello")),
                                              leading: Image.asset(
                                                iconImage[index * 2 + 1],
                                                color:
                                                    Colors.blueAccent.shade100,
                                                width: 20,
                                              ),
                                              trailing: track2.attachment ==
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
                                                  homeController
                                                              .langCode.value ==
                                                          "en"
                                                      ? track2.date.enDate
                                                      : track2.date.khTilte,
                                                  style: TextStyle(
                                                      color: textColor2,
                                                      fontFamily: homeController
                                                                  .langCode
                                                                  .value ==
                                                              "en"
                                                          ? "SourceSansPro-Regular"
                                                          : "Battambang"),
                                                );
                                              }())
                                          : const SizedBox(),
                                    )),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].withSpaceBetween(width: 20),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      child: Column(
                        children: [
                          CustomHeader(
                            homeController: homeController,
                            title: "cardDate".tr,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            width: 400,
                            height: 90,
                            child: Column(
                                children: [
                              CustomText(
                                homeController: homeController,
                                title: "issuseDate".tr,
                                data: controller
                                        .workerData!.issuedDate.enIssuedDate ??
                                    "noData".tr,
                              ),
                              CustomText(
                                  title: 'expireDate'.tr,
                                  data: controller.workerData!.expiredDate
                                          .enExpiresDate ??
                                      "noData".tr,
                                  homeController: homeController),
                            ].withSpaceBetween(height: 10)),
                          ),
                        ],
                      ),
                    ),
                    CustomCard(
                      child: Column(
                        children: [
                          CustomHeader(
                              headerWidth: boxConstraints.maxWidth - 520,
                              homeController: homeController,
                              title: "workAddress".tr),
                          Container(
                            width: boxConstraints.maxWidth - 520,
                            height: 90,
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              homeController.langCode.value == "en"
                                  ? controller.workerData!.workAddress.enName ==
                                              null ||
                                          controller.workerData!.workAddress
                                              .enName!.isEmpty
                                      ? "noData".tr
                                      : controller
                                          .workerData!.workAddress.enName!
                                  : controller.workerData!.workAddress.khName ==
                                              null ||
                                          controller.workerData!.workAddress
                                              .khName!.isEmpty
                                      ? "noData".tr
                                      : controller
                                          .workerData!.workAddress.khName!,
                              style: TextStyle(
                                  fontSize:
                                      homeController.langCode.value == "en"
                                          ? 18
                                          : 16,
                                  fontFamily:
                                      homeController.langCode.value == "en"
                                          ? "SourceSansPro-Regular"
                                          : "Battambang",
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].withSpaceBetween(width: 20),
                )
              ]),
            );
          } else {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CustomCard(
                        child: Column(children: [
                          CustomHeader(
                            headerWidth: contanstraintWidth,
                            homeController: homeController,
                            title: "workerpro".tr,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                              top: 10,
                              right: 10,
                            ),
                            width: contanstraintWidth,
                            child: Column(
                                children: [
                              InkWell(
                                onTap: () {
                                  dialogShowImage(
                                    controller.workerData!.photo,
                                  );
                                },
                                child: Container(
                                  width: 120,
                                  height: 100,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                      width: 3,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        controller.workerData!.photo,
                                      ),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                  alignmentTile: Alignment.centerRight,
                                  title: "latinname".tr,
                                  data: controller.workerData!.fullName.enName,
                                  homeController: homeController),
                              CustomText(
                                  alignmentTile: Alignment.centerRight,
                                  title: 'ocwcNo'.tr,
                                  data: controller.workerData!.ocwcNo,
                                  minFontSize: 12,
                                  maxLine: 2,
                                  homeController: homeController),
                              CustomText(
                                  alignmentTile: Alignment.centerRight,
                                  title: 'khmername'.tr,
                                  dataStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          homeController.langCode.value == "en"
                                              ? 16
                                              : 16,
                                      fontFamily: "Battambang"),
                                  data: controller.workerData!.fullName.khName,
                                  homeController: homeController),
                              CustomText(
                                  alignmentTile: Alignment.centerRight,
                                  title: 'gender'.tr,
                                  data: homeController.langCode.value == "en"
                                      ? controller.workerData!.gender.enName
                                      : controller.workerData!.gender.khName,
                                  homeController: homeController),
                              CustomText(
                                  alignmentTile: Alignment.centerRight,
                                  title: 'country'.tr,
                                  data: homeController.langCode.value == "en"
                                      ? controller.workerData!.country.enName
                                      : controller.workerData!.country.khName,
                                  homeController: homeController),
                              CustomText(
                                  alignmentTile: Alignment.centerRight,
                                  title: 'SenderAgency'.tr,
                                  maxFontSize: 16,
                                  minFontSize: 12,
                                  maxLine: 2,
                                  data: homeController.langCode.value == "en"
                                      ? controller
                                          .workerData!.sendingAgency.enName
                                      : controller
                                          .workerData!.sendingAgency.khName,
                                  homeController: homeController),
                              const SizedBox(height: 10),
                              ButtonShowCard(
                                  onTap: () {
                                    DialogWidget.laodingDailog(
                                        context, homeController.langCode.value);
                                    controller.showImageCard(
                                      context,
                                      homeController.langCode.value,
                                    );
                                  },
                                  controller: homeController),
                              const SizedBox(height: 10),
                            ].withSpaceBetween(height: 10)),
                          )
                        ]),
                      ),
                      CustomCard(
                        child: Column(
                          children: [
                            CustomHeader(
                              headerWidth: contanstraintWidth,
                              homeController: homeController,
                              title: "cardDate".tr,
                            ),
                            SizedBox(
                              width: contanstraintWidth,
                              child: Column(children: [
                                const SizedBox(height: 20),
                                CustomText(
                                    alignmentTile: Alignment.bottomRight,
                                    title: "issuseDate".tr,
                                    data: controller.workerData!.issuedDate
                                            .enIssuedDate ??
                                        "noData".tr,
                                    homeController: homeController),
                                CustomText(
                                    alignmentTile: Alignment.bottomRight,
                                    title: 'expireDate'.tr,
                                    data: controller.workerData!.expiredDate
                                            .enExpiresDate ??
                                        "noData".tr,
                                    homeController: homeController),
                                const SizedBox(height: 20),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      CustomCard(
                          child: Column(
                        children: [
                          CustomHeader(
                            headerWidth: contanstraintWidth,
                            title: "trackInfo".tr,
                            homeController: homeController,
                          ),
                          SizedBox(
                            width: contanstraintWidth,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    controller.workerData!.tricking.length,
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
                                          homeController.langCode.value == "en"
                                              ? track.title.enTitle
                                              : track.title.khTilte,
                                          style: TextStyle(
                                              fontSize: homeController
                                                          .langCode.value ==
                                                      "en"
                                                  ? 18
                                                  : 16,
                                              fontFamily: homeController
                                                          .langCode.value ==
                                                      "en"
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
                                            homeController.langCode.value ==
                                                    "en"
                                                ? track.date.enDate
                                                : track.date.khTilte,
                                            style: TextStyle(
                                                fontSize: homeController
                                                            .langCode.value ==
                                                        "en"
                                                    ? 18
                                                    : 16,
                                                color: textColor,
                                                fontFamily: homeController
                                                            .langCode.value ==
                                                        "en"
                                                    ? "SourceSansPro-Regular"
                                                    : "Battambang"),
                                          );
                                        }()),
                                  );
                                }),
                          ),
                        ],
                      )),
                      CustomCard(
                        child: Column(
                          children: [
                            CustomHeader(
                                headerWidth: contanstraintWidth,
                                homeController: homeController,
                                title: "workAddress".tr),
                            Container(
                              width: contanstraintWidth,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                homeController.langCode.value == "en"
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
                                        homeController.langCode.value == "en"
                                            ? 18
                                            : 16,
                                    fontFamily:
                                        homeController.langCode.value == "en"
                                            ? "SourceSansPro-Regular"
                                            : "Battambang",
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
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
