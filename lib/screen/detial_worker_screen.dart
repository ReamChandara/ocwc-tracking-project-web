import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        return WebNewScreen(
          controller: controller,
          homeController: homeController,
        );
      }
    });
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