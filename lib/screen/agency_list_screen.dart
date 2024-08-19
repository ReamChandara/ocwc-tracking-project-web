// ignore_for_file: avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/responsive/main_resposive.dart';
import 'package:tracking_web/config/theme/app_theme.dart';
import 'package:tracking_web/controller/agency_controller.dart';
import '../controller/home_controller.dart';
import '../widget/dialog_widget.dart';
import '../widget/popup_menu_widget.dart';

class AgencyListScreen extends GetView<AgencyController> {
  AgencyListScreen({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return MainResposive(
      large: Scaffold(
        appBar: _buildAppbar(),
        body: _buildLargeScreen(),
      ),
      medium: Scaffold(
        appBar: _buildAppbar(),
        body: _buildMeduim(),
      ),
      small: Scaffold(
        appBar: _buildAppbar(),
        body: _buildSmallScreen(),
      ),
    );
  }

  _customTableCell(
    String tile, {
    AlignmentGeometry? alignment = Alignment.center,
    double? height,
  }) {
    return TableCell(
      child: Container(
        height: height ?? 50,
        padding: const EdgeInsets.only(right: 10),
        alignment: alignment,
        child: AutoSizeText(
          tile,
          minFontSize: homeController.langCode.value == "kh" ? 12 : 14,
          maxFontSize: homeController.langCode.value == "kh" ? 16 : 18,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: homeController.langCode.value == "kh"
                  ? "Battambang-Bold"
                  : "SourceSansPro-Bold"),
        ),
      ),
    );
  }

  _buildSmallScreen() {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return SingleChildScrollView(
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // table headers
                              Container(
                                width: boxConstraints.maxWidth * 0.80,
                                decoration: BoxDecoration(
                                  color: AppColors.blur,
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15)),
                                ),
                                child: Table(
                                  columnWidths: const {
                                    0: FixedColumnWidth(120),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(children: [
                                      _customTableCell(
                                        'country'.tr,
                                      ),
                                      _customTableCell(
                                        'agencykhmer'.tr,
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                              // table data
                              Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey[300]!),
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(15),
                                    ),
                                  ),
                                  height: Get.height * 0.90 - 100,
                                  width: boxConstraints.maxWidth * 0.80,
                                  child: Obx(
                                    () {
                                      return controller.loadingList.value
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ListView.builder(
                                              itemCount:
                                                  controller.agencyList.length,
                                              itemBuilder: (context, indexRow) {
                                                var agencyData = controller
                                                    .agencyList[indexRow]
                                                    .agency;
                                                return InkWell(
                                                  hoverColor: Colors.grey[200],
                                                  onTap: () async {
                                                    DialogWidget.laodingDailog(
                                                      context,
                                                      homeController
                                                          .langCode.value,
                                                    );
                                                    controller.getAgencyDetails(
                                                      context,
                                                      controller
                                                          .agencyList[indexRow]
                                                          .hashId,
                                                      homeController
                                                          .langCode.value,
                                                    );
                                                  },
                                                  child: Table(
                                                    defaultVerticalAlignment:
                                                        TableCellVerticalAlignment
                                                            .middle,
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(120),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        TableCell(
                                                          child: Table(
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      margin: const EdgeInsets
                                                                          .all(
                                                                          12),
                                                                      child:
                                                                          Text(
                                                                        homeController.langCode.value == "kh"
                                                                            ? agencyData.country.khmerName ??
                                                                                ""
                                                                            : agencyData.country.englishName ??
                                                                                '',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontFamily: homeController.langCode.value == "kh"
                                                                                ? "Battambang"
                                                                                : "SourceSansPro-Regular",
                                                                            fontSize: homeController.langCode.value == "kh"
                                                                                ? 14
                                                                                : 16),
                                                                      ),
                                                                    ),
                                                                  ])
                                                            ],
                                                          ),
                                                        ),
                                                        TableCell(
                                                          child: Table(
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          bottom:
                                                                              10),
                                                                      child: AutoSizeText(
                                                                          agencyData.khmerName ??
                                                                              "",
                                                                          minFontSize:
                                                                              12,
                                                                          maxFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              4,
                                                                          style:
                                                                              const TextStyle(fontFamily: "Battambang")),
                                                                    ),
                                                                  ])
                                                            ],
                                                          ),
                                                        ),
                                                        const TableCell(
                                                          child: Icon(Icons
                                                              .arrow_forward),
                                                        ),
                                                        // TableCell(
                                                        //     child: Table(
                                                        //         children: [
                                                        //       TableRow(
                                                        //           children: [
                                                        //             Container(
                                                        //               margin: const EdgeInsets
                                                        //                   .only(
                                                        //                   top:
                                                        //                       10,
                                                        //                   right:
                                                        //                       10,
                                                        //                   bottom:
                                                        //                       10),
                                                        //               alignment:
                                                        //                   Alignment
                                                        //                       .centerLeft,
                                                        //               child: AutoSizeText(
                                                        //                   agencyData.latinName ??
                                                        //                       '',
                                                        //                   minFontSize:
                                                        //                       14,
                                                        //                   maxFontSize:
                                                        //                       16,
                                                        //                   maxLines:
                                                        //                       2,
                                                        //                   style:
                                                        //                       const TextStyle(fontFamily: "SourceSansPro-Regular")),
                                                        //             )
                                                        //           ])
                                                        //     ])),
                                                        // TableCell(
                                                        //     child: Table(
                                                        //         children: [
                                                        //       TableRow(
                                                        //           children: [
                                                        //             Container(
                                                        //               margin: const EdgeInsets
                                                        //                   .all(
                                                        //                   12),
                                                        //               alignment:
                                                        //                   Alignment
                                                        //                       .center,
                                                        //               constraints:
                                                        //                   const BoxConstraints(
                                                        //                 // maxWidth: 100,
                                                        //                 minWidth:
                                                        //                     50,
                                                        //                 minHeight:
                                                        //                     30,
                                                        //               ),
                                                        //               child:
                                                        //                   AutoSizeText(
                                                        //                 agencyData.nameAbbreviate ??
                                                        //                     "",
                                                        //                 minFontSize:
                                                        //                     14,
                                                        //                 maxLines:
                                                        //                     3,
                                                        //                 maxFontSize:
                                                        //                     16,
                                                        //                 textAlign:
                                                        //                     TextAlign.center,
                                                        //                 style: TextStyle(
                                                        //                     fontFamily: homeController.langCode.value == "en"
                                                        //                         ? "SourceSansPro-Regular"
                                                        //                         : "Battambang"),
                                                        //               ),
                                                        //             )
                                                        //           ])
                                                        //     ]))
                                                      ]),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                    },
                                  ))
                            ])
                      ]))));
    });
  }

  _buildMeduim() {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return SingleChildScrollView(
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // table headers
                              Container(
                                width: boxConstraints.maxWidth * 0.80,
                                decoration: BoxDecoration(
                                  color: AppColors.blur,
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15)),
                                ),
                                child: Table(
                                  columnWidths: const {
                                    0: FixedColumnWidth(200),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(children: [
                                      _customTableCell('country'.tr,
                                          height: 60),
                                      _customTableCell(
                                        'agencykhmer'.tr,
                                        alignment: Alignment.centerLeft,
                                        height: 60,
                                      ),
                                      _customTableCell('abreviate'.tr),
                                      const TableCell(child: SizedBox())
                                    ]),
                                  ],
                                ),
                              ),
                              // table data
                              Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey[300]!),
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(15),
                                    ),
                                  ),
                                  height: Get.height * 0.90 - 100,
                                  width: boxConstraints.maxWidth * 0.80,
                                  child: Obx(
                                    () {
                                      return controller.loadingList.value
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ListView.builder(
                                              itemCount:
                                                  controller.agencyList.length,
                                              itemBuilder: (context, indexRow) {
                                                var agencyData = controller
                                                    .agencyList[indexRow]
                                                    .agency;
                                                return InkWell(
                                                  hoverColor: Colors.grey[200],
                                                  onTap: () async {
                                                    DialogWidget.laodingDailog(
                                                      context,
                                                      homeController
                                                          .langCode.value,
                                                    );
                                                    controller.getAgencyDetails(
                                                      context,
                                                      controller
                                                          .agencyList[indexRow]
                                                          .hashId,
                                                      homeController
                                                          .langCode.value,
                                                    );
                                                  },
                                                  child: Table(
                                                    defaultVerticalAlignment:
                                                        TableCellVerticalAlignment
                                                            .middle,
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(200),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        TableCell(
                                                          child: Table(
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      margin: const EdgeInsets
                                                                          .all(
                                                                          12),
                                                                      child:
                                                                          Text(
                                                                        homeController.langCode.value == "kh"
                                                                            ? agencyData.country.khmerName ??
                                                                                ""
                                                                            : agencyData.country.englishName ??
                                                                                '',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontFamily: homeController.langCode.value == "kh"
                                                                                ? "Battambang"
                                                                                : "SourceSansPro-Regular",
                                                                            fontSize: homeController.langCode.value == "kh"
                                                                                ? 14
                                                                                : 16),
                                                                      ),
                                                                    ),
                                                                  ])
                                                            ],
                                                          ),
                                                        ),
                                                        TableCell(
                                                          child: Table(
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          bottom:
                                                                              10),
                                                                      child: AutoSizeText(
                                                                          agencyData.khmerName ??
                                                                              "",
                                                                          minFontSize:
                                                                              12,
                                                                          maxFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              2,
                                                                          style:
                                                                              const TextStyle(fontFamily: "Battambang")),
                                                                    ),
                                                                  ])
                                                            ],
                                                          ),
                                                        ),
                                                        TableCell(
                                                            child: Table(
                                                                children: [
                                                              TableRow(
                                                                  children: [
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                          .all(
                                                                          12),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      constraints:
                                                                          const BoxConstraints(
                                                                        // maxWidth: 100,
                                                                        minWidth:
                                                                            50,
                                                                        minHeight:
                                                                            30,
                                                                      ),
                                                                      child:
                                                                          AutoSizeText(
                                                                        agencyData.nameAbbreviate ??
                                                                            "",
                                                                        minFontSize:
                                                                            14,
                                                                        maxLines:
                                                                            3,
                                                                        maxFontSize:
                                                                            16,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontFamily: homeController.langCode.value == "en"
                                                                                ? "SourceSansPro-Regular"
                                                                                : "Battambang"),
                                                                      ),
                                                                    )
                                                                  ])
                                                            ])),
                                                        const TableCell(
                                                          child: Icon(Icons
                                                              .arrow_forward),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                    },
                                  ))
                            ])
                      ]))));
    });
  }

  _buildLargeScreen() {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return SingleChildScrollView(
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // table headers
                              Container(
                                width: boxConstraints.maxWidth * 0.80,
                                decoration: BoxDecoration(
                                  color: AppColors.blur,
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(15)),
                                ),
                                child: Table(
                                  columnWidths: const {
                                    0: FixedColumnWidth(200),
                                  },
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(children: [
                                      _customTableCell('country'.tr),
                                      _customTableCell(
                                        'agencykhmer'.tr,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      _customTableCell(
                                        'agentcylatin'.tr,
                                        alignment: Alignment.centerLeft,
                                      ),
                                      _customTableCell('abreviate'.tr),
                                      const TableCell(child: SizedBox())
                                    ]),
                                  ],
                                ),
                              ),
                              // table data
                              Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey[300]!),
                                    borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(15),
                                    ),
                                  ),
                                  height: Get.height * 0.90 - 100,
                                  width: boxConstraints.maxWidth * 0.80,
                                  child: Obx(
                                    () {
                                      return controller.loadingList.value
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ListView.builder(
                                              itemCount:
                                                  controller.agencyList.length,
                                              itemBuilder: (context, indexRow) {
                                                var agencyData = controller
                                                    .agencyList[indexRow]
                                                    .agency;
                                                return InkWell(
                                                  hoverColor: Colors.grey[200],
                                                  onTap: () async {
                                                    DialogWidget.laodingDailog(
                                                      context,
                                                      homeController
                                                          .langCode.value,
                                                    );
                                                    controller.getAgencyDetails(
                                                      context,
                                                      controller
                                                          .agencyList[indexRow]
                                                          .hashId,
                                                      homeController
                                                          .langCode.value,
                                                    );
                                                  },
                                                  child: Table(
                                                    defaultVerticalAlignment:
                                                        TableCellVerticalAlignment
                                                            .middle,
                                                    columnWidths: const {
                                                      0: FixedColumnWidth(200),
                                                    },
                                                    children: [
                                                      TableRow(children: [
                                                        TableCell(
                                                          child: Table(
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      margin: const EdgeInsets
                                                                          .all(
                                                                          12),
                                                                      child:
                                                                          Text(
                                                                        homeController.langCode.value == "kh"
                                                                            ? agencyData.country.khmerName ??
                                                                                ""
                                                                            : agencyData.country.englishName ??
                                                                                '',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontFamily: homeController.langCode.value == "kh"
                                                                                ? "Battambang"
                                                                                : "SourceSansPro-Regular",
                                                                            fontSize: homeController.langCode.value == "kh"
                                                                                ? 14
                                                                                : 16),
                                                                      ),
                                                                    ),
                                                                  ])
                                                            ],
                                                          ),
                                                        ),
                                                        TableCell(
                                                          child: Table(
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          bottom:
                                                                              10),
                                                                      child: AutoSizeText(
                                                                          agencyData.khmerName ??
                                                                              "",
                                                                          minFontSize:
                                                                              12,
                                                                          maxFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              2,
                                                                          style:
                                                                              const TextStyle(fontFamily: "Battambang")),
                                                                    ),
                                                                  ])
                                                            ],
                                                          ),
                                                        ),
                                                        TableCell(
                                                            child: Table(
                                                                children: [
                                                              TableRow(
                                                                  children: [
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          bottom:
                                                                              10),
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: AutoSizeText(
                                                                          agencyData.latinName ??
                                                                              '',
                                                                          minFontSize:
                                                                              14,
                                                                          maxFontSize:
                                                                              16,
                                                                          maxLines:
                                                                              2,
                                                                          style:
                                                                              const TextStyle(fontFamily: "SourceSansPro-Regular")),
                                                                    )
                                                                  ])
                                                            ])),
                                                        TableCell(
                                                            child: Table(
                                                                children: [
                                                              TableRow(
                                                                  children: [
                                                                    Container(
                                                                      margin: const EdgeInsets
                                                                          .all(
                                                                          12),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      constraints:
                                                                          const BoxConstraints(
                                                                        // maxWidth: 100,
                                                                        minWidth:
                                                                            50,
                                                                        minHeight:
                                                                            30,
                                                                      ),
                                                                      child:
                                                                          AutoSizeText(
                                                                        agencyData.nameAbbreviate ??
                                                                            "",
                                                                        minFontSize:
                                                                            14,
                                                                        maxLines:
                                                                            3,
                                                                        maxFontSize:
                                                                            16,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontFamily: homeController.langCode.value == "en"
                                                                                ? "SourceSansPro-Regular"
                                                                                : "Battambang"),
                                                                      ),
                                                                    )
                                                                  ])
                                                            ])),
                                                        const TableCell(
                                                          child: Icon(Icons
                                                              .arrow_forward),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                    },
                                  ))
                            ])
                      ]))));
    });
  }

  _buildAppbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back(result: true);
        },
        icon: const Icon(Icons.arrow_back),
      ),
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
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: PopupMenuWidget(),
        ),
      ],
    );
  }
}
