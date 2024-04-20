import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/worker_controller.dart';

class ButtonShowCard extends StatelessWidget {
  const ButtonShowCard({
    super.key,
    required this.controller,
  });

  final WorkerController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.showImageCard(context);
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        alignment: Alignment.center,
        height: 42,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 71, 122, 211),
            borderRadius: BorderRadius.circular(5)),
        child: Text("viewcard".tr,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: controller.langCode == "en"
                    ? "SourceSansPro-Regular"
                    : "Battambang")),
      ),
    );
  }
}
