import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tracking_web/controller/home_controller.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.alignmentTile,
    required this.title,
    this.titleStyle,
    this.dataStyle,
    required this.data,
    required this.homeController,
    this.maxFontSize = 18,
    this.minFontSize = 12,
    this.maxLine = 1,
    this.dataFlex = 1,
  });
  final Alignment? alignmentTile;
  final String title;
  final TextStyle? titleStyle;
  final TextStyle? dataStyle;
  final String data;
  final double maxFontSize;
  final double minFontSize;
  final int maxLine;
  final int dataFlex;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.only(left: 8),
            alignment: alignmentTile ?? Alignment.centerLeft,
            child: AutoSizeText(
              title,
              minFontSize: minFontSize,
              maxLines: 1,
              maxFontSize: maxFontSize,
              style: titleStyle ??
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: homeController.langCode.value == "en" ? 18 : 16,
                      fontFamily: homeController.langCode.value == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
            ),
          ),
        ),
        Container(
          width: 20,
          padding: const EdgeInsets.only(right: 8),
          alignment: Alignment.centerRight,
          child: const Text(":"),
        ),
        Flexible(
          flex: dataFlex,
          child: Container(
            padding: const EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              data,
              minFontSize: minFontSize,
              maxLines: maxLine,
              maxFontSize: maxFontSize,
              style: dataStyle ??
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: homeController.langCode.value == "en" ? 18 : 16,
                      fontFamily: homeController.langCode.value == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
            ),
          ),
        ),
      ],
    );
  }
}
