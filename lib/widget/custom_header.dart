import 'package:flutter/material.dart';

import '../controller/worker_controller.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final double? headerWidth;
  const CustomHeader({
    super.key,
    this.headerWidth,
    required this.title,
    required this.controller,
  });

  final WorkerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: headerWidth ?? 400,
      alignment: Alignment.center,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        // borderRadius: const BorderRadius.only(
        //     topLeft: Radius.circular(5),
        //     topRight: Radius.circular(5)),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: controller.langCode == "en"
                ? "SourceSansPro-Regular"
                : "Battambang"),
      ),
    );
  }
}
