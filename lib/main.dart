// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tracking_web/binding/home_binding.dart';
import 'package:tracking_web/config/routes/app_route.dart';
import 'package:tracking_web/screen/unknow_route_screen.dart';
import 'config/translate/message.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // setPathUrlStrategy();
  await GetStorage.init();
  runApp(MyApp(locale: locale()));
}

Locale locale() {
  GetStorage storage = GetStorage();
  String storageKey = "langCode";
  String langCode = storage.read(storageKey) ?? 'kh';
  if (langCode == "kh") {
    return const Locale("km", "KH");
  } else {
    return const Locale("en", "US");
  }
}

class MyApp extends StatelessWidget {
  final Locale locale;
  const MyApp({super.key, required this.locale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "OCWC Tracking",
      translations: Message(),
      locale: locale,
      initialBinding: HomeBinding(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("km", "KH"),
      ],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const UnknowRouteScreen(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const UnknowRouteScreen(),
        );
      },
      fallbackLocale: const Locale("km", "KH"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SourceSansPro-Regular",
        useMaterial3: false,
      ),
      initialRoute: "/${RouteView.home.name}",
      getPages: AppRouting.route,
    );
  }
}
