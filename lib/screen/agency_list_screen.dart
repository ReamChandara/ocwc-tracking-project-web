// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/config/responsive/main_resposive.dart';
import 'package:tracking_web/config/theme/app_theme.dart';
import 'package:tracking_web/controller/agency_controller.dart';
import 'package:tracking_web/widget/textfield_widget.dart';
import '../config/routes/app_route.dart';
import '../controller/home_controller.dart';
import '../widget/dialog_widget.dart';
import '../widget/popup_menu_widget.dart';

class AgencyListScreen extends GetView<AgencyController> {
  AgencyListScreen({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: MainResposive(
        large: Padding(
          padding: const EdgeInsets.all(16),
          child: buildNewTable(context),
        ),
        medium: Padding(
          padding: const EdgeInsets.all(16),
          child: buildNewTable(context),
        ),
        small: Padding(
            padding: const EdgeInsets.all(16), child: buildSmallTable(context)),
      ),
    );
  }

//  MainResposive(
//       large: Scaffold(
//         appBar: _buildAppbar(),
//         body: buildTable(),
//       ),
//       medium: Scaffold(
//         appBar: _buildAppbar(),
//         body: _buildMeduim(),
//       ),
//       small: Scaffold(
//         appBar: _buildAppbar(),
//         body: _buildSmallScreen(),
//       ),
//     );

  _customTableCell(String tile,
      {AlignmentGeometry? alignment = Alignment.center, TextStyle? style}) {
    return TableCell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: tableRowHeight,
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              tile,
              style: style ?? AppTextStyle.bold16(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  _customTableCellData(String data, {AlignmentGeometry? alignment}) {
    return TableCell(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 5),
        height: tableRowHeight,
        alignment: alignment ?? Alignment.centerLeft,
        child: Text(
          data,
          style: AppTextStyle.regular14(color: Colors.black),
        ),
      ),
    );
  }

  // _buildSmallScreen() {
  //   return LayoutBuilder(builder: (context, boxConstraints) {
  //     return SingleChildScrollView(
  //         child: Center(
  //             child: Padding(
  //                 padding: const EdgeInsets.all(16),
  //                 child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             // table headers
  //                             Container(
  //                               width: boxConstraints.maxWidth * 0.80,
  //                               decoration: BoxDecoration(
  //                                 color: Colors.grey[400],
  //                                 borderRadius: const BorderRadius.vertical(
  //                                     top: Radius.circular(15)),
  //                               ),
  //                               child: Table(
  //                                 columnWidths: const {
  //                                   0: FixedColumnWidth(120),
  //                                 },
  //                                 defaultVerticalAlignment:
  //                                     TableCellVerticalAlignment.middle,
  //                                 children: [
  //                                   TableRow(children: [
  //                                     _customTableCell(
  //                                       'country'.tr,
  //                                     ),
  //                                     _customTableCell(
  //                                       'agencykhmer'.tr,
  //                                       alignment: Alignment.centerLeft,
  //                                     ),
  //                                   ]),
  //                                 ],
  //                               ),
  //                             ),
  //                             // table data
  //                             Container(
  //                                 decoration: BoxDecoration(
  //                                   border:
  //                                       Border.all(color: Colors.grey[300]!),
  //                                   borderRadius: const BorderRadius.vertical(
  //                                     bottom: Radius.circular(15),
  //                                   ),
  //                                 ),
  //                                 height: Get.height * 0.90 - 100,
  //                                 width: boxConstraints.maxWidth * 0.80,
  //                                 child: Obx(
  //                                   () {
  //                                     return controller.loadingList.value
  //                                         ? const Center(
  //                                             child:
  //                                                 CircularProgressIndicator(),
  //                                           )
  //                                         : ListView.builder(
  //                                             itemCount:
  //                                                 controller.agencyList.length,
  //                                             itemBuilder: (context, indexRow) {
  //                                               var agencyData = controller
  //                                                   .agencyList[indexRow]
  //                                                   .agency;
  //                                               return InkWell(
  //                                                 hoverColor: Colors.grey[200],
  //                                                 onTap: () async {
  //                                                   DialogWidget.laodingDailog(
  //                                                     context,
  //                                                     homeController
  //                                                         .langCode.value,
  //                                                   );
  //                                                   controller.getAgencyDetails(
  //                                                     context,
  //                                                     controller
  //                                                         .agencyList[indexRow]
  //                                                         .hashId,
  //                                                     homeController
  //                                                         .langCode.value,
  //                                                   );
  //                                                 },
  //                                                 child: Table(
  //                                                   defaultVerticalAlignment:
  //                                                       TableCellVerticalAlignment
  //                                                           .middle,
  //                                                   columnWidths: const {
  //                                                     0: FixedColumnWidth(120),
  //                                                   },
  //                                                   children: [
  //                                                     TableRow(children: [
  //                                                       TableCell(
  //                                                         child: Table(
  //                                                           children: [
  //                                                             TableRow(
  //                                                                 children: [
  //                                                                   Container(
  //                                                                     alignment:
  //                                                                         Alignment
  //                                                                             .center,
  //                                                                     margin: const EdgeInsets
  //                                                                         .all(
  //                                                                         12),
  //                                                                     child:
  //                                                                         Text(
  //                                                                       homeController.langCode.value == "kh"
  //                                                                           ? agencyData.country.khmerName ??
  //                                                                               ""
  //                                                                           : agencyData.country.englishName ??
  //                                                                               '',
  //                                                                       textAlign:
  //                                                                           TextAlign.center,
  //                                                                       style: TextStyle(
  //                                                                           fontFamily: homeController.langCode.value == "kh"
  //                                                                               ? "Battambang"
  //                                                                               : "SourceSansPro-Regular",
  //                                                                           fontSize: homeController.langCode.value == "kh"
  //                                                                               ? 14
  //                                                                               : 16),
  //                                                                     ),
  //                                                                   ),
  //                                                                 ])
  //                                                           ],
  //                                                         ),
  //                                                       ),
  //                                                       TableCell(
  //                                                         child: Table(
  //                                                           children: [
  //                                                             TableRow(
  //                                                                 children: [
  //                                                                   Container(
  //                                                                     alignment:
  //                                                                         Alignment
  //                                                                             .centerLeft,
  //                                                                     margin: const EdgeInsets
  //                                                                         .only(
  //                                                                         top:
  //                                                                             10,
  //                                                                         right:
  //                                                                             10,
  //                                                                         bottom:
  //                                                                             10),
  //                                                                     child: AutoSizeText(
  //                                                                         agencyData.khmerName ??
  //                                                                             "",
  //                                                                         minFontSize:
  //                                                                             12,
  //                                                                         maxFontSize:
  //                                                                             14,
  //                                                                         maxLines:
  //                                                                             4,
  //                                                                         style:
  //                                                                             const TextStyle(fontFamily: "Battambang")),
  //                                                                   ),
  //                                                                 ])
  //                                                           ],
  //                                                         ),
  //                                                       ),
  //                                                       const TableCell(
  //                                                         child: Icon(Icons
  //                                                             .arrow_forward),
  //                                                       ),
  //                                                       // TableCell(
  //                                                       //     child: Table(
  //                                                       //         children: [
  //                                                       //       TableRow(
  //                                                       //           children: [
  //                                                       //             Container(
  //                                                       //               margin: const EdgeInsets
  //                                                       //                   .only(
  //                                                       //                   top:
  //                                                       //                       10,
  //                                                       //                   right:
  //                                                       //                       10,
  //                                                       //                   bottom:
  //                                                       //                       10),
  //                                                       //               alignment:
  //                                                       //                   Alignment
  //                                                       //                       .centerLeft,
  //                                                       //               child: AutoSizeText(
  //                                                       //                   agencyData.latinName ??
  //                                                       //                       '',
  //                                                       //                   minFontSize:
  //                                                       //                       14,
  //                                                       //                   maxFontSize:
  //                                                       //                       16,
  //                                                       //                   maxLines:
  //                                                       //                       2,
  //                                                       //                   style:
  //                                                       //                       const TextStyle(fontFamily: "SourceSansPro-Regular")),
  //                                                       //             )
  //                                                       //           ])
  //                                                       //     ])),
  //                                                       // TableCell(
  //                                                       //     child: Table(
  //                                                       //         children: [
  //                                                       //       TableRow(
  //                                                       //           children: [
  //                                                       //             Container(
  //                                                       //               margin: const EdgeInsets
  //                                                       //                   .all(
  //                                                       //                   12),
  //                                                       //               alignment:
  //                                                       //                   Alignment
  //                                                       //                       .center,
  //                                                       //               constraints:
  //                                                       //                   const BoxConstraints(
  //                                                       //                 // maxWidth: 100,
  //                                                       //                 minWidth:
  //                                                       //                     50,
  //                                                       //                 minHeight:
  //                                                       //                     30,
  //                                                       //               ),
  //                                                       //               child:
  //                                                       //                   AutoSizeText(
  //                                                       //                 agencyData.nameAbbreviate ??
  //                                                       //                     "",
  //                                                       //                 minFontSize:
  //                                                       //                     14,
  //                                                       //                 maxLines:
  //                                                       //                     3,
  //                                                       //                 maxFontSize:
  //                                                       //                     16,
  //                                                       //                 textAlign:
  //                                                       //                     TextAlign.center,
  //                                                       //                 style: TextStyle(
  //                                                       //                     fontFamily: homeController.langCode.value == "en"
  //                                                       //                         ? "SourceSansPro-Regular"
  //                                                       //                         : "Battambang"),
  //                                                       //               ),
  //                                                       //             )
  //                                                       //           ])
  //                                                       //     ]))
  //                                                     ]),
  //                                                   ],
  //                                                 ),
  //                                               );
  //                                             },
  //                                           );
  //                                   },
  //                                 ))
  //                           ])
  //                     ]))));
  //   });
  // }

  // _buildMeduim() {
  //   return LayoutBuilder(builder: (context, boxConstraints) {
  //     return SingleChildScrollView(
  //         child: Center(
  //             child: Padding(
  //                 padding: const EdgeInsets.all(16),
  //                 child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             // table headers
  //                             Container(
  //                               width: boxConstraints.maxWidth * 0.80,
  //                               decoration: BoxDecoration(
  //                                 color: AppColors.blur,
  //                                 borderRadius: const BorderRadius.vertical(
  //                                     top: Radius.circular(15)),
  //                               ),
  //                               child: Table(
  //                                 columnWidths: const {
  //                                   0: FixedColumnWidth(200),
  //                                 },
  //                                 defaultVerticalAlignment:
  //                                     TableCellVerticalAlignment.middle,
  //                                 children: [
  //                                   TableRow(children: [
  //                                     _customTableCell('country'.tr,
  //                                         height: 60),
  //                                     _customTableCell(
  //                                       'agencykhmer'.tr,
  //                                       alignment: Alignment.centerLeft,
  //                                       height: 60,
  //                                     ),
  //                                     _customTableCell('abreviate'.tr),
  //                                     const TableCell(child: SizedBox())
  //                                   ]),
  //                                 ],
  //                               ),
  //                             ),
  //                             // table data
  //                             Container(
  //                                 decoration: BoxDecoration(
  //                                   border:
  //                                       Border.all(color: Colors.grey[300]!),
  //                                   borderRadius: const BorderRadius.vertical(
  //                                     bottom: Radius.circular(15),
  //                                   ),
  //                                 ),
  //                                 height: Get.height * 0.90 - 100,
  //                                 width: boxConstraints.maxWidth * 0.80,
  //                                 child: Obx(
  //                                   () {
  //                                     return controller.loadingList.value
  //                                         ? const Center(
  //                                             child:
  //                                                 CircularProgressIndicator(),
  //                                           )
  //                                         : ListView.builder(
  //                                             itemCount:
  //                                                 controller.agencyList.length,
  //                                             itemBuilder: (context, indexRow) {
  //                                               var agencyData = controller
  //                                                   .agencyList[indexRow]
  //                                                   .agency;
  //                                               return InkWell(
  //                                                 hoverColor: Colors.grey[200],
  //                                                 onTap: () async {
  //                                                   DialogWidget.laodingDailog(
  //                                                     context,
  //                                                     homeController
  //                                                         .langCode.value,
  //                                                   );
  //                                                   controller.getAgencyDetails(
  //                                                     context,
  //                                                     controller
  //                                                         .agencyList[indexRow]
  //                                                         .hashId,
  //                                                     homeController
  //                                                         .langCode.value,
  //                                                   );
  //                                                 },
  //                                                 child: Table(
  //                                                   defaultVerticalAlignment:
  //                                                       TableCellVerticalAlignment
  //                                                           .middle,
  //                                                   columnWidths: const {
  //                                                     0: FixedColumnWidth(200),
  //                                                   },
  //                                                   children: [
  //                                                     TableRow(children: [
  //                                                       TableCell(
  //                                                         child: Table(
  //                                                           children: [
  //                                                             TableRow(
  //                                                                 children: [
  //                                                                   Container(
  //                                                                     alignment:
  //                                                                         Alignment
  //                                                                             .center,
  //                                                                     margin: const EdgeInsets
  //                                                                         .all(
  //                                                                         12),
  //                                                                     child:
  //                                                                         Text(
  //                                                                       homeController.langCode.value == "kh"
  //                                                                           ? agencyData.country.khmerName ??
  //                                                                               ""
  //                                                                           : agencyData.country.englishName ??
  //                                                                               '',
  //                                                                       textAlign:
  //                                                                           TextAlign.center,
  //                                                                       style: TextStyle(
  //                                                                           fontFamily: homeController.langCode.value == "kh"
  //                                                                               ? "Battambang"
  //                                                                               : "SourceSansPro-Regular",
  //                                                                           fontSize: homeController.langCode.value == "kh"
  //                                                                               ? 14
  //                                                                               : 16),
  //                                                                     ),
  //                                                                   ),
  //                                                                 ])
  //                                                           ],
  //                                                         ),
  //                                                       ),
  //                                                       TableCell(
  //                                                         child: Table(
  //                                                           children: [
  //                                                             TableRow(
  //                                                                 children: [
  //                                                                   Container(
  //                                                                     alignment:
  //                                                                         Alignment
  //                                                                             .centerLeft,
  //                                                                     margin: const EdgeInsets
  //                                                                         .only(
  //                                                                         top:
  //                                                                             10,
  //                                                                         right:
  //                                                                             10,
  //                                                                         bottom:
  //                                                                             10),
  //                                                                     child: AutoSizeText(
  //                                                                         agencyData.khmerName ??
  //                                                                             "",
  //                                                                         minFontSize:
  //                                                                             12,
  //                                                                         maxFontSize:
  //                                                                             14,
  //                                                                         maxLines:
  //                                                                             2,
  //                                                                         style:
  //                                                                             const TextStyle(fontFamily: "Battambang")),
  //                                                                   ),
  //                                                                 ])
  //                                                           ],
  //                                                         ),
  //                                                       ),
  //                                                       TableCell(
  //                                                           child: Table(
  //                                                               children: [
  //                                                             TableRow(
  //                                                                 children: [
  //                                                                   Container(
  //                                                                     margin: const EdgeInsets
  //                                                                         .all(
  //                                                                         12),
  //                                                                     alignment:
  //                                                                         Alignment
  //                                                                             .center,
  //                                                                     constraints:
  //                                                                         const BoxConstraints(
  //                                                                       // maxWidth: 100,
  //                                                                       minWidth:
  //                                                                           50,
  //                                                                       minHeight:
  //                                                                           30,
  //                                                                     ),
  //                                                                     child:
  //                                                                         AutoSizeText(
  //                                                                       agencyData.nameAbbreviate ??
  //                                                                           "",
  //                                                                       minFontSize:
  //                                                                           14,
  //                                                                       maxLines:
  //                                                                           3,
  //                                                                       maxFontSize:
  //                                                                           16,
  //                                                                       textAlign:
  //                                                                           TextAlign.center,
  //                                                                       style: TextStyle(
  //                                                                           fontFamily: homeController.langCode.value == "en"
  //                                                                               ? "SourceSansPro-Regular"
  //                                                                               : "Battambang"),
  //                                                                     ),
  //                                                                   )
  //                                                                 ])
  //                                                           ])),
  //                                                       const TableCell(
  //                                                         child: Icon(Icons
  //                                                             .arrow_forward),
  //                                                       ),
  //                                                     ]),
  //                                                   ],
  //                                                 ),
  //                                               );
  //                                             },
  //                                           );
  //                                   },
  //                                 ))
  //                           ])
  //                     ]))));
  //   });
  // }

  final tableRowHeight = 55.0;
  final tableMaxHeight = 330.0;

  final Map<int, TableColumnWidth>? columnWidths = {
    0: const FixedColumnWidth(120),
    1: const FixedColumnWidth(350),
    2: const FixedColumnWidth(350),
    3: const FixedColumnWidth(350),
  };
  final Map<int, TableColumnWidth>? fixColumnWidths = {
    0: const FixedColumnWidth(120),
    1: const FixedColumnWidth(250),
    2: const FixedColumnWidth(350),
    3: const FixedColumnWidth(250),
  };

  buildSmallTable(BuildContext context) {
    return ListView(
      children: [
        Scrollbar(
          thumbVisibility: true,
          controller: controller.scrollController,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //header
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.blur,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                  ),
                  child: Table(
                    columnWidths: fixColumnWidths,
                    children: [
                      TableRow(children: [
                        _customTableCell('country'.tr),
                        _customTableCell('agencykhmer'.tr,
                            alignment: Alignment.centerLeft),
                        _customTableCell('agentcylatin'.tr,
                            alignment: Alignment.centerLeft),
                        _customTableCell('abreviate'.tr),
                        _customTableCell("sendingcountry".tr),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  child: Obx(
                    () {
                      return controller.loadingList.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                              children: List.generate(
                                  controller.agencyList.length, (index) {
                                var agencyData = controller.agencyList[index];
                                return InkWell(
                                  hoverColor: Colors.grey[200],
                                  onTap: () {
                                    DialogWidget.laodingDailog(
                                      context,
                                      homeController.langCode.value,
                                    );
                                    controller.getAgencyDetails(
                                      context,
                                      controller.agencyList[index].hashId,
                                      homeController.langCode.value,
                                    );
                                  },
                                  child: Table(
                                    border: TableBorder.all(
                                      color: Colors.grey[300]!,
                                      width: 0.8,
                                    ),
                                    columnWidths: columnWidths,
                                    children: [
                                      TableRow(children: [
                                        _customTableCellData(
                                          homeController.langCode.value == "kh"
                                              ? agencyData.agency.country
                                                      .khmerName ??
                                                  ""
                                              : agencyData.agency.country
                                                      .englishName ??
                                                  "",
                                        ),
                                        _customTableCellData(
                                          agencyData.agency.khmerName ?? "",
                                        ),
                                        _customTableCellData(
                                          agencyData.agency.latinName ?? "",
                                        ),
                                        _customTableCellData(
                                          alignment: Alignment.center,
                                          agencyData.agency.nameAbbreviate ??
                                              "",
                                        ),
                                        TableCell(
                                          child: Container(
                                              height: tableRowHeight,
                                              alignment: Alignment.center,
                                              child: agencyData.agency
                                                      .sendingCountry.isEmpty
                                                  ? const SizedBox()
                                                  : SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: List.generate(
                                                            agencyData
                                                                .agency
                                                                .sendingCountry
                                                                .length,
                                                            (index) => Text(
                                                                homeController
                                                                            .langCode
                                                                            .value ==
                                                                        "en"
                                                                    ? "${agencyData.agency.sendingCountry[index].enName} ${index < agencyData.agency.sendingCountry.length - 1 ? ',' : ''}"
                                                                    : "${agencyData.agency.sendingCountry[index].khmerName} ${index < agencyData.agency.sendingCountry.length - 1 ? ',' : ''} ",
                                                                style: AppTextStyle.regular16(
                                                                    color: Colors
                                                                        .black))).withSpaceBetween(
                                                            width: 5),
                                                      ),
                                                    )),
                                        ),
                                      ]),
                                    ],
                                  ),
                                );
                              }),
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  buildNewTable(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.shade400, blurRadius: 3),
            ],
          ),
          child: SizedBox(
            child: TextFieldWidget(
              hintText: "បញ្ចូនឈ្មោះទីភ្នាក់ងារជ្រើសរើសឯកជន",
              hintStyle: AppTextStyle.regular14(),
              suffixIcon: const Icon(Icons.search),
              onFieldSubmitted: (value) {
                controller.getListAgency(name: value);
              },
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //header
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.blur,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    child: Table(
                      columnWidths: columnWidths,
                      children: [
                        TableRow(children: [
                          _customTableCell('country'.tr),
                          _customTableCell('agencykhmer'.tr,
                              alignment: Alignment.centerLeft),
                          _customTableCell('agentcylatin'.tr,
                              alignment: Alignment.centerLeft),
                          _customTableCell('abreviate'.tr),
                          _customTableCell("sendingcountry".tr),
                        ]),
                      ],
                    ),
                  ),
                  //data
                  SizedBox(
                    child: Obx(
                      () {
                        return controller.loadingList.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
                                children: List.generate(
                                    controller.agencyList.length, (index) {
                                  var agencyData = controller.agencyList[index];
                                  return InkWell(
                                    hoverColor: Colors.grey[200],
                                    onTap: () {
                                      DialogWidget.laodingDailog(
                                        context,
                                        homeController.langCode.value,
                                      );
                                      controller.getAgencyDetails(
                                        context,
                                        controller.agencyList[index].hashId,
                                        homeController.langCode.value,
                                      );
                                    },
                                    child: Table(
                                      border: TableBorder.all(
                                        color: Colors.grey[300]!,
                                        width: 0.8,
                                      ),
                                      columnWidths: columnWidths,
                                      children: [
                                        TableRow(children: [
                                          _customTableCellData(
                                            homeController.langCode.value ==
                                                    "kh"
                                                ? agencyData.agency.country
                                                        .khmerName ??
                                                    ""
                                                : agencyData.agency.country
                                                        .englishName ??
                                                    "",
                                          ),
                                          _customTableCellData(
                                            agencyData.agency.khmerName ?? "",
                                          ),
                                          _customTableCellData(
                                            agencyData.agency.latinName ?? "",
                                          ),
                                          _customTableCellData(
                                            alignment: Alignment.center,
                                            agencyData.agency.nameAbbreviate ??
                                                "",
                                          ),
                                          // TableCell(
                                          //   child: Container(
                                          //     height: tableRowHeight,
                                          //     alignment: Alignment.center,
                                          //     child: Text(
                                          //       Get.locale == const Locale('en', 'US')
                                          //           ? agencyData
                                          //               .agency.country.englishName
                                          //           : agencyData
                                          //               .agency.country.khmerName,
                                          //       style: AppTextStyle.regular16(
                                          //           color: Colors.black),
                                          //     ),
                                          //   ),
                                          // ),
                                          // TableCell(
                                          //   child: Container(
                                          //     height: tableRowHeight,
                                          //     alignment: Alignment.center,
                                          //     child: Text(
                                          //       agencyData.agency.khmerName,
                                          //       style: AppTextStyle.regular16(
                                          //           color: Colors.black),
                                          //     ),
                                          //   ),
                                          // ),
                                          // TableCell(
                                          //   child: Container(
                                          //     height: tableRowHeight,
                                          //     alignment: Alignment.center,
                                          //     child: Text(
                                          //       agencyData.agency.latinName,
                                          //       style: AppTextStyle.regular16(
                                          //           color: Colors.black),
                                          //     ),
                                          //   ),
                                          // ),
                                          // TableCell(
                                          //   child: Container(
                                          //     height: tableRowHeight,
                                          //     alignment: Alignment.center,
                                          //     child: Text(
                                          //       agencyData.agency.nameAbbreviate,
                                          //       style: AppTextStyle.regular16(
                                          //           color: Colors.black),
                                          //     ),
                                          //   ),
                                          // ),
                                          TableCell(
                                            child: Container(
                                                height: tableRowHeight,
                                                alignment: Alignment.center,
                                                child:
                                                    agencyData
                                                            .agency
                                                            .sendingCountry
                                                            .isEmpty
                                                        ? const SizedBox()
                                                        : SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: List.generate(
                                                                  agencyData
                                                                      .agency
                                                                      .sendingCountry
                                                                      .length,
                                                                  (index) => Text(
                                                                      homeController.langCode.value ==
                                                                              "en"
                                                                          ? "${agencyData.agency.sendingCountry[index].enName} ${index < agencyData.agency.sendingCountry.length - 1 ? ',' : ''}"
                                                                          : "${agencyData.agency.sendingCountry[index].khmerName} ${index < agencyData.agency.sendingCountry.length - 1 ? ',' : ''} ",
                                                                      style: AppTextStyle.regular16(
                                                                          color:
                                                                              Colors.black))).withSpaceBetween(
                                                                  width: 5),
                                                            ),
                                                          )),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  );
                                }),
                              );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                          ),
                          Text(
                            "Back",
                            style: AppTextStyle.regular16(),
                          ),
                        ].withSpaceBetween(width: 10),
                      ),
                    ),
                    Obx(() {
                      return controller.loadingList.value
                          ? const SizedBox()
                          : Row(
                              children: List.generate(
                                controller.meta.value?.lastPage ?? 0,
                                // controller.meta.value?.lastPage ?? 0,
                                (index) => InkWell(
                                  onTap: () async {
                                    await controller.getListAgency(
                                      page: (index + 1).toString(),
                                    );
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: (index + 1) ==
                                              controller.meta.value!.currentPage
                                          ? Colors.grey
                                          : null,
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                      ),
                                    ),
                                    child: Text((index + 1).toString()),
                                  ),
                                ),
                              ).withSpaceBetween(width: 10),
                            );
                    }),
                    Obx(
                      () => controller.loadingList.value
                          ? const SizedBox()
                          : controller.meta.value?.currentPage ==
                                  controller.meta.value?.lastPage
                              ? const SizedBox()
                              : InkWell(
                                  onTap: () async {
                                    await controller.getListAgency(
                                        page: ((controller.meta.value
                                                        ?.currentPage ??
                                                    0) +
                                                1)
                                            .toString());
                                    controller.currentTotalPage();
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Next",
                                          style: AppTextStyle.regular16(),
                                        ),
                                        const Icon(
                                          Icons.chevron_right,
                                        ),
                                      ].withSpaceBetween(width: 10),
                                    ),
                                  ),
                                ),
                    ),
                    Obx(
                      () => controller.loadingList.value
                          ? const SizedBox()
                          : controller.meta.value?.currentPage ==
                                  controller.meta.value?.lastPage
                              ? const SizedBox()
                              : InkWell(
                                  onTap: () async {
                                    await controller.getListAgency(
                                        page:
                                            (controller.meta.value?.lastPage ??
                                                    0)
                                                .toString());
                                    controller.loadPageTolast();
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Last",
                                          style: AppTextStyle.regular16(),
                                        ),
                                        const Icon(
                                          Icons.chevron_right,
                                        ),
                                      ].withSpaceBetween(width: 10),
                                    ),
                                  ),
                                ),
                    )
                  ].withSpaceBetween(width: 10),
                ),
              ),
              Obx(() {
                return controller.loadingList.value
                    ? const SizedBox()
                    : Text(
                        "ចាប់ផ្តើម  ${controller.meta.value?.from ?? ""} - ដល់ ${controller.meta.value?.to ?? ""} / សរុប ${controller.meta.value?.total ?? ""}",
                        style: AppTextStyle.bold16(fontFamily: "Battambang"),
                      );
              }),
            ].withSpaceBetween(height: 10),
          ),
        ),
      ].withSpaceBetween(height: 10),
    );
  }

  Widget buildTable() {
    return ListView(
      children: [
        // title header
        Container(
          decoration: BoxDecoration(
            color: AppColors.blur,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: Table(
            columnWidths: const {},
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                // _customTableCell('country'.tr),
                _customTableCell('agencykhmer'.tr,
                    alignment: Alignment.centerLeft),
                _customTableCell('agentcylatin'.tr,
                    alignment: Alignment.centerLeft),
                _customTableCell('abreviate'.tr),
                _customTableCell("sendingcountry".tr),
              ]),
            ],
          ),
        ),
        // data table
        SizedBox(
          child: Obx(
            () {
              return controller.loadingList.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      constraints: BoxConstraints(maxHeight: tableMaxHeight),
                      child: Container(
                        constraints: BoxConstraints(maxHeight: tableMaxHeight),
                        child: ListView.builder(
                          itemCount: controller.agencyList.length,
                          itemBuilder: (context, index) {
                            var agencyData = controller.agencyList[index];
                            return InkWell(
                              hoverColor: Colors.grey[200],
                              onTap: () {
                                DialogWidget.laodingDailog(
                                  context,
                                  homeController.langCode.value,
                                );
                                controller.getAgencyDetails(
                                  context,
                                  controller.agencyList[index].hashId,
                                  homeController.langCode.value,
                                );
                              },
                              child: Table(
                                border: TableBorder.all(
                                  color: Colors.grey[300]!,
                                  width: 0.8,
                                ),
                                columnWidths: const {},
                                children: [
                                  TableRow(children: [
                                    // _customTableCellData(
                                    //   alignment: Alignment.center,
                                    //   Get.locale == const Locale('en', 'US')
                                    //       ? agencyData
                                    //           .agency.country.englishName
                                    //       : agencyData.agency.country.khmerName,
                                    // ),
                                    _customTableCellData(
                                      agencyData.agency.khmerName,
                                    ),
                                    _customTableCellData(
                                      agencyData.agency.latinName,
                                    ),
                                    _customTableCellData(
                                      alignment: Alignment.center,
                                      agencyData.agency.nameAbbreviate,
                                    ),
                                    // TableCell(
                                    //   child: Container(
                                    //     height: tableRowHeight,
                                    //     alignment: Alignment.center,
                                    //     child: Text(
                                    //       Get.locale == const Locale('en', 'US')
                                    //           ? agencyData
                                    //               .agency.country.englishName
                                    //           : agencyData
                                    //               .agency.country.khmerName,
                                    //       style: AppTextStyle.regular16(
                                    //           color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    // TableCell(
                                    //   child: Container(
                                    //     height: tableRowHeight,
                                    //     alignment: Alignment.center,
                                    //     child: Text(
                                    //       agencyData.agency.khmerName,
                                    //       style: AppTextStyle.regular16(
                                    //           color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    // TableCell(
                                    //   child: Container(
                                    //     height: tableRowHeight,
                                    //     alignment: Alignment.center,
                                    //     child: Text(
                                    //       agencyData.agency.latinName,
                                    //       style: AppTextStyle.regular16(
                                    //           color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    // TableCell(
                                    //   child: Container(
                                    //     height: tableRowHeight,
                                    //     alignment: Alignment.center,
                                    //     child: Text(
                                    //       agencyData.agency.nameAbbreviate,
                                    //       style: AppTextStyle.regular16(
                                    //           color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    TableCell(
                                      child: Container(
                                          height: tableRowHeight,
                                          alignment: Alignment.center,
                                          child: agencyData
                                                  .agency.sendingCountry.isEmpty
                                              ? const SizedBox()
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: List.generate(
                                                    agencyData.agency
                                                        .sendingCountry.length,
                                                    (index) => Row(children: [
                                                      Text(
                                                          homeController
                                                                      .langCode
                                                                      .value ==
                                                                  "en"
                                                              ? "${agencyData.agency.sendingCountry[index].enName} ${index < agencyData.agency.sendingCountry.length - 1 ? ',' : ''}"
                                                              : "${agencyData.agency.sendingCountry[index].khmerName} ${index < agencyData.agency.sendingCountry.length - 1 ? ',' : ''} ",
                                                          style: AppTextStyle
                                                              .regular16(
                                                                  color: Colors
                                                                      .black))
                                                    ]),
                                                  ).withSpaceBetween(width: 5),
                                                )),
                                    ),
                                  ]),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  Widget buildMediumTable() {
    return ListView(
      children: [
        // title header
        Container(
          decoration: BoxDecoration(
            color: AppColors.blur,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          ),
          child: Table(
            columnWidths: const {
              0: FixedColumnWidth(100),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                _customTableCell('country'.tr, style: AppTextStyle.bold14()),
                _customTableCell('agencykhmer'.tr,
                    style: AppTextStyle.bold14(),
                    alignment: Alignment.centerLeft),
                _customTableCell('agentcylatin'.tr,
                    style: AppTextStyle.bold14(),
                    alignment: Alignment.centerLeft),
                // _customTableCell('abreviate'.tr, style: AppTextStyle.bold14()),
                // _customTableCell("sendingcountry".tr),
              ]),
            ],
          ),
        ),
        // data table
        SizedBox(
          height: 350,
          child: Obx(
            () {
              return controller.loadingList.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      constraints: BoxConstraints(maxHeight: tableMaxHeight),
                      child: Container(
                        constraints: BoxConstraints(maxHeight: tableMaxHeight),
                        child: ListView.builder(
                          itemCount: controller.agencyList.length,
                          itemBuilder: (context, index) {
                            var agencyData = controller.agencyList[index];
                            return InkWell(
                              hoverColor: Colors.grey[200],
                              onTap: () {
                                DialogWidget.laodingDailog(
                                  context,
                                  homeController.langCode.value,
                                );
                                controller.getAgencyDetails(
                                  context,
                                  controller.agencyList[index].hashId,
                                  homeController.langCode.value,
                                );
                              },
                              child: Table(
                                border: TableBorder.all(
                                  color: Colors.grey[300]!,
                                  width: 0.8,
                                ),
                                columnWidths: const {
                                  0: FixedColumnWidth(100),
                                },
                                children: [
                                  TableRow(children: [
                                    _customTableCellData(Get.locale ==
                                            const Locale('en', 'US')
                                        ? agencyData.agency.country.englishName
                                        : agencyData.agency.country.khmerName),
                                    // TableCell(
                                    //   child: Container(
                                    //     height: tableRowHeight,
                                    //     alignment: Alignment.center,
                                    //     child: Text(
                                    //       Get.locale == const Locale('en', 'US')
                                    //           ? agencyData
                                    //               .agency.country.englishName
                                    //           : agencyData
                                    //               .agency.country.khmerName,
                                    //       style: AppTextStyle.regular16(
                                    //           color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    _customTableCellData(
                                      agencyData.agency.khmerName,
                                    ),
                                    _customTableCellData(
                                      agencyData.agency.latinName,
                                    ),
                                    // _customTableCellData(
                                    //   agencyData.agency.nameAbbreviate,
                                    // ),
                                    // TableCell(
                                    //   child: Container(
                                    //     height: tableRowHeight,
                                    //     alignment: Alignment.center,
                                    //     child: Text(
                                    //       agencyData.agency.khmerName,
                                    //       style: AppTextStyle.regular16(
                                    //           color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    // TableCell(
                                    //   child: Container(
                                    //     height: tableRowHeight,
                                    //     alignment: Alignment.center,
                                    //     child: Text(
                                    //       agencyData.agency.latinName,
                                    //       style: AppTextStyle.regular16(
                                    //           color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    // TableCell(
                                    //   child: Container(
                                    //     height: tableRowHeight,
                                    //     alignment: Alignment.center,
                                    //     child: Text(
                                    //       agencyData.agency.nameAbbreviate,
                                    //       style: AppTextStyle.regular16(
                                    //           color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    // TableCell(
                                    //   child: Container(
                                    //       height: tableRowHeight,
                                    //       alignment: Alignment.center,
                                    //       child: agencyData
                                    //               .agency.sendingCountry.isEmpty
                                    //           ? const SizedBox()
                                    //           : Row(
                                    //               mainAxisAlignment:
                                    //                   MainAxisAlignment.center,
                                    //               children: List.generate(
                                    //                 agencyData.agency
                                    //                     .sendingCountry.length,
                                    //                 (index) => Text(
                                    //                   "${agencyData.agency.sendingCountry[index].khmerName},",
                                    //                   style: AppTextStyle
                                    //                       .regular16(
                                    //                           color:
                                    //                               Colors.black),
                                    //                 ),
                                    //               ).withSpaceBetween(width: 5),
                                    //             )),
                                    // ),
                                  ]),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }
  // _buildLargeScreen() {
  //   return LayoutBuilder(builder: (context, boxConstraints) {
  //     return SingleChildScrollView(
  //       child: Center(
  //         child: Padding(
  //           padding: const EdgeInsets.all(16),
  //           child: buildTable(),
  //         ),
  //       ),
  //     );
  //   });
  // }

//  Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   // table headers
//                   Container(
//                     width: boxConstraints.maxWidth * 0.80,
//                     decoration: BoxDecoration(
//                       color: AppColors.blur,
//                       borderRadius:
//                           const BorderRadius.vertical(top: Radius.circular(15)),
//                     ),
//                     child: Table(
//                       columnWidths: const {
//                         0: FixedColumnWidth(200),
//                       },
//                       defaultVerticalAlignment:
//                           TableCellVerticalAlignment.middle,
//                       children: [
//                         TableRow(children: [
//                           _customTableCell('country'.tr),
//                           _customTableCell(
//                             'agencykhmer'.tr,
//                             alignment: Alignment.centerLeft,
//                           ),
//                           _customTableCell(
//                             'agentcylatin'.tr,
//                             alignment: Alignment.centerLeft,
//                           ),
//                           _customTableCell('abreviate'.tr),
//                           const TableCell(child: SizedBox())
//                         ]),
//                       ],
//                     ),
//                   ),
//                   // table data
//                   Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey[300]!),
//                         borderRadius: const BorderRadius.vertical(
//                           bottom: Radius.circular(15),
//                         ),
//                       ),
//                       height: Get.height * 0.90 - 100,
//                       width: boxConstraints.maxWidth * 0.80,
//                       child: Obx(
//                         () {
//                           return controller.loadingList.value
//                               ? const Center(
//                                   child: CircularProgressIndicator(),
//                                 )
//                               : ListView.builder(
//                                   itemCount: controller.agencyList.length,
//                                   itemBuilder: (context, indexRow) {
//                                     var agencyData =
//                                         controller.agencyList[indexRow].agency;
//                                     return InkWell(
//                                       hoverColor: Colors.grey[200],
//                                       onTap: () async {
//                                         DialogWidget.laodingDailog(
//                                           context,
//                                           homeController.langCode.value,
//                                         );
//                                         controller.getAgencyDetails(
//                                           context,
//                                           controller
//                                               .agencyList[indexRow].hashId,
//                                           homeController.langCode.value,
//                                         );
//                                       },
//                                       child: Table(
//                                         defaultVerticalAlignment:
//                                             TableCellVerticalAlignment.middle,
//                                         columnWidths: const {
//                                           0: FixedColumnWidth(200),
//                                         },
//                                         children: [
//                                           TableRow(children: [
//                                             TableCell(
//                                               child: Table(
//                                                 children: [
//                                                   TableRow(children: [
//                                                     Container(
//                                                       alignment:
//                                                           Alignment.center,
//                                                       margin:
//                                                           const EdgeInsets.all(
//                                                               12),
//                                                       child: Text(
//                                                         homeController.langCode
//                                                                     .value ==
//                                                                 "kh"
//                                                             ? agencyData.country
//                                                                     .khmerName ??
//                                                                 ""
//                                                             : agencyData.country
//                                                                     .englishName ??
//                                                                 '',
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                         style: TextStyle(
//                                                             fontFamily: homeController
//                                                                         .langCode
//                                                                         .value ==
//                                                                     "kh"
//                                                                 ? "Battambang"
//                                                                 : "SourceSansPro-Regular",
//                                                             fontSize: homeController
//                                                                         .langCode
//                                                                         .value ==
//                                                                     "kh"
//                                                                 ? 14
//                                                                 : 16),
//                                                       ),
//                                                     ),
//                                                   ])
//                                                 ],
//                                               ),
//                                             ),
//                                             TableCell(
//                                               child: Table(
//                                                 children: [
//                                                   TableRow(children: [
//                                                     Container(
//                                                       alignment:
//                                                           Alignment.centerLeft,
//                                                       margin:
//                                                           const EdgeInsets.only(
//                                                               top: 10,
//                                                               right: 10,
//                                                               bottom: 10),
//                                                       child: AutoSizeText(
//                                                           agencyData
//                                                                   .khmerName ??
//                                                               "",
//                                                           minFontSize: 12,
//                                                           maxFontSize: 14,
//                                                           maxLines: 2,
//                                                           style: const TextStyle(
//                                                               fontFamily:
//                                                                   "Battambang")),
//                                                     ),
//                                                   ])
//                                                 ],
//                                               ),
//                                             ),
//                                             TableCell(
//                                                 child: Table(children: [
//                                               TableRow(children: [
//                                                 Container(
//                                                   margin: const EdgeInsets.only(
//                                                       top: 10,
//                                                       right: 10,
//                                                       bottom: 10),
//                                                   alignment:
//                                                       Alignment.centerLeft,
//                                                   child: AutoSizeText(
//                                                       agencyData.latinName ??
//                                                           '',
//                                                       minFontSize: 14,
//                                                       maxFontSize: 16,
//                                                       maxLines: 2,
//                                                       style: const TextStyle(
//                                                           fontFamily:
//                                                               "SourceSansPro-Regular")),
//                                                 )
//                                               ])
//                                             ])),
//                                             TableCell(
//                                                 child: Table(children: [
//                                               TableRow(children: [
//                                                 Container(
//                                                   margin:
//                                                       const EdgeInsets.all(12),
//                                                   alignment: Alignment.center,
//                                                   constraints:
//                                                       const BoxConstraints(
//                                                     // maxWidth: 100,
//                                                     minWidth: 50,
//                                                     minHeight: 30,
//                                                   ),
//                                                   child: AutoSizeText(
//                                                     agencyData.nameAbbreviate ??
//                                                         "",
//                                                     minFontSize: 14,
//                                                     maxLines: 3,
//                                                     maxFontSize: 16,
//                                                     textAlign: TextAlign.center,
//                                                     style: TextStyle(
//                                                         fontFamily: homeController
//                                                                     .langCode
//                                                                     .value ==
//                                                                 "en"
//                                                             ? "SourceSansPro-Regular"
//                                                             : "Battambang"),
//                                                   ),
//                                                 )
//                                               ])
//                                             ])),
//                                             const TableCell(
//                                               child: Icon(Icons.arrow_forward),
//                                             ),
//                                           ]),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 );
//                         },
//                       ))
//                 ])
//               ],
//             ),

  _buildAppbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          // Get.back();
          RouteView.findagency.go(
            backRoutes: RouteView.findagency.name,
          );
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
