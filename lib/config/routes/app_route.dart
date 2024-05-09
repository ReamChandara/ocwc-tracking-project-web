import 'package:get/get.dart';
import 'package:tracking_web/binding/home_binding.dart';
import 'package:tracking_web/binding/scanner_binding.dart';
import 'package:tracking_web/screen/list_worker_screen.dart';
import '../../binding/worker_binding.dart';
import '../../screen/detial_worker_screen.dart';
import '../../screen/scan_worker_screen.dart';
import '../../screen/search_worker_screen.dart';

class Routes {
  static const searchwoker = '/searchworker';
  static const detail = '/details';
  static const listWorker = '/listWorker';
  static const test = "/test";
  static const scanWorker = "/scanWorker";
  static const uknowRoute = "/notfound";
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.searchwoker,
      binding: HomeBinding(),
      page: () => const SearchWorkerScreen(),
    ),
    GetPage(
      name: Routes.listWorker,
      page: () => const ListWorkerScreen(),
    ),
    GetPage(
      name: Routes.detail,
      bindings: [HomeBinding(), WorkerBinding()],
      page: () => const WorkerDetail(),
    ),
    GetPage(
      name: Routes.scanWorker,
      page: () => const ScanWorkerScreen(),
      binding: ScannerBinding(),
    ),
  ];
}
