import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/controller/worker_controller.dart';

class BuildAddress extends StatelessWidget {
  final double? width;
  final WorkerController controller;

  const BuildAddress({super.key, required this.controller, this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          height: 45,
          width: width ?? Get.width,
          color: Colors.blueAccent[100],
          child: Text("workAddress".tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: controller.langCode == "en"
                      ? "SourceSansPro-Regular"
                      : "Battambang")),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, left: 10, top: 10),
            width: width ?? Get.width,
            color: Colors.white,
            alignment: Alignment.topLeft,
            child: Text(
              controller.langCode == "en"
                  ? controller.workerModel!.workerData[0].workAddress.enName!
                  : controller.workerModel!.workerData[0].workAddress.khName!,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: controller.langCode == "en"
                      ? "SourceSansPro-Regular"
                      : "Battambang",
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
