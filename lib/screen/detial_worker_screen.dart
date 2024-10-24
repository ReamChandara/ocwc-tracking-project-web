// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/theme/app_theme.dart';
import 'package:tracking_web/controller/home_controller.dart';
import 'package:tracking_web/controller/new_worker_controller.dart';
import '../widget/web_screen_widget.dart';

class WorkerDetail extends StatefulWidget {
  const WorkerDetail({super.key});

  @override
  State<WorkerDetail> createState() => _WorkerDetailState();
}

class _WorkerDetailState extends State<WorkerDetail> {
  late NewWorkerController workerController;
  late HomeController homeController;

  @override
  void initState() {
    workerController = Get.put(NewWorkerController());
    homeController = Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewWorkerController>(builder: (controller) {
      if (controller.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (controller.workerData == null) {
          return NotFoundPage(
            workerController: controller,
          );
        } else {
          return WebNewScreen(
            controller: controller,
            homeController: homeController,
          );
        }
      }
    });
  }
}

class NotFoundPage extends StatelessWidget {
  final NewWorkerController workerController;

  const NotFoundPage({super.key, required this.workerController});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (val) async {
        await Future.delayed(const Duration(seconds: 1)).whenComplete(
            () => workerController.scannerController.startScanning());
      },
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              height: 250,
              "assets/images/no-results.png",
            ),
            Text(
              "workernotfound".tr,
              style: AppTextStyle.bold26(
                color: Colors.black,
                fontFamily: "Battambang-Bold",
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 71, 122, 211),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "back".tr,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Battambang"),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

// LayoutBuilder(builder: (context, constrained) {
//           if (constrained.maxWidth >= 900 || constrained.maxHeight >= 1024) {
//             return WebNewScreen(controller: controller);
//           } else {
//             return PhoneScreen(
//               controller: controller,
//             );
//           }
//         });