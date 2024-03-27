import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/binding/home_binding.dart';
import 'package:tracking_web/screen/detial_worker_screen.dart';
import 'package:tracking_web/screen/home_screen.dart';

import 'config/translate/message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "OCWC Tracking",
      translations: Message(),
      locale: const Locale("en", "US"),
      fallbackLocale: const Locale("en", "US"),
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SourceSansPro-Regular",
        useMaterial3: false,
      ),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomeScreen(),
        "/workerDetail": (context) => const WorkerDetail()
      },
      home: HomeScreen(),
    );
  }
}
