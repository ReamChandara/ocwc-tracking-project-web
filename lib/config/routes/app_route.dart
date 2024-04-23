import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/binding/home_binding.dart';
import 'package:tracking_web/screen/list_worker_screen.dart';
import 'package:tracking_web/screen/test_screen.dart';
import '../../screen/detial_worker_screen.dart';
import '../../screen/home_screen.dart';

abstract class Routes {
  static const home = '/home';
  static const detail = '/details';
  static const listWorker = '/listWorker';
  static const test = "/test";
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      binding: HomeBinding(),
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.listWorker,
      page: () => const ListWorkerScreen(),
    ),
    GetPage(
      name: Routes.detail,
      binding: HomeBinding(),
      page: () => const WorkerDetail(),
    ),
    GetPage(
      name: Routes.test,
      page: () => const TestScreen(),
    )
  ];
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(Routes.home)!.currentPage!],
    );
  }
}
