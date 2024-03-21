import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/binding/home_binding.dart';
import 'package:tracking_web/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SourceSansPro-Regular",
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}
