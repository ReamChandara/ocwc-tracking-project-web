import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/controller/worker_controller.dart';
import '../widget/web_screen_widget.dart';

class WorkerDetail extends GetView<WorkerController> {
  const WorkerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkerController>(builder: (controller) {
      if (controller.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.workerData == null) {
        return const Center(
          child: Text(
            "Not Found",
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        );
      } else {
        return WebNewScreen(controller: controller);
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