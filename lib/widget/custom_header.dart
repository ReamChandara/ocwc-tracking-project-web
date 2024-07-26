import 'package:flutter/material.dart';
import 'package:tracking_web/controller/home_controller.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final double? headerWidth;
  final String? fontFamily;
  const CustomHeader({
    super.key,
    this.headerWidth,
    required this.title,
    required this.homeController,
    this.fontFamily,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: headerWidth ?? 400,
      alignment: Alignment.center,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: homeController.langCode.value == "en"
                ? "SourceSansPro-Regular"
                : "Battambang"),
      ),
    );
  }
}
