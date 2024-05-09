import 'package:get/get.dart';
import 'package:tracking_web/controller/scanner_controller.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScannerController());
  }
}
