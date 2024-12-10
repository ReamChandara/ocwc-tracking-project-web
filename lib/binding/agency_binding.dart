import 'package:get/get.dart';
import 'package:tracking_web/controller/agency/agency_controller.dart';

class AgencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AgencyController());
  }
}
