import 'package:flutter/material.dart';
import 'package:tracking_web/controller/home_controller.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final double? headerWidth;
  final String? fontFamily;
  final double? height;
  const CustomHeader({
    super.key,
    this.headerWidth,
    required this.title,
    required this.homeController,
    this.height,
    this.fontFamily,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: headerWidth ?? 400,
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black,
            fontSize: homeController.langCode.value == "en" ? 18 : 16,
            fontWeight: FontWeight.bold,
            fontFamily: "Battambang"),
      ),
    );
  }
}
