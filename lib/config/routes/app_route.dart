import 'package:get/get.dart';
import 'package:tracking_web/binding/agency_binding.dart';
import 'package:tracking_web/binding/home_binding.dart';
import 'package:tracking_web/binding/scanner_binding.dart';
import 'package:tracking_web/screen/finding_agency_screen.dart';
import 'package:tracking_web/screen/list_worker_screen.dart';
import '../../binding/worker_binding.dart';
import '../../screen/agency_detail_screen.dart';
import '../../screen/detial_worker_screen.dart';
import '../../screen/find_ocwc_menber.dart';
import '../../screen/number_card_screen.dart';
import '../../screen/scan_worker_screen.dart';
import '../../screen/search_worker_screen.dart';

class Routes {
  static const searchwoker = '/searchworker';
  static const findworker = '/findocwcmember';
  static const findagentcy = '/findagentcy';
  static const detail = '/details';
  static const listWorker = '/listWorker';
  static const test = "/test";
  static const scanWorker = "/scanWorker";
  static const uknowRoute = "/notfound";
  static const numberCard = "/numberCard";
  static const agencyDetail = "/agencyDetail";
  static const filepreview = "/filepreview";
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.findworker,
      binding: HomeBinding(),
      page: () => const FindOCWCMember(),
    ),
    GetPage(
      name: Routes.findagentcy,
      binding: HomeBinding(),
      page: () => const FindingAgency(),
    ),
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
    GetPage(
      name: Routes.numberCard,
      page: () => const NumberCardScreen(),
    ),
    GetPage(
      name: Routes.agencyDetail,
      binding: AgencyBinding(),
      page: () => AgencyDetailScreen(),
    ),
    GetPage(name: Routes.filepreview, page: () => const FilePreview())
  ];
}
