import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/config/responsive/main_resposive.dart';
import 'package:tracking_web/config/theme/app_theme.dart';
import 'package:tracking_web/widget/appbar_widget.dart';
import 'package:tracking_web/widget/pagination_widget.dart';

import '../../config/routes/app_route.dart';
import '../../controller/home_controller.dart';
import '../../controller/recruiter/recruiter_controller.dart';
import '../../widget/dropdown_widget.dart';
import '../../widget/textfield_widget.dart';

class Data {
  final String idCard;
  final String name;
  final String gender;
  final String birthdate;

  Data(
      {required this.idCard,
      required this.name,
      required this.gender,
      required this.birthdate});
}

class RecruiterList extends StatelessWidget {
  RecruiterList({super.key});
  final HomeController homeController = Get.put(HomeController());
  final controller = Get.put(RecruiterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(
            title: "agencytitle".tr,
            onPressed: () {
              RouteView.recruiterList.go(
                backRoutes: RouteView.findRecruiter.name,
              );
            }),
        body: MainResposive(
          large: Padding(
            padding: const EdgeInsets.all(16),
            child: buildTable(context),
          ),
        ));
  }

  final tableRowHeight = 55.0;
  final tableMaxHeight = 330.0;

  final Map<int, TableColumnWidth>? columnWidths = {
    // 0: const FixedColumnWidth(120),
    // 1: const FixedColumnWidth(350),
    // 2: const FixedColumnWidth(120),
    3: const FixedColumnWidth(120),
  };
  final Map<int, TableColumnWidth>? fixColumnWidths = {
    // 0: const FixedColumnWidth(120),
    // 1: const FixedColumnWidth(250),
    // 2: const FixedColumnWidth(120),
    3: const FixedColumnWidth(120),
  };

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

// ML-00000087
// ចៅ​​​ វាសនា
// ស្រី
// 14-10-1990
  final listData = <Data>[
    Data(
        idCard: "ML-00000087",
        name: "ចៅ​​​ វាសនា",
        gender: "ស្រី",
        birthdate: "14-10-1990"),
  ];

  // void submit(BuildContext context, {required String hasid}) async {
  //   DialogWidget.laodingDailog(context, homeController.langCode.value);
  //   await controller.getRecruiterDetail(hasid).whenComplete(() {
  //     Get.back();
  //     RouteView.recruiterDetail.go();
  //   });
  // }

  // _buildHtmlView(String htmlraw) {
  //   return HtmlWidget(htmlraw);
  // }

  // dialogDetailRecruiter(
  //     {required BuildContext context, required String langCode}) {
  //   Alert(
  //       style: AlertStyle(
  //         titleStyle: TextStyle(
  //           fontFamily:
  //               langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
  //         ),
  //         descStyle: TextStyle(
  //           fontFamily:
  //               langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
  //         ),
  //         descPadding: const EdgeInsets.only(top: 10, right: 10, left: 10),
  //         animationType: AnimationType.grow,
  //         overlayColor: Colors.grey.shade100.withOpacity(0.9),
  //       ),
  //       image: Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: Obx(() => controller.loadingDetial.value
  //             ? const CircularProgressIndicator()
  //             : Expanded(
  //                 child: _buildHtmlView(
  //                   controller.htmlRaw.value,
  //                 ),
  //               )),
  //       ),
  //       context: context,
  //       buttons: [
  //         DialogButton(
  //             color: const Color.fromARGB(255, 71, 122, 211),
  //             child: Text(
  //               "close".tr,
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.w500,
  //                 fontFamily:
  //                     langCode == "en" ? "SourceSansPro-Regular" : "Battambang",
  //               ),
  //             ),
  //             onPressed: () {
  //               Get.back();
  //             })
  //       ]).show();
  // }

  buildTable(BuildContext context) {
    return Column(
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
              autoFocus: true,
              hintText: "searchagency".tr,
              hintStyle: AppTextStyle.regular14(),
              suffixIcon: const Icon(Icons.search),
              onFieldSubmitted: (value) {
                controller.getRecruiterByPage(
                  homeController.langCode.value,
                  name: value,
                );
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
                          _customTableCell('លេខអត្តសញ្ញាណកាងារ'.tr),
                          _customTableCell('ឈ្មោះភ្នាក់ងារជាអក្សរខ្មែរ'.tr,
                              alignment: Alignment.centerLeft),
                          _customTableCell('ឈ្មោះភ្នាក់ងារជាឡាតាំង'.tr,
                              alignment: Alignment.centerLeft),
                          _customTableCell('ភេទ'.tr,
                              alignment: Alignment.centerLeft),
                          _customTableCell('ទីកន្លែងកំណើត'.tr),
                        ]),
                      ],
                    ),
                  ),
                  // data
                  Obx(() {
                    return controller.loading.value
                        ? Container(
                            padding: const EdgeInsets.all(10),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : controller.listRecruiter.isEmpty
                            ? Container(
                                padding: const EdgeInsets.only(top: 80),
                                alignment: Alignment.center,
                                child: Text(
                                  "មិនមានទិន្នន័យ",
                                  style: AppTextStyle.regular16(),
                                ),
                              )
                            : Column(
                                children: List.generate(
                                    controller.listRecruiter.length, (index) {
                                  var recruiter =
                                      controller.listRecruiter[index];
                                  return InkWell(
                                    hoverColor: Colors.grey[200],
                                    onTap: () {
                                      RouteView.recruiterDetail.go(parameters: {
                                        "hash_id": recruiter.hashId
                                      });
                                      // controller.getRecruiterDetail(
                                      //   recruiter.hashId,
                                      // );
                                      // submit(context, hasid: recruiter.hashId);
                                      // DialogWidget.laodingDailog(
                                      //   context,
                                      //   homeController.langCode.value,
                                      // );
                                      // controller.getAgencyDetails(
                                      //   context,
                                      //   controller.agencyList[index].hashId,
                                      //   homeController.langCode.value,
                                      // );
                                    },
                                    child: Table(
                                      border: TableBorder.all(
                                        color: Colors.grey[300]!,
                                        width: 0.8,
                                      ),
                                      columnWidths: columnWidths,
                                      children: [
                                        TableRow(children: [
                                          _customTableCellData(recruiter.code),
                                          _customTableCellData(
                                              recruiter.khmerName),
                                          _customTableCellData(
                                              recruiter.latinName),
                                          _customTableCellData(
                                            recruiter.gender,
                                            alignment: Alignment.center,
                                          ),
                                          _customTableCellData(
                                            alignment: Alignment.center,
                                            recruiter.pob,
                                          )
                                        ]),
                                      ],
                                    ),
                                  );
                                }),
                              );
                  }),
                  // SizedBox(
                  //   child: Obx(
                  //     () {
                  //       return controller.loadingList.value
                  //           ? const Center(
                  //               child: CircularProgressIndicator(),
                  //             )
                  //           : controller.agencyList.isEmpty
                  //               ? Container(
                  //                   padding: const EdgeInsets.only(top: 80),
                  //                   alignment: Alignment.center,
                  //                   child: Text(
                  //                     "មិនមានទិន្នន័យ",
                  //                     style: AppTextStyle.regular16(),
                  //                   ),
                  //                 )
                  //               : Column(
                  //                   children: List.generate(
                  //                       controller.agencyList.length, (index) {
                  //                     var agencyData =
                  //                         controller.agencyList[index];
                  //                     return InkWell(
                  //                       hoverColor: Colors.grey[200],
                  //                       onTap: () {
                  //                         DialogWidget.laodingDailog(
                  //                           context,
                  //                           homeController.langCode.value,
                  //                         );
                  //                         controller.getAgencyDetails(
                  //                           context,
                  //                           controller.agencyList[index].hashId,
                  //                           homeController.langCode.value,
                  //                         );
                  //                       },
                  //                       child: Table(
                  //                         border: TableBorder.all(
                  //                           color: Colors.grey[300]!,
                  //                           width: 0.8,
                  //                         ),
                  //                         columnWidths: columnWidths,
                  //                         children: [
                  //                           TableRow(children: [
                  //                             _customTableCellData(
                  //                               homeController.langCode.value ==
                  //                                       "kh"
                  //                                   ? agencyData.agency.country
                  //                                           .khmerName ??
                  //                                       ""
                  //                                   : agencyData.agency.country
                  //                                           .englishName ??
                  //                                       "",
                  //                             ),
                  //                             _customTableCellData(
                  //                               agencyData.agency.khmerName ??
                  //                                   "",
                  //                             ),
                  //                             _customTableCellData(
                  //                               agencyData.agency.latinName ??
                  //                                   "",
                  //                             ),
                  //                             _customTableCellData(
                  //                               alignment: Alignment.center,
                  //                               agencyData.agency
                  //                                       .nameAbbreviate ??
                  //                                   "",
                  //                             ),
                  //                             TableCell(
                  //                               child: Container(
                  //                                   height: tableRowHeight,
                  //                                   alignment: Alignment.center,
                  //                                   child: agencyData
                  //                                           .agency
                  //                                           .sendingCountry
                  //                                           .isEmpty
                  //                                       ? const SizedBox()
                  //                                       : SingleChildScrollView(
                  //                                           scrollDirection:
                  //                                               Axis.horizontal,
                  //                                           child: Row(
                  //                                             mainAxisAlignment:
                  //                                                 MainAxisAlignment
                  //                                                     .center,
                  //                                             children: List.generate(
                  //                                                 agencyData
                  //                                                     .agency
                  //                                                     .sendingCountry
                  //                                                     .length,
                  //                                                 (index) => Text(
                  //                                                     homeController.langCode.value ==
                  //                                                             "en"
                  //                                                         ? "${agencyData.agency.sendingCountry[index].enName} ${index < agencyData.agency.sendingCountry.length - 1 ? ',' : ''}"
                  //                                                         : "${agencyData.agency.sendingCountry[index].khmerName} ${index < agencyData.agency.sendingCountry.length - 1 ? ',' : ''} ",
                  //                                                     style: AppTextStyle.regular16(
                  //                                                         color:
                  //                                                             Colors.black))).withSpaceBetween(
                  //                                                 width: 5),
                  //                                           ),
                  //                                         )),
                  //                             ),
                  //                           ]),
                  //                         ],
                  //                       ),
                  //                     );
                  //                   }),
                  //                 );
                  //     },
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 60,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  return controller.loading.value
                      ? const SizedBox()
                      : Text(
                          "${"start".tr} ${controller.meta.value?.from ?? ""} - ${"to".tr} ${controller.meta.value?.to ?? ""} / ${"total".tr} ${controller.meta.value?.total ?? ""}",
                          style: AppTextStyle.bold16(fontFamily: "Battambang"),
                        );
                }),
                Obx(() {
                  return controller.loading.value
                      ? const SizedBox()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              child: Text(
                                "agencyperpage".tr,
                                style: AppTextStyle.bold14(),
                              ),
                            ),
                            SizedBox(
                              height: 42,
                              width: 150,
                              child: DropdownWidget<int>(
                                maxHeight: 200,
                                selectedItem: controller.perpageSelected.value,
                                items: const [3, 6, 10, 15],
                                onChanged: (val) {
                                  controller.onChange(val);
                                  controller.getRecruiterByPage(
                                    perpage: val.toString(),
                                    page: controller.meta.value?.currentPage
                                            .toString() ??
                                        "0",
                                    homeController.langCode.value,
                                  );
                                },
                              ),
                            ),
                          ].withSpaceBetween(width: 10),
                        );
                }),
                Obx(() {
                  return controller.loading.value
                      ? const SizedBox()
                      : PaginationWidget(
                          totalPages: controller.meta.value?.lastPage ?? 0,
                          currentPage: controller.meta.value?.currentPage ?? 0,
                          visiblePagesCount: 6,
                          onPageChanged: (val) {
                            controller.getRecruiterByPage(
                              homeController.langCode.value,
                              page: val.toString(),
                              perpage:
                                  controller.perpageSelected.value.toString(),
                            );
                          },
                        );
                }),
              ].withSpaceBetween(width: 50),
            ),
          ),
        ),
      ].withSpaceBetween(height: 10),
    );
  }
}
