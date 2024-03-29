import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/controller/worker_controller.dart';

class ListWorkerScreen extends StatelessWidget {
  const ListWorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double responseWidth = Get.width * 0.70;
    return GetBuilder<WorkerController>(builder: (controller) {
      if (controller.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.workerModel == null) {
        return const Center(
          child: Text("Not Found "),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
          body: Center(
            child: Container(
              width: responseWidth,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "selectname".tr,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: controller.langCode == "en"
                              ? "SourceSansPro-Regular"
                              : "Battambang",
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.workerModel!.workerData.length,
                        itemBuilder: (context, index) {
                          var worker = controller.workerModel!.workerData[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed("/workerDetail");
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 100,
                                              height: 100,
                                              margin: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      NetworkImage(worker.photo),
                                                ),
                                              )),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              AutoSizeText(
                                                controller.langCode == "en"
                                                    ? worker.fullName.enName
                                                    : worker.fullName.khName,
                                                maxFontSize: 16,
                                                minFontSize: 12,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang",
                                                ),
                                              ),
                                              AutoSizeText(
                                                controller.langCode == "en"
                                                    ? worker.gender.enName
                                                    : worker.gender.khName,
                                                maxFontSize: 16,
                                                minFontSize: 12,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: controller
                                                                .langCode ==
                                                            "en"
                                                        ? "SourceSansPro-Regular"
                                                        : "Battambang"),
                                              ),
                                              AutoSizeText(
                                                maxFontSize: 16,
                                                minFontSize: 12,
                                                maxLines: 2,
                                                controller.langCode == "en"
                                                    ? worker.dob.enDate
                                                    : worker.dob.khDate,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: controller
                                                              .langCode ==
                                                          "en"
                                                      ? "SourceSansPro-Regular"
                                                      : "Battambang",
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: AutoSizeText(
                                        controller.langCode == "en"
                                            ? worker.sendingAgency.enName
                                            : worker.sendingAgency.khName,
                                        maxLines: 2,
                                        maxFontSize: 16,
                                        minFontSize: 12,
                                        style: TextStyle(
                                          fontFamily: controller.langCode == "en"
                                              ? "SourceSansPro-Regular"
                                              : "Battambang",
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
