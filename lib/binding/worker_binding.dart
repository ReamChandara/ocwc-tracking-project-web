import 'package:get/get.dart';

import '../controller/new_worker_controller.dart';

class WorkerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewWorkerController());
  }
}
