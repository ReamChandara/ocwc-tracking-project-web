import 'package:get/get.dart';
import 'package:tracking_web/controller/home_controller.dart';
import 'package:tracking_web/controller/worker_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(WorkerController());
  }
}
