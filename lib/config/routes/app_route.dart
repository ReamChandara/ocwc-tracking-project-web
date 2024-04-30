import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/binding/home_binding.dart';
import 'package:tracking_web/screen/list_worker_screen.dart';
import 'package:tracking_web/screen/scan_card_worker_screen.dart';
import '../../binding/worker_binding.dart';
import '../../screen/detial_worker_screen.dart';
import '../../screen/search_worker_screen.dart';

class Routes {
  static const searchwoker = '/searchworker';
  static const detail = '/details';
  static const listWorker = '/listWorker';
  static const test = "/test";
  static const scanWorker = "/scanWorker";
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
      page: () => const ScanWorkerCard(),
    ),
  ];
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(Routes.searchwoker)!.currentPage!],
    );
  }
}
