import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tracking_web/controller/home_controller.dart';

class CustomRichText extends StatelessWidget {
  final String title;
  final int dataFlex;
  final int tilteFlex;
  final Alignment? alignmentTile;
  final double maxFontSize;
  final double minFontSize;
  final TextStyle? titleStyle;
  final TextStyle? dataStyle;
  final List<String> data;
  final int maxLine;
  final HomeController homeController;

  const CustomRichText({
    super.key,
    this.alignmentTile,
    required this.title,
    this.titleStyle,
    this.dataStyle,
    required this.data,
    required this.homeController,
    this.maxFontSize = 18,
    this.minFontSize = 16,
    this.maxLine = 1,
    this.dataFlex = 1,
    this.tilteFlex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: tilteFlex,
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
              child: RichText(
                text: TextSpan(
                  children: data.isEmpty
                      ? []
                      : [
                          TextSpan(
                            text: '${data[0]} - ',
                            style: dataStyle ??
                                const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: "SourceSansPro-Regular",
                                ),
                          ),
                          TextSpan(
                            text: data[1],
                            style: dataStyle ??
                                const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "Battambang"),
                          ),
                        ],
                ),
              )),
        ),
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.alignmentTile,
    required this.title,
    this.titleStyle,
    this.dataStyle,
    required this.data,
    required this.homeController,
    this.maxFontSize = 16,
    this.minFontSize = 14,
    this.maxLine = 1,
    this.dataFlex = 1,
    this.tilteFlex = 1,
    this.data1,
    this.data2,
    this.multidata = false,
  });
  final Alignment? alignmentTile;
  final String title;
  final TextStyle? titleStyle;
  final TextStyle? dataStyle;
  final String data;
  final String? data1;
  final String? data2;
  final double maxFontSize;
  final double minFontSize;
  final int maxLine;
  final int dataFlex;
  final int tilteFlex;
  final bool multidata;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: tilteFlex,
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
                      fontSize: homeController.langCode.value == "en" ? 16 : 14,
                      fontFamily: "Battambang"),
            ),
          ),
        ),
        Container(
          width: 20,
          padding: const EdgeInsets.only(right: 8),
          alignment: Alignment.centerRight,
          child: const Text(":"),
        ),
        multidata
            ? Flexible(
                flex: dataFlex,
                child: Container(
                    padding: const EdgeInsets.only(left: 8),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          data1 ?? "",
                          minFontSize: minFontSize,
                          maxLines: maxLine,
                          maxFontSize: maxFontSize,
                          style: dataStyle ??
                              TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      homeController.langCode.value == "en"
                                          ? 16
                                          : 14,
                                  fontFamily: "Battambang"),
                        ),
                        AutoSizeText(
                          data2 ?? "",
                          minFontSize: minFontSize,
                          maxLines: maxLine,
                          maxFontSize: maxFontSize,
                          style: dataStyle ??
                              TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      homeController.langCode.value == "en"
                                          ? 16
                                          : 14,
                                  fontFamily: "Battambang"),
                        ),
                      ],
                    )),
              )
            : Flexible(
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
                            fontSize:
                                homeController.langCode.value == "en" ? 18 : 16,
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
