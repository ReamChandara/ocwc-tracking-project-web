import 'package:get/get.dart';
import 'package:tracking_web/binding/agency_binding.dart';
import 'package:tracking_web/binding/home_binding.dart';
import 'package:tracking_web/screen/recruiter/recruiter_list.dart';
import 'package:tracking_web/screen/agency/agency_list_screen.dart';
import 'package:tracking_web/screen/recruiter/recruiter_detail.dart';
import 'package:tracking_web/screen/recruiter/find_recruiter_screen.dart';
import 'package:tracking_web/screen/agency/finding_agency_screen.dart';
import 'package:tracking_web/screen/home_screen.dart';
import 'package:tracking_web/screen/worker/list_worker_screen.dart';
import 'package:tracking_web/screen/recruiter/scan_recruiter_card_screen.dart';
import '../../binding/scanner_binding.dart';
import '../../binding/worker_binding.dart';
import '../../screen/agency/agency_detail_screen.dart';
import '../../screen/worker/detial_worker_screen.dart';
import '../../screen/worker/find_ocwc_member.dart';
import '../../screen/worker/number_card_screen.dart';
import '../../screen/recruiter/print_agency_card_screen.dart';
import '../../screen/recruiter/recruiter_screen.dart';
import '../../screen/worker/scan_worker_screen.dart';
import '../../screen/worker/search_worker_screen.dart';

// class Routes {
//   static const home = "/home";
//   static const searchwoker = '/searchworker';
//   static const findworker = '/findocwcmember';
//   static const findagency = '/findagency';
//   static const detail = '/details';
//   static const listWorker = '/listWorker';
//   static const test = "/test";
//   static const scanWorker = "/scanWorker";
//   static const uknowRoute = "/notfound";
//   static const numberCard = "/numberCard";
//   static const agencyDetail = "/agencyDetail";
//   static const filepreview = "/filepreview";
//   static const listAgency = "/list";
// }

// abstract class AppPages {
//   static final pages = [
//     GetPage(name: Routes.home, page: () => HomeScreen(), children: [
//       GetPage(
//         name: Routes.findagency,
//         page: () => const FindingAgency(),
//       ),
//     ]),
//     GetPage(
//       name: Routes.findworker,
//       binding: HomeBinding(),
//       page: () => const FindOCWCMember(),
//     ),
//     // GetPage(
//     //   name: Routes.findagentcy,
//     //   binding: HomeBinding(),
//     //   page: () => const FindingAgency(),
//     // ),
//     GetPage(
//       name: Routes.searchwoker,
//       binding: HomeBinding(),
//       page: () => const SearchWorkerScreen(),
//     ),
//     GetPage(
//       name: Routes.listWorker,
//       page: () => const ListWorkerScreen(),
//     ),
//     GetPage(
//       name: Routes.detail,
//       bindings: [HomeBinding(), WorkerBinding()],
//       page: () => const WorkerDetail(),
//     ),
//     GetPage(
//       name: Routes.scanWorker,
//       page: () => const ScanWorkerScreen(),
//       binding: ScannerBinding(),
//     ),
//     GetPage(
//       name: Routes.numberCard,
//       page: () => const NumberCardScreen(),
//     ),
//     GetPage(
//       name: Routes.agencyDetail,
//       binding: AgencyBinding(),
//       page: () => AgencyDetailScreen(),
//     ),
//     GetPage(
//       binding: AgencyBinding(),
//       name: Routes.listAgency,
//       page: () => AgencyListScreen(),
//     ),
//   ];
// }

// import 'package:get/get.dart';
// import 'package:test_routing/page/editing_photo.dart';
// import 'package:test_routing/page/home_page.dart';
// import 'package:test_routing/page/selfemp_page.dart';

enum RouteView {
  home,
  searchWorker,
  findOcwcmember,
  findagency,
  detail,
  listWorker,
  scanWorker,
  numberCard,
  agencyDetail,
  listAgency,
  printAgencyCard,
  recruiter,
  findRecruiter,
  scanRecruiterCard,
  recruiterList,
  recruiterDetail,
}

extension ActionRouteView on RouteView {
  Future<void> go({
    bool replacment = false,
    bool clearAll = false,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
    String backRoutes = "",
  }) async {
    if (clearAll) {
      return Get.offAllNamed(
        name,
        predicate: (route) => false,
        arguments: arguments,
        id: id,
        parameters: parameters,
      );
    } else if (replacment) {
      return Get.offNamed(
        name,
        arguments: arguments,
        id: id,
        parameters: parameters,
      );
    } else if (backRoutes.isNotEmpty) {
      return Get.offNamedUntil(
        backRoutes,
        (route) => route.settings.name == "/$backRoutes",
        parameters: parameters,
      );
    } else {
      return Get.toNamed(
        name,
        arguments: arguments,
        id: id,
        parameters: parameters,
      );
    }
  }
}

class AppRouting {
  static final route = RouteView.values.map((e) {
    switch (e) {
      case RouteView.home:
        return GetPage(
          name: "/${e.name}",
          page: () => HomeScreen(),
          binding: HomeBinding(),
          transition: Transition.native,
        );
      case RouteView.findOcwcmember:
        return GetPage(
          name: "/${e.name}",
          page: () => const FindOCWCMember(),
        );
      case RouteView.findagency:
        return GetPage(
          name: "/${e.name}",
          page: () => const FindingAgency(),
        );
      case RouteView.detail:
        return GetPage(
          name: "/${e.name}",
          bindings: [HomeBinding(), WorkerBinding()],
          page: () => const WorkerDetail(),
        );
      case RouteView.searchWorker:
        return GetPage(
          name: "/${e.name}",
          bindings: [HomeBinding(), WorkerBinding()],
          page: () => const SearchWorkerScreen(),
        );
      case RouteView.listWorker:
        return GetPage(
          name: "/${e.name}",
          page: () => const ListWorkerScreen(),
        );
      case RouteView.scanWorker:
        return GetPage(
          name: "/${e.name}",
          binding: ScannerBinding(),
          page: () => const ScanWorkerScreen(),
        );
      case RouteView.agencyDetail:
        return GetPage(
          name: "/${e.name}",
          // binding: AgencyBinding(),
          page: () => AgencyDetailScreen(),
        );
      case RouteView.numberCard:
        return GetPage(
          name: "/${e.name}",
          page: () => const NumberCardScreen(),
        );
      case RouteView.listAgency:
        return GetPage(
          binding: AgencyBinding(),
          name: "/${e.name}",
          page: () => AgencyListScreen(),
        );
      case RouteView.printAgencyCard:
        return GetPage(
          name: "/${e.name}",
          page: () => const PrintAgencyCardScreen(),
        );
      case RouteView.recruiter:
        return GetPage(
          name: "/${e.name}",
          page: () => const RecruiterScreen(),
        );
      case RouteView.findRecruiter:
        return GetPage(
          name: "/${e.name}",
          page: () => const FindRecruiterScreen(),
        );
      case RouteView.scanRecruiterCard:
        return GetPage(
          name: "/${e.name}",
          binding: ScannerBinding(),
          page: () => const ScanRecruiterCardScreen(),
        );
      case RouteView.recruiterList:
        return GetPage(
          name: "/${e.name}",
          page: () => RecruiterList(),
        );
      case RouteView.recruiterDetail:
        return GetPage(
          name: "/${e.name}",
          page: () => RecruiterDetail(),
        );
      // case RouteView.editingPhoto:
      ////////////////////////////////
    }
  }).toList();
}
