import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/controller/home_controller.dart';

class ButtonShowCard extends StatelessWidget {
  const ButtonShowCard({
    super.key,
    required this.controller,
    this.onTap,
  });
  final void Function()? onTap;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        //  margin: const EdgeInsets.all(12),
        alignment: Alignment.center,
        height: 42,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 71, 122, 211),
            borderRadius: BorderRadius.circular(5)),
        child: Text("viewcard".tr,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: controller.langCode.value == "en"
                    ? "SourceSansPro-Regular"
                    : "Battambang")),
      ),
    );
  }
}
