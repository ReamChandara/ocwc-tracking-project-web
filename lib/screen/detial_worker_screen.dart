import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tracking_web/config/theme/app_theme.dart';
import 'package:tracking_web/models/worker_models.dart';

import '../config/constant/string_constant.dart';

class WorkerDetail extends StatelessWidget {
  final WorkerData workerData;
  final int falseIndex;
  const WorkerDetail(
      {super.key, required this.workerData, required this.falseIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
                color: Colors.white,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 1,
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    title: Text(
                      "Worker Detail",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
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
                                      image: NetworkImage(workerData.photo))),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              workerData.fullName.khName,
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
                              workerData.fullName.enName,
                              style:
                                  AppTextStyle.regular18(color: Colors.black),
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
                                  "Gender",
                                  style: AppTextStyle.regular16(
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                workerData.gender.enName,
                                style:
                                    AppTextStyle.regular16(color: Colors.black),
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
                                  "OCWC No",
                                  style: AppTextStyle.regular16(
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                workerData.ocwcNo,
                                style:
                                    AppTextStyle.regular16(color: Colors.black),
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
                                  "Country",
                                  style: AppTextStyle.regular16(
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                workerData.country.enName,
                                style:
                                    AppTextStyle.regular16(color: Colors.black),
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
                                  "Send Agency ",
                                  style: AppTextStyle.regular16(
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                workerData.sendingAgency.enName,
                                style:
                                    AppTextStyle.regular16(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
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
                          "Tracking Information",
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
                                childAspectRatio: 3),
                        itemCount: workerData.tricking.length,
                        itemBuilder: (context, index) {
                          var track = workerData.tricking[index];
                          var textColor = Colors.green;
                          if (track.check) {
                            textColor = Colors.green;
                          } else {
                            if (index == falseIndex) {
                              textColor = Colors.orange;
                            } else {
                              textColor = Colors.red;
                            }
                          }
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 20),
                            child: ListTile(
                                title: Text(track.title.enTitle),
                                leading: Image.asset(
                                  iconImage[index],
                                  color: Colors.blueAccent.shade100,
                                  width: 30,
                                ),
                                subtitle: () {
                                  return Text(
                                    track.date.enDate,
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
                          "Work Address",
                          style: AppTextStyle.bold18(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 45,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Icon(Icons.apartment, color: Colors.blue.shade100),
                          const VerticalDivider(),
                          Text(
                            workerData.workAddress.enName,
                            style: AppTextStyle.regular18(color: Colors.black),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )
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
