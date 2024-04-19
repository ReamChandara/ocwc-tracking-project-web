import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../controller/worker_controller.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.alignmentTile,
    required this.title,
    this.titleStyle,
    this.dataStyle,
    required this.data,
    required this.controller,
    this.maxFontSize = 16,
    this.minFontSize = 12,
    this.maxLine = 1,
  });
  final Alignment? alignmentTile;
  final String title;
  final TextStyle? titleStyle;
  final TextStyle? dataStyle;
  final String data;
  final double maxFontSize;
  final double minFontSize;
  final int maxLine;
  final WorkerController controller;

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
              minFontSize: 12,
              maxLines: 1,
              maxFontSize: maxFontSize,
              style: titleStyle ??
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: controller.langCode == "en" ? 16 : 16,
                      fontFamily: controller.langCode == "en"
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
          flex: 1,
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
                      fontSize: controller.langCode == "en" ? 18 : 16,
                      fontFamily: controller.langCode == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
            ),
          ),
        ),
      ],
    );
  }
}
