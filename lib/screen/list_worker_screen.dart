import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/controller/worker_controller.dart';

class ListWorkerScreen extends StatefulWidget {
  const ListWorkerScreen({super.key});

  @override
  State<ListWorkerScreen> createState() => _ListWorkerScreenState();
}

class _ListWorkerScreenState extends State<ListWorkerScreen> {
  var controller = Get.put(WorkerController());
  @override
  void initState() {
    controller = Get.put(WorkerController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
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
      ),
      body: GetBuilder<WorkerController>(builder: (controller) {
        if (controller.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.workerModel == null) {
          return const Center(
            child: Text("Not Found "),
          );
        } else {
          return LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight * 0.80,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "workers".tr,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: controller.langCode == "en"
                                ? "SourceSansPro-Regular"
                                : "Battambang",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.workerModel!.workerData.length,
                        itemBuilder: (context, index) {
                          var worker =
                              controller.workerModel!.workerData[index];
                          return InkWell(
                            onTap: () async {
                              controller.routeToDetail(index);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? Colors.grey.shade200
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 2,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, bottom: 8, top: 8),
                                      height: 110,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(worker.photo)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      child: Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        AutoSizeText(
                                          textAlign: TextAlign.center,
                                          controller.langCode == "en"
                                              ? worker.fullName.enName
                                              : worker.fullName.khName,
                                          minFontSize: 12,
                                          maxFontSize: 16,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  controller.langCode == "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang"),
                                        ),
                                        AutoSizeText(
                                          controller.langCode == "en"
                                              ? worker.gender.enName
                                              : worker.gender.khName,
                                          maxFontSize: 16,
                                          minFontSize: 12,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  controller.langCode == "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang",
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  )),
                                  Flexible(
                                      child: Container(
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      controller.langCode == "en"
                                          ? worker.dob.enDate
                                          : worker.dob.khDate,
                                      maxFontSize: 16,
                                      minFontSize: 12,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "SourceSansPro-Regular",
                                          fontSize: 16),
                                    ),
                                  )),
                                  Flexible(
                                      child: Container(
                                    alignment: Alignment.center,
                                    child: AutoSizeText(
                                      controller.langCode == "en"
                                          ? worker.sendingAgency.enName
                                          : worker.sendingAgency.khName,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      maxFontSize: 16,
                                      minFontSize: 12,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: controller.langCode == "en"
                                            ? "SourceSansPro-Regular"
                                            : "Battambang",
                                        fontSize: 16,
                                      ),
                                    ),
                                  )),

                                  // Flexible(
                                  //   child: Row(
                                  //     children: [
                                  //       Container(
                                  //         margin: const EdgeInsets.all(8),
                                  //         height: 130,
                                  //         width: 100,
                                  //         decoration: BoxDecoration(
                                  //           color: Colors.grey.shade100,
                                  //           image: DecorationImage(
                                  //               fit: BoxFit.cover,
                                  //               image: NetworkImage(
                                  //                   worker.photo)),
                                  //           borderRadius:
                                  //               BorderRadius.circular(10),
                                  //         ),
                                  //       ),
                                  //       Padding(
                                  //         padding:
                                  //             const EdgeInsets.only(left: 10),
                                  //         child: Column(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.center,
                                  //           children: [
                                  //             AutoSizeText(
                                  //               textAlign: TextAlign.center,
                                  //               controller.langCode == "en"
                                  //                   ? worker.fullName.enName
                                  //                   : worker.fullName.khName,
                                  //               minFontSize: 12,
                                  //               maxFontSize: 14,
                                  //               maxLines: 2,
                                  //               style: TextStyle(
                                  //                   fontSize: 16,
                                  //                   fontFamily: controller
                                  //                               .langCode ==
                                  //                           "en"
                                  //                       ? "SourceSansPro-Regular"
                                  //                       : "Battambang"),
                                  //             ),
                                  //             AutoSizeText(
                                  //               controller.langCode == "en"
                                  //                   ? worker.gender.enName
                                  //                   : worker.gender.khName,
                                  //               maxFontSize: 16,
                                  //               minFontSize: 12,
                                  //               maxLines: 2,
                                  //               style: TextStyle(
                                  //                   fontFamily: controller
                                  //                               .langCode ==
                                  //                           "en"
                                  //                       ? "SourceSansPro-Regular"
                                  //                       : "Battambang",
                                  //                   fontSize: 14),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                  // Flexible(
                                  //   child: Row(
                                  //     children: [
                                  //       AutoSizeText(
                                  //         overflow: TextOverflow.ellipsis,
                                  //         controller.langCode == "en"
                                  //             ? worker.dob.enDate
                                  //             : worker.dob.khDate,
                                  //         maxFontSize: 16,
                                  //         minFontSize: 12,
                                  //         style: const TextStyle(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontFamily:
                                  //                 "SourceSansPro-Regular",
                                  //             fontSize: 14),
                                  //       ),
                                  //       AutoSizeText(
                                  //         textAlign: TextAlign.center,
                                  //         maxLines: 3,
                                  //         controller.langCode == "en"
                                  //             ? worker.sendingAgency.enName
                                  //             : worker.sendingAgency.khName,
                                  //         maxFontSize: 18,
                                  //         minFontSize: 12,
                                  //         style: TextStyle(
                                  //           fontFamily:
                                  //               controller.langCode == "en"
                                  //                   ? "SourceSansPro-Regular"
                                  //                   : "Battambang",
                                  //           fontSize: 16,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            );
          });
        }
      }),
    );
  }
}

  // Padding(
  //                     padding: const EdgeInsets.symmetric(vertical: 10),
  //                     child: DataTable(
  //                       dataRowMaxHeight: 130,
  //                       columns: const [
  //                         DataColumn(
  //                           label: Text("Full Name"),
  //                         ),
  //                         DataColumn(
  //                           label: Text("Date Of birth"),
  //                         ),
  //                         DataColumn(
  //                           label: Text("Gender"),
  //                         ),
  //                         DataColumn(
  //                           label: Text("Sender Agency"),
  //                         ),
  //                         DataColumn(
  //                           label: Text("Photo"),
  //                         ),
  //                       ],
  //                       rows: List.generate(
  //                         controller.workerModel!.workerData.length,
  //                         (index) => DataRow(cells: [
  //                           DataCell(Text(controller.workerModel!
  //                               .workerData[index].fullName.enName)),
  //                           DataCell(Text(controller
  //                               .workerModel!.workerData[index].dob.enDate)),
  //                           DataCell(Text(controller
  //                               .workerModel!.workerData[index].gender.enName)),
  //                           DataCell(Text(controller.workerModel!
  //                               .workerData[index].sendingAgency.enName)),
  //                           DataCell(Container(
  //                             height: 130,
  //                             width: 130,
  //                             margin: const EdgeInsets.symmetric(vertical: 10),
  //                             decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 image: DecorationImage(
  //                                     fit: BoxFit.cover,
  //                                     image: NetworkImage(controller
  //                                         .workerModel!
  //                                         .workerData[index]
  //                                         .photo))),
  //                           )),
  //                         ]),
  //                       ),
  //                     )),
          

//  ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: controller.workerModel!.workerData.length,
//                         itemBuilder: (context, index) {
//                           var worker =
//                               controller.workerModel!.workerData[index];
//                           return InkWell(
//                             onTap: () async {
//                               controller.routeToDetail(index);
//                             },
//                             child: Container(
//                               margin: const EdgeInsets.all(10),
//                               height: 130,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey.shade200,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Flexible(
//                                     flex: 1,
//                                     child: Row(
//                                       children: [
//                                         Flexible(
//                                           child: Container(
//                                             margin: const EdgeInsets.only(
//                                                 left: 16, bottom: 8, top: 8),
//                                             height: 130,
//                                             width: 100,
//                                             decoration: BoxDecoration(
//                                               color: Colors.grey.shade100,
//                                               image: DecorationImage(
//                                                   fit: BoxFit.cover,
//                                                   image: NetworkImage(
//                                                       worker.photo)),
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                             ),
//                                           ),
//                                         ),
//                                         Flexible(
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsets.only(left: 10),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 AutoSizeText(
//                                                   textAlign: TextAlign.center,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   controller.langCode == "en"
//                                                       ? worker.fullName.enName
//                                                       : worker.fullName.khName,
//                                                   minFontSize: 16,
//                                                   maxLines: 3,
//                                                   style: TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily: controller
//                                                                   .langCode ==
//                                                               "en"
//                                                           ? "SourceSansPro-Regular"
//                                                           : "Battambang"),
//                                                 ),
//                                                 AutoSizeText(
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   controller.langCode == "en"
//                                                       ? worker.gender.enName
//                                                       : worker.gender.khName,
//                                                   maxFontSize: 16,
//                                                   minFontSize: 12,
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily: controller
//                                                                   .langCode ==
//                                                               "en"
//                                                           ? "SourceSansPro-Regular"
//                                                           : "Battambang",
//                                                       fontSize: 14),
//                                                 ),
//                                                 AutoSizeText(
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   controller.langCode == "en"
//                                                       ? worker.dob.enDate
//                                                       : worker.dob.khDate,
//                                                   maxFontSize: 16,
//                                                   minFontSize: 12,
//                                                   style: const TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily:
//                                                           "SourceSansPro-Regular",
//                                                       fontSize: 14),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   Flexible(
//                                     flex: 1,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(right: 10),
//                                       child: AutoSizeText(
//                                         textAlign: TextAlign.center,
//                                         maxLines: 3,
//                                         controller.langCode == "en"
//                                             ? worker.sendingAgency.enName
//                                             : worker.sendingAgency.khName,
//                                         maxFontSize: 18,
//                                         minFontSize: 12,
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily:
//                                               controller.langCode == "en"
//                                                   ? "SourceSansPro-Regular"
//                                                   : "Battambang",
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),

//  Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: Row(
//                                   children: [
//                                     Expanded(
//                                       flex: 3,
//                                       child: Row(
//                                         children: [
//                                           Container(
//                                               width: 100,
//                                               height: 100,
//                                               margin: const EdgeInsets.all(10),
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(10),
//                                                 image: DecorationImage(
//                                                   fit: BoxFit.cover,
//                                                   image: NetworkImage(
//                                                       worker.photo),
//                                                 ),
//                                               )),
//                                           const SizedBox(
//                                             width: 20,
//                                           ),
//                                           Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               AutoSizeText(
//                                                 controller.langCode == "en"
//                                                     ? worker.fullName.enName
//                                                     : worker.fullName.khName,
//                                                 maxFontSize: 16,
//                                                 minFontSize: 12,
//                                                 maxLines: 2,
//                                                 style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontFamily: controller
//                                                               .langCode ==
//                                                           "en"
//                                                       ? "SourceSansPro-Regular"
//                                                       : "Battambang",
//                                                 ),
//                                               ),
//                                               AutoSizeText(
//                                                 controller.langCode == "en"
//                                                     ? worker.gender.enName
//                                                     : worker.gender.khName,
//                                                 maxFontSize: 16,
//                                                 minFontSize: 12,
//                                                 maxLines: 1,
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontFamily: controller
//                                                                 .langCode ==
//                                                             "en"
//                                                         ? "SourceSansPro-Regular"
//                                                         : "Battambang"),
//                                               ),
//                                               AutoSizeText(
//                                                 maxFontSize: 16,
//                                                 minFontSize: 12,
//                                                 maxLines: 2,
//                                                 controller.langCode == "en"
//                                                     ? worker.dob.enDate
//                                                     : worker.dob.khDate,
//                                                 style: TextStyle(
//                                                   color: Colors.grey,
//                                                   fontFamily: controller
//                                                               .langCode ==
//                                                           "en"
//                                                       ? "SourceSansPro-Regular"
//                                                       : "Battambang",
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Expanded(
//                                       flex: 2,
//                                       child: AutoSizeText(
//                                         controller.langCode == "en"
//                                             ? worker.sendingAgency.enName
//                                             : worker.sendingAgency.khName,
//                                         maxLines: 2,
//                                         maxFontSize: 16,
//                                         minFontSize: 12,
//                                         style: TextStyle(
//                                           fontFamily:
//                                               controller.langCode == "en"
//                                                   ? "SourceSansPro-Regular"
//                                                   : "Battambang",
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                     )

//                                  ],
//                                 ),
//                               ),
