// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:ui' as ui;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_render/pdf_render_widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/config/responsive/main_resposive.dart';
import 'package:tracking_web/config/routes/app_route.dart';
import 'package:tracking_web/config/theme/app_theme.dart';
import 'package:tracking_web/controller/agency_controller.dart';
import 'package:tracking_web/controller/home_controller.dart';
import 'package:tracking_web/widget/custom_card.dart';
import 'package:tracking_web/widget/custom_header.dart';
import 'package:tracking_web/widget/popup_menu_widget.dart';
import '../widget/custom_text.dart';

class AgencyDetailScreen extends GetView<AgencyController> {
  AgencyDetailScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  final int tilteFlex = 2;
  final int dataFlex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Obx(() => controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.notFound.value
                  ? Center(
                      child: Image.asset("assets/images/no-results.png"),
                    )
                  : LayoutBuilder(builder: (context, constrained) {
                      return MainResposive(
                        large: _buildMidiumScreen(constrained, context),
                        small: _buildSmallWidget(constrained, context),
                      );
                    })
          // MainResposive(
          //     large: LayoutBuilder(builder: ((context, constraints) {
          //       return _buildMidiumScreen(constraints, context);
          //       // if (constraints.maxWidth > 1730) {
          //       //   return _buildLargeScreen(context);
          //       // } else {
          //       //   return _buildMidiumScreen(context);
          //       // }
          //     })),
          //     medium: LayoutBuilder(builder: ((context, constraints) {
          //       if (constraints.maxWidth > 1210) {
          //         return _buildMidiumScreen(constraints, context);
          //       } else {
          //         return _buildSmallWidget(constraints, context);
          //       }
          //     })),
          //   ),
          ),
    );
  }

  void dialogShowImage(BuildContext context, String path,
      {String fileType = "image"}) {
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
            overlayColor: Colors.grey.shade100.withOpacity(0.9)),
        image: fileType == "image"
            ? CachedNetworkImage(
                imageUrl: path,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
                imageBuilder: (context, imageProvider) {
                  Image image = Image.network(path);
                  Completer<ui.Image> completer = Completer<ui.Image>();
                  image.image
                      .resolve(const ImageConfiguration())
                      .addListener(ImageStreamListener((info, synchronousCall) {
                    completer.complete(info.image);
                    var height = info.image.height;
                    var width = info.image.width;
                    print("height: $height");
                    print("width: $width");
                  }));
                  return Container(
                    height: 513,
                    width: 500,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      image: DecorationImage(image: imageProvider),
                    ),
                    // child: Image.network(path),
                  );
                },
                errorWidget: (context, url, error) => Container(
                  height: 250,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/noimage.jpg')),
                  ),
                ),
              )
            : Column(
                children: [
                  Container(
                    width: 500,
                    height: 42,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: const Color.fromARGB(255, 71, 122, 211),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder<Matrix4>(
                            valueListenable: controller.pdfcontroller,
                            builder: ((context, value, child) {
                              return controller.pdfcontroller.isReady
                                  ? Text(
                                      " ${controller.pdfcontroller.currentPageNumber}/${controller.pdfcontroller.pageCount}",
                                      style: AppTextStyle.bold16(
                                          color: Colors.white),
                                    )
                                  : const Text("");
                            })),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    controller.pdfcontroller.setZoomRatio(
                                      zoomRatio: 1.0,
                                    );
                                  },
                                  child: const Icon(Icons.remove,
                                      color: Colors.white)),
                              const VerticalDivider(
                                color: Colors.white,
                              ),
                              ValueListenableBuilder(
                                valueListenable: controller.pdfcontroller,
                                builder: (context, m, child) {
                                  if (!controller.pdfcontroller.isReady) {
                                    return const SizedBox();
                                  }
                                  return Text(
                                    "${(controller.pdfcontroller.zoomRatio * 100).toStringAsFixed(0)}%",
                                    style: AppTextStyle.bold16(
                                        color: Colors.white),
                                  );
                                },
                              ),
                              const VerticalDivider(
                                color: Colors.white,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.pdfcontroller.setZoomRatio(
                                    zoomRatio: 2.0,
                                  );
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ].withSpaceBetween(width: 5),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.launchPdf(path);
                              },
                              child: const Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 513,
                    width: 500,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: PdfViewer.openFutureFile(
                      viewerController: controller.pdfcontroller,
                      () async {
                        return path;
                      },
                      loadingBannerBuilder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      onError: (error) {},
                    ),
                  ),
                ],
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

  // _buildLargeScreen(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             _buildAgencyWidget(),
  //             const SizedBox(width: 10),
  //             _buildContact(),
  //             const SizedBox(width: 10),
  //             _buildPokasWidget(),
  //           ],
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             _buildAddressWidget(),
  //             const SizedBox(width: 10),
  //             // Column(
  //             //   mainAxisAlignment: MainAxisAlignment.start,
  //             //   children: [
  //             //     // _buildQuotaWidget(),
  //             //     // _buildAttachmentWidget(context),
  //             //   ],
  //             // )
  //           ],
  //         ),
  //         const SizedBox(height: 10),
  //       ],
  //     ),
  //   );
  // }

  _buildMidiumScreen(BoxConstraints constraints, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              _buildAgencyWidget(
                width: constraints.maxWidth / 2,
                height: 150,
                padding: const EdgeInsets.only(left: 30, right: 5, bottom: 5),
              ),
              _buildContact(
                width: constraints.maxWidth / 2 - 70,
                height: 150,
                padding: const EdgeInsets.only(left: 5, right: 30, bottom: 5),
              ),
            ],
          ),
          _buildPokasWidget(
              width: constraints.maxWidth,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 520),
          const SizedBox(width: 10),
          _buildAddressWidget(
              width: constraints.maxWidth,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 100),
          const SizedBox(width: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     _buildAddressWidget(height: 200),
          //     const SizedBox(width: 10),
          //     _buildPokasWidget(height: 520),
          //   ],
          // ),
          // _buildQuotaWidget(),
          // _buildAttachmentWidget(context),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  _buildSmallWidget(BoxConstraints constraints, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAgencyWidget(
              width: constraints.maxWidth,
              padding: const EdgeInsets.symmetric(horizontal: 10)),
          _buildContact(
              width: constraints.maxWidth,
              padding: const EdgeInsets.symmetric(horizontal: 10)),
          _buildPokasWidget(
            width: constraints.maxWidth,
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          _buildAddressWidget(
            width: constraints.maxWidth,
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  // _buildAttachmentMidium() {
  //   return CustomCard(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         CustomHeader(
  //             headerWidth: 1100,
  //             title: "attachment".tr,
  //             homeController: homeController),
  //         Container(
  //           padding: const EdgeInsets.all(16),
  //           width: 1100,
  //           child: Column(
  //             children: List.generate(
  //               controller.attachment.length,
  //               (index) => customAttachment(
  //                 child: Row(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Column(
  //                       children: [
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text("Ducument Type",
  //                                 style: AppTextStyle.bold14()),
  //                             Container(
  //                               height: 40,
  //                               width: 350,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 color: Colors.white,
  //                                 boxShadow: [
  //                                   BoxShadow(
  //                                     color: Colors.grey.shade400,
  //                                     blurRadius: 3,
  //                                   ),
  //                                 ],
  //                               ),
  //                             )
  //                           ].withSpaceBetween(height: 5),
  //                         ),
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text("Document Number",
  //                                 style: AppTextStyle.bold14()),
  //                             Container(
  //                               height: 40,
  //                               width: 350,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 color: Colors.white,
  //                                 boxShadow: [
  //                                   BoxShadow(
  //                                     color: Colors.grey.shade400,
  //                                     blurRadius: 3,
  //                                   ),
  //                                 ],
  //                               ),
  //                             )
  //                           ].withSpaceBetween(height: 5),
  //                         ),
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text("Document Issuse At",
  //                                 style: AppTextStyle.bold14()),
  //                             Container(
  //                               height: 40,
  //                               width: 350,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 color: Colors.white,
  //                                 boxShadow: [
  //                                   BoxShadow(
  //                                     color: Colors.grey.shade400,
  //                                     blurRadius: 3,
  //                                   ),
  //                                 ],
  //                               ),
  //                             )
  //                           ].withSpaceBetween(height: 5),
  //                         ),
  //                         Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Text("Document Issuse At",
  //                                 style: AppTextStyle.bold14()),
  //                             Container(
  //                               height: 40,
  //                               width: 350,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 color: Colors.white,
  //                                 boxShadow: [
  //                                   BoxShadow(
  //                                     color: Colors.grey.shade400,
  //                                     blurRadius: 3,
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ].withSpaceBetween(height: 5),
  //                         ),
  //                       ].withSpaceBetween(height: 16),
  //                     ),
  //                     Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(15),
  //                         color: Colors.white,
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Colors.grey.shade400,
  //                             blurRadius: 3,
  //                           ),
  //                         ],
  //                       ),
  //                       alignment: Alignment.center,
  //                       width: 200,
  //                       height: 200,
  //                       child: Text(
  //                         "Attachment",
  //                         style: AppTextStyle.regular18(),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ).withSpaceBetween(height: 10),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // _buildAttachmentSmall(BoxConstraints constraints, BuildContext context) {
  //   return CustomCard(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         CustomHeader(
  //             headerWidth: constraints.maxWidth,
  //             title: "attachment".tr,
  //             homeController: homeController),
  //         Container(
  //           padding: const EdgeInsets.all(16),
  //           width: constraints.maxWidth,
  //           child: controller.attachment.isEmpty
  //               ? Center(
  //                   child: Text(
  //                     "noData".tr,
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize:
  //                             homeController.langCode.value == "kh" ? 18 : 16,
  //                         fontFamily: homeController.langCode.value == "kh"
  //                             ? "Battambang"
  //                             : "SourceSansPro-Regular"),
  //                   ),
  //                 )
  //               : Column(
  //                   children:
  //                       List.generate(controller.attachment.length, (index) {
  //                     var attachment = controller.attachment[index];
  //                     var extension = controller
  //                         .splitUrl(controller.attachment[index].documentPath);
  //                     bool isImage = controller.checkExtenstion(extension);
  //                     return customAttachment(
  //                       child: constraints.maxWidth >= 510
  //                           ? Row(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Column(
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     customAttachmentText(
  //                                       title: "documenttype".tr,
  //                                       data: attachment.documentType,
  //                                     ),
  //                                     customAttachmentText(
  //                                         title: "ducumentnumber".tr,
  //                                         data: attachment.documentNumber),
  //                                   ].withSpaceBetween(height: 16),
  //                                 ),
  //                                 const SizedBox(height: 10),
  //                                 Column(
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     customAttachmentText(
  //                                       title: "ducumentissuse".tr,
  //                                       data: attachment.documentIssuedAt,
  //                                     ),
  //                                     customAttachmentText(
  //                                       title: "documentexpired".tr,
  //                                       data: attachment.documentExpiredAt,
  //                                     ),
  //                                   ].withSpaceBetween(height: 16),
  //                                 ),
  //                                 _buildImage(
  //                                     context: context,
  //                                     isImage: isImage,
  //                                     documentPath: attachment.documentPath),
  //                               ],
  //                             )
  //                           : SingleChildScrollView(
  //                               scrollDirection: Axis.horizontal,
  //                               child: Row(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Column(
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.start,
  //                                     children: [
  //                                       Padding(
  //                                         padding:
  //                                             const EdgeInsets.only(top: 10),
  //                                         child: customAttachmentText(
  //                                           title: "documenttype".tr,
  //                                           data: attachment.documentType,
  //                                         ),
  //                                       ),
  //                                       Padding(
  //                                         padding:
  //                                             const EdgeInsets.only(top: 10),
  //                                         child: customAttachmentText(
  //                                             title: "ducumentnumber".tr,
  //                                             data: attachment.documentNumber),
  //                                       ),
  //                                       Padding(
  //                                         padding:
  //                                             const EdgeInsets.only(top: 10),
  //                                         child: customAttachmentText(
  //                                           title: "ducumentissuse".tr,
  //                                           data: attachment.documentIssuedAt,
  //                                         ),
  //                                       ),
  //                                       Padding(
  //                                         padding:
  //                                             const EdgeInsets.only(top: 10),
  //                                         child: customAttachmentText(
  //                                           title: "documentexpired".tr,
  //                                           data: attachment.documentExpiredAt,
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                   _buildImage(
  //                                       context: context,
  //                                       isImage: isImage,
  //                                       documentPath: attachment.documentPath),
  //                                 ],
  //                               ),
  //                             ),
  //                     );
  //                   }).withSpaceBetween(height: 10),
  //                 ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _buildAgencyWidget({
    required double width,
    required EdgeInsetsGeometry padding,
    double? height,
  }) {
    String showCountryCode = controller.agency?.countryCode == null
        ? ""
        : "(${controller.agency?.countryCode})";
    String showOtherContryCode =
        controller.agency?.agencyCountryCodeOther == null
            ? ""
            : "(${controller.agency?.agencyCountryCodeOther})";
    return Padding(
      padding: padding,
      child: CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomHeader(
              headerWidth: width,
              title: "agencyinfo".tr,
              homeController: homeController,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                right: 10,
              ),
              width: width,
              height: height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // CustomText(
                    //   tilteFlex: tilteFlex,
                    //   dataFlex: dataFlex,
                    //   maxFontSize: 18,
                    //   title: 'country'.tr,
                    //   data: homeController.langCode.value == "en"
                    //       ? controller
                    //               .agencyData.value!.agency.country.englishName ??
                    //           ""
                    //       : controller.agencyData.value!.agency.country.khmerName ??
                    //           "",
                    //   homeController: homeController,
                    //   dataStyle: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: homeController.langCode.value == "en" ? 18 : 16,
                    //       fontFamily: homeController.langCode.value == "en"
                    //           ? "SourceSansPro-Regular"
                    //           : "Battambang"),
                    // ),
                    CustomText(
                      tilteFlex: tilteFlex,
                      dataFlex: dataFlex,
                      maxLine: 2,
                      title: 'agencyName'.tr,
                      data: controller.agency?.khmerName ?? "",
                      homeController: homeController,
                      dataStyle: AppTextStyle.bold14(fontFamily: "Battambang"),
                      data1: controller.agency?.khmerName ?? "",
                      data2: controller.agency?.latinName ?? "",
                      multidata: true,
                    ),
                    // CustomText(
                    //   tilteFlex: tilteFlex,
                    //   dataFlex: dataFlex,
                    //   maxFontSize: 18,
                    //   title: 'agentcylatin'.tr,
                    //   data: controller.agency?.latinName ?? "",
                    //   homeController: homeController,
                    //   dataStyle: AppTextStyle.bold18(),
                    // ),
                    // CustomText(
                    //   tilteFlex: tilteFlex,
                    //   dataFlex: dataFlex,
                    //   maxFontSize: 18,
                    //   title: 'abreviate'.tr,
                    //   data: controller.agency?.nameAbbreviate ?? "",
                    //   homeController: homeController,
                    //   dataStyle: AppTextStyle.bold18(),
                    // ),
                    // CustomText(
                    //   tilteFlex: tilteFlex,
                    //   dataFlex: dataFlex,
                    //   maxFontSize: 18,
                    //   maxLine: 2,
                    //   title: 'agencyemail'.tr,
                    //   data: controller.agency?.agencyEmail ?? "",
                    //   homeController: homeController,
                    //   dataStyle:
                    //       AppTextStyle.bold18(fontFamily: "SourceSansPro-Regular"),
                    // ),
                    // CustomText(
                    //   tilteFlex: tilteFlex,
                    //   dataFlex: dataFlex,
                    //   maxFontSize: 18,
                    //   title: 'companytin'.tr,
                    //   data: controller.agency?.companyTin ?? "",
                    //   dataStyle: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: homeController.langCode.value == "en" ? 18 : 16,
                    //       fontFamily: homeController.langCode.value == "en"
                    //           ? "SourceSansPro-Regular"
                    //           : "Battambang"),
                    //   homeController: homeController,
                    // ),
                    // CustomText(
                    //   tilteFlex: tilteFlex,
                    //   dataFlex: dataFlex,
                    //   maxFontSize: 18,
                    //   title: 'countrycode'.tr,
                    //   data: controller.agency?.countryCode ?? "",
                    //   homeController: homeController,
                    // ),
                    CustomText(
                      tilteFlex: tilteFlex,
                      dataFlex: dataFlex,
                      maxLine: 2,
                      title: 'phonenumber'.tr,
                      data: controller.agency?.agencyPhoneNumber == null
                          ? "N/A"
                          : "(${controller.agency?.countryCode ?? ""}) ${controller.agency?.agencyPhoneNumber ?? ""}",
                      homeController: homeController,
                      dataStyle: AppTextStyle.bold14(fontFamily: "Battambang"),
                      data1:
                          "$showCountryCode ${controller.agency?.agencyPhoneNumber ?? ""}",
                      data2:
                          "$showOtherContryCode ${controller.agency?.agencyPhoneNumberOther ?? ""}",
                      multidata: true,
                    ),
                    // CustomText(
                    //   tilteFlex: tilteFlex,
                    //   dataFlex: dataFlex,
                    //   title: "phonenumber".tr,
                    //   data:
                    //       "(${controller.agency?.countryCode ?? ""}) ${controller.agency?.agencyPhoneNumber ?? ""}",
                    //   dataStyle: AppTextStyle.bold14(fontFamily: "Battambang"),
                    //   homeController: homeController,
                    // ),
                    const SizedBox(
                      height: 10,
                    )
                  ].withSpaceBetween(height: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAddressWidget(
      {required double width,
      required EdgeInsetsGeometry padding,
      double? height}) {
    return Padding(
      padding: padding,
      child: CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomHeader(
                headerWidth: width,
                title: "companyaddress".tr,
                homeController: homeController),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                right: 10,
              ),
              alignment: Alignment.topCenter,
              width: width,
              height: height,
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    controller.agencyData.value?.address.fullAddress ?? "",
                    style: AppTextStyle.bold14(fontFamily: "Battambang"),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    controller.agencyData.value?.address.fullAddressEn ?? "",
                    style: AppTextStyle.bold14(fontFamily: "Battambang"),
                  ),
                ].withSpaceBetween(height: 5),
              ),
              // child: Column(
              //   children: [
              //     const SizedBox(height: 10),
              //     CustomText(
              //       maxLine: 5,
              //       tilteFlex: tilteFlex,
              //       dataFlex: 3,
              //       maxFontSize: 18,
              //       title: 'address'.tr,
              //       data: controller.agencyData.value?.address.fullAddress ?? "",
              //       homeController: homeController,
              //       dataStyle: AppTextStyle.bold16(fontFamily: "Battambang"),
              //     ),
              //     CustomText(
              //       maxLine: 3,
              //       tilteFlex: tilteFlex,
              //       dataFlex: 2,
              //       maxFontSize: 18,
              //       title: 'address1'.tr,
              //       data: controller.agencyData.value?.address.line1 ?? "",
              //       homeController: homeController,
              //       dataStyle: AppTextStyle.bold16(fontFamily: "Battambang"),
              //     ),
              //     CustomText(
              //         maxLine: 2,
              //         tilteFlex: tilteFlex,
              //         dataFlex: 2,
              //         maxFontSize: 18,
              //         title: 'address2'.tr,
              //         data: controller.agencyData.value?.address.line2 ?? "",
              //         homeController: homeController),
              //     CustomText(
              //         maxLine: 2,
              //         tilteFlex: tilteFlex,
              //         dataFlex: 2,
              //         maxFontSize: 18,
              //         title: 'addresslatin'.tr,
              //         data: controller.agencyData.value?.address.inLatin ?? "",
              //         homeController: homeController),
              //     CustomText(
              //         maxLine: 2,
              //         tilteFlex: tilteFlex,
              //         dataFlex: 2,
              //         maxFontSize: 18,
              //         title: 'postalcode'.tr,
              //         data: controller.agencyData.value?.address.postalCode ?? "",
              //         homeController: homeController),
              //     CustomRichText(
              //         maxLine: 2,
              //         tilteFlex: tilteFlex,
              //         dataFlex: 3,
              //         maxFontSize: 18,
              //         title: 'province'.tr,
              //         data: controller.agencyData.value?.address.province == null
              //             ? []
              //             : controller.splitString(
              //                 controller.agencyData.value?.address.province,
              //               ),
              //         homeController: homeController),
              //     CustomRichText(
              //         maxLine: 2,
              //         tilteFlex: tilteFlex,
              //         dataFlex: 3,
              //         maxFontSize: 18,
              //         title: 'district'.tr,
              //         data: controller.agencyData.value?.address.district == null
              //             ? []
              //             : controller.splitString(
              //                 controller.agencyData.value?.address.district,
              //               ),
              //         homeController: homeController),
              //     CustomRichText(
              //         maxLine: 2,
              //         tilteFlex: tilteFlex,
              //         dataFlex: 3,
              //         maxFontSize: 18,
              //         title: 'commune'.tr,
              //         data: controller.agencyData.value?.address.commune == null
              //             ? []
              //             : controller.splitString(
              //                 controller.agencyData.value?.address.commune,
              //               ),
              //         homeController: homeController),
              //     CustomRichText(
              //         maxLine: 2,
              //         tilteFlex: tilteFlex,
              //         dataFlex: 3,
              //         maxFontSize: 18,
              //         title: 'village'.tr,
              //         data: controller.agencyData.value?.address.village == null
              //             ? []
              //             : controller.splitString(
              //                 controller.agencyData.value?.address.village,
              //               ),
              //         homeController: homeController),
              //     const SizedBox(height: 15),
              //   ].withSpaceBetween(height: 16),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customAttachment({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: child,
    );
  }

  // _buildImage(
  //     {required BuildContext context,
  //     required bool isImage,
  //     required String documentPath}) {
  //   return isImage
  //       ? InkWell(
  //           onTap: () {
  //             // controller.fetchImageBytes(documentPath);
  //             dialogShowImage(context, documentPath);
  //           },
  //           child: Container(
  //             padding: const EdgeInsets.all(5),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.grey.shade400,
  //                   blurRadius: 3,
  //                 ),
  //               ],
  //             ),
  //             alignment: Alignment.center,
  //             width: 150,
  //             height: 180,
  //             child: CachedNetworkImage(
  //               imageUrl: documentPath,
  //               progressIndicatorBuilder: (context, url, downloadProgress) =>
  //                   CircularProgressIndicator(
  //                 value: downloadProgress.progress,
  //               ),
  //               imageBuilder: (context, imageProvider) {
  //                 return Container(
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(image: imageProvider),
  //                   ),
  //                 );
  //               },
  //               errorWidget: (context, url, error) => Container(
  //                 width: 150,
  //                 height: 180,
  //                 padding: const EdgeInsets.all(8.0),
  //                 decoration: const BoxDecoration(
  //                   image: DecorationImage(
  //                       image: AssetImage('assets/images/noimage.jpg')),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         )
  //       : InkWell(
  //           onTap: () async {
  //             controller.launchPdf(documentPath);
  //             // dialogShowImage(context, documentPath, fileType: "pdf");
  //           },
  //           child: Column(
  //             children: [
  //               Container(
  //                 height: 120,
  //                 width: 120,
  //                 decoration: BoxDecoration(
  //                   image: const DecorationImage(
  //                       image: AssetImage('assets/images/pdf_logo.jpg')),
  //                   border: Border.all(color: Colors.grey[300]!),
  //                 ),
  //               ),
  //               Text("filetype".tr,
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontFamily: homeController.langCode.value == "en"
  //                         ? "SourceSansPro-Bold"
  //                         : "Battambang-Bold",
  //                     fontSize: homeController.langCode.value == "en" ? 14 : 12,
  //                   )),
  //               Text("clickfile".tr,
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     fontFamily: homeController.langCode.value == "en"
  //                         ? "SourceSansPro-Regular"
  //                         : "Battambang",
  //                     fontSize: homeController.langCode.value == "en" ? 14 : 12,
  //                   )),
  //             ].withSpaceBetween(height: 5),
  //           ),
  //         );
  // }

  // _buildAttachmentWidget(BuildContext context) {
  //   return CustomCard(
  //     child: Column(
  //       children: [
  //         CustomHeader(
  //           headerWidth: 1110,
  //           title: "attachment".tr,
  //           homeController: homeController,
  //         ),
  //         Container(
  //           padding: const EdgeInsets.all(16),
  //           width: 1110,
  //           height: 300,
  //           child: controller.attachment.isEmpty
  //               ? Center(
  //                   child: Text(
  //                     "noData".tr,
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize:
  //                             homeController.langCode.value == "kh" ? 20 : 18,
  //                         fontFamily: homeController.langCode.value == "kh"
  //                             ? "Battambang"
  //                             : "SourceSansPro-Regular"),
  //                   ),
  //                 )
  //               : ListView(
  //                   children: List.generate(
  //                     controller.attachment.length,
  //                     (index) {
  //                       var attachment = controller.attachment[index];
  //                       var extension = controller.splitUrl(
  //                           controller.attachment[index].documentPath);
  //                       bool isImage = controller.checkExtenstion(extension);
  //                       return customAttachment(
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 customAttachmentText(
  //                                   title: "documenttype".tr,
  //                                   data: attachment.documentType,
  //                                 ),
  //                                 customAttachmentText(
  //                                     title: "ducumentnumber".tr,
  //                                     data: attachment.documentNumber),
  //                               ].withSpaceBetween(height: 16),
  //                             ),
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 customAttachmentText(
  //                                   title: "ducumentissuse".tr,
  //                                   data: attachment.documentIssuedAt,
  //                                 ),
  //                                 customAttachmentText(
  //                                   title: "documentexpired".tr,
  //                                   data: attachment.documentExpiredAt,
  //                                 ),
  //                               ].withSpaceBetween(height: 16),
  //                             ),
  //                             _buildImage(
  //                                 context: context,
  //                                 isImage: isImage,
  //                                 documentPath: attachment.documentPath),
  //                           ],
  //                         ),
  //                       );
  //                     },
  //                   ).withSpaceBetween(height: 10),
  //                 ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Column customAttachmentText({
    required String title,
    required String data,
    TextStyle? tileStyle,
    TextStyle? dataStyle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: tileStyle ??
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: homeController.langCode.value == "en" ? 16 : 14,
                fontFamily: homeController.langCode.value == "en"
                    ? "SourceSansPro-Regular"
                    : "Battambang",
              ),
        ),
        Container(
          height: 40,
          alignment: Alignment.centerLeft,
          child: Text(
            data,
            style: dataStyle ??
                const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "SourceSansPro-Regular",
                ),
          ),
        )
      ].withSpaceBetween(height: 5),
    );
  }

  _buildContact(
      {required double width,
      required EdgeInsetsGeometry padding,
      double? height}) {
    return Padding(
      padding: padding,
      child: CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomHeader(
              headerWidth: width,
              title: "contact".tr,
              homeController: homeController,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                top: 10,
                right: 10,
              ),
              width: width,
              height: height,
              child: Column(
                  children: [
                CustomText(
                  tilteFlex: tilteFlex,
                  dataFlex: 2,
                  title: 'khmername'.tr,
                  data: controller.agencyData.value?.contact.khmerName ?? "N/A",
                  homeController: homeController,
                  dataStyle: AppTextStyle.bold14(fontFamily: "Battambang"),
                  multidata: true,
                  data1:
                      controller.agencyData.value?.contact.khmerName ?? "N/A",
                  data2: controller.agencyData.value?.contact.latinName ?? "",
                ),
                // CustomText(
                //     tilteFlex: tilteFlex,
                //     dataFlex: 2,
                //     maxFontSize: 18,
                //     title: 'latinname'.tr,
                //     data: controller.agencyData.value?.contact.latinName ?? "",
                //     homeController: homeController),
                // CustomText(
                //   tilteFlex: tilteFlex,
                //   dataFlex: 2,
                //   maxFontSize: 18,
                //   title: 'position'.tr,
                //   data: homeController.langCode.value == "en"
                //       ? controller.agencyData.value?.contact.position.enName ?? ""
                //       : controller.agencyData.value?.contact.position.khName ??
                //           "",
                //   homeController: homeController,
                // ),
                CustomText(
                  tilteFlex: tilteFlex,
                  dataFlex: 2,
                  dataStyle: AppTextStyle.bold14(fontFamily: "Battambang"),
                  title: 'phonenumber'.tr,
                  data: controller.agencyData.value?.contact.phoneNumber == null
                      ? "N/A"
                      : "(${controller.agencyData.value?.contact.phoneCode ?? ""}) ${controller.agencyData.value?.contact.phoneNumber ?? ""}",
                  homeController: homeController,
                ),
                // CustomText(
                //     tilteFlex: tilteFlex,
                //     dataFlex: 2,
                //     maxFontSize: 18,
                //     maxLine: 3,
                //     title: 'address'.tr,
                //     data: controller.agencyData.value?.contact.address ?? "",
                //     homeController: homeController),
                // CustomText(
                //   tilteFlex: tilteFlex,
                //   dataFlex: 2,
                //   maxFontSize: 18,
                //   title: 'winesses'.tr,
                //   data: controller.agencyData.value?.contact.witnesses ?? "",
                //   homeController: homeController,
                //   dataStyle: AppTextStyle.bold16(fontFamily: "Battambang"),
                // ),
                const SizedBox(
                  height: 10,
                ),
              ].withSpaceBetween(height: 16)),
            )
          ],
        ),
      ),
    );
  }

  _buildPokasWidget(
      {required double width,
      required EdgeInsetsGeometry padding,
      double? height}) {
    return Padding(
      padding: padding,
      child: CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomHeader(
              headerWidth: width,
              title:
                  "${"prokas".tr}  ${controller.prokas.isEmpty ? "" : controller.prokas.first.prokasNumber ?? ""}",
              homeController: homeController,
            ),
            Container(
                padding: const EdgeInsets.all(10),
                width: width,
                height: 200,
                child: controller.prokas.isEmpty
                    ? Center(
                        child: Text(
                          "noData".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: homeController.langCode.value == "kh"
                                  ? 18
                                  : 16,
                              fontFamily: homeController.langCode.value == "kh"
                                  ? "Battambang"
                                  : "SourceSansPro-Regular"),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 10,
                          right: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: tilteFlex,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8),
                                    alignment: Alignment.centerLeft,
                                    child: AutoSizeText(
                                      "country".tr,
                                      minFontSize: 14,
                                      maxLines: 1,
                                      maxFontSize: 16,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              homeController.langCode.value ==
                                                      "en"
                                                  ? 16
                                                  : 14,
                                          fontFamily: "Battambang"),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  padding: const EdgeInsets.only(right: 8),
                                  alignment: Alignment.centerRight,
                                  child: const Text(":"),
                                ),
                                Flexible(
                                  flex: dataFlex,
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 8),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                            controller.prokas.length,
                                            (index) => AutoSizeText(
                                              "${controller.prokas[index].country.khmerName} ${index < controller.prokas.length - 1 ? ',' : ''}",
                                              minFontSize: 14,
                                              maxLines: 1,
                                              maxFontSize: 16,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: homeController
                                                              .langCode.value ==
                                                          "en"
                                                      ? 16
                                                      : 14,
                                                  fontFamily: "Battambang"),
                                            ),
                                          ).withSpaceBetween(width: 5))),
                                )
                              ],
                            ),
                            CustomText(
                              title: "prokasissuse".tr,
                              data: controller.prokas.first.prokasIssuedAt,
                              homeController: homeController,
                              dataStyle: AppTextStyle.bold18(),
                            ),
                            CustomText(
                              title: "prokasexpire".tr,
                              data: controller.prokas.first.prokasExpiredAt,
                              homeController: homeController,
                              dataStyle: AppTextStyle.bold18(),
                            ),
                          ].withSpaceBetween(height: 10),
                        ),
                      )
                // ListView(
                //     children: List.generate(
                //       controller.prokas.length,
                //       (index) {
                //         var proka = controller.prokas[index];
                //         return Container(
                //           padding: const EdgeInsets.all(10),
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(5),
                //               color: Colors.white,
                //               border: Border.all(color: Colors.grey[200]!)),
                //           child: Column(
                //             children: [
                //               CustomText(
                //                   title: "country".tr,
                //                   data: homeController.langCode.value == "en"
                //                       ? proka.country.englishName
                //                       : proka.country.khmerName,
                //                   homeController: homeController),
                //               // CustomText(
                //               //   title: "prokasnumber".tr,
                //               //   data: proka.prokasNumber,
                //               //   homeController: homeController,
                //               //   dataStyle: AppTextStyle.bold16(
                //               //     fontFamily: "Battambang",
                //               //   ),
                //               // ),
                //               CustomText(
                //                 title: "prokasissuse".tr,
                //                 data: proka.prokasIssuedAt,
                //                 homeController: homeController,
                //                 dataStyle: AppTextStyle.bold18(),
                //               ),
                //               CustomText(
                //                 title: "prokasexpire".tr,
                //                 data: proka.prokasExpiredAt,
                //                 homeController: homeController,
                //                 dataStyle: AppTextStyle.bold18(),
                //               ),
                //             ].withSpaceBetween(height: 10),
                //           ),
                //         );
                //       },
                //     ).withSpaceBetween(height: 10),
                //   ),
                )
          ],
        ),
      ),
    );
  }

  // _buildProkasSmallWidget({BoxConstraints? constraints}) {
  //   return CustomCard(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         CustomHeader(
  //           headerWidth: constraints?.maxWidth ?? 550,
  //           title:
  //               "${"prokas".tr}  ${controller.prokas.isEmpty ? "" : controller.prokas.first.prokasNumber ?? ""}",
  //           homeController: homeController,
  //         ),
  //         Container(
  //           padding: const EdgeInsets.all(10),
  //           width: constraints?.maxWidth ?? 550,
  //           child: controller.prokas.isEmpty
  //               ? Center(
  //                   child: Text(
  //                     "noData".tr,
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize:
  //                             homeController.langCode.value == "kh" ? 18 : 16,
  //                         fontFamily: homeController.langCode.value == "kh"
  //                             ? "Battambang"
  //                             : "SourceSansPro-Regular"),
  //                   ),
  //                 )
  //               : Column(
  //                   children: List.generate(
  //                     controller.prokas.length,
  //                     (index) {
  //                       var proka = controller.prokas[index];
  //                       return Container(
  //                         padding: const EdgeInsets.all(10),
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(5),
  //                             color: Colors.white,
  //                             border: Border.all(color: Colors.grey[200]!)),
  //                         child: Column(
  //                           children: [
  //                             CustomText(
  //                               title: "country".tr,
  //                               data: homeController.langCode.value == "en"
  //                                   ? proka.country.englishName
  //                                   : proka.country.khmerName,
  //                               homeController: homeController,
  //                             ),
  //                             // CustomText(
  //                             //   title: "prokasnumber".tr,
  //                             //   data: proka.prokasNumber,
  //                             //   homeController: homeController,
  //                             //   dataStyle: AppTextStyle.bold16(
  //                             //     fontFamily: "Battambang",
  //                             //   ),
  //                             // ),
  //                             CustomText(
  //                               title: "prokasissuse".tr,
  //                               data: proka.prokasIssuedAt,
  //                               homeController: homeController,
  //                               dataStyle: AppTextStyle.bold18(),
  //                             ),
  //                             CustomText(
  //                               title: "prokasexpire".tr,
  //                               data: proka.prokasExpiredAt,
  //                               homeController: homeController,
  //                               dataStyle: AppTextStyle.bold18(),
  //                             ),
  //                           ].withSpaceBetween(height: 10),
  //                         ),
  //                       );
  //                     },
  //                   ).withSpaceBetween(height: 16),
  //                 ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // _buildQuotaWidget({BoxConstraints? constraints}) {
  //   return CustomCard(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         CustomHeader(
  //           headerWidth: constraints?.maxWidth ?? 1110,
  //           title: "quota".tr,
  //           homeController: homeController,
  //         ),
  //         Container(
  //           padding: const EdgeInsets.only(
  //             left: 10,
  //             top: 10,
  //             right: 10,
  //           ),
  //           width: constraints?.maxWidth ?? 1110,
  //           height: 150,
  //           child: Column(
  //             children: [
  //               CustomText(
  //                   title: "total".tr,
  //                   data: controller.quota?.total ?? "0",
  //                   homeController: homeController),
  //               CustomText(
  //                   title: "male".tr,
  //                   data: controller.quota?.male ?? "0",
  //                   homeController: homeController),
  //               CustomText(
  //                   title: "female".tr,
  //                   data: controller.quota?.female ?? '0',
  //                   homeController: homeController),
  //             ].withSpaceBetween(height: 16),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  _buildAppbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          print(controller.agencyList.length);
          if (controller.agencyList.isEmpty) {
            RouteView.findagency.go(
              backRoutes: RouteView.findagency.name,
            );
          } else {
            // RouteView.listAgency.go(
            //   backRoutes: RouteView.listAgency.name,
            //   parameters: {"name": controller.readAgency()},
            // );
            Get.back();
          }
        },
        icon: const Icon(Icons.arrow_back),
      ),
      backgroundColor: const Color.fromARGB(255, 71, 122, 211),
      centerTitle: true,
      title: Text(
        "agencytitle".tr,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: homeController.langCode.value == "kh"
                ? "Battambang"
                : "SourceSansPro-Regular"),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: PopupMenuWidget(),
        ),
      ],
    );
  }
}

class FilePreview extends StatefulWidget {
  const FilePreview({
    super.key,
  });

  @override
  State<FilePreview> createState() => _FilePreviewState();
}

class _FilePreviewState extends State<FilePreview> {
  final agencyController = Get.put(AgencyController());
  final controller = PdfViewerController();
  String imagePath = "";
  @override
  void initState() {
    if (Get.arguments == null) {
      setState(() {
        print("imagePath = $imagePath");
        imagePath = agencyController.readImagePath();
      });
    } else {
      setState(() {
        imagePath = Get.arguments;
        print(imagePath);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, constrained) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: constrained.maxHeight * 0.90,
                width: constrained.maxWidth * 0.50,
                padding: const EdgeInsets.all(10),
                child: PdfViewer.openFutureFile(() async {
                  return imagePath;
                }, loadingBannerBuilder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, onError: (error) {}),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                margin: const EdgeInsets.only(top: 30, left: 10),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        );
      }),
    );
  }
}
