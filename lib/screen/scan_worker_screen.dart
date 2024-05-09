import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/helper/function.dart';

import '../controller/scanner_controller.dart';

class ScanWorkerScreen extends GetView<ScannerController> {
  const ScanWorkerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, boxConstraints) {
          return Container(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpg"),
              ),
            ),
            child: () {
              if (boxConstraints.maxWidth > 1200) {
                return const BuildWebUI();
              } else {
                return const BuildPhoneUI();
              }
            }(),
          );
        },
      ),
    );
  }
}

class BuildWebUI extends StatelessWidget {
  const BuildWebUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/splash_logo_new.png",
            width: 350,
          ),
          const SizedBox(height: 10),
          Container(
            width: 360,
            height: 500,
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(35, 54, 93, 0.5),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "scancardTitle".tr,
                  style: const TextStyle(
                      fontFamily: "Battambang",
                      fontSize: 20,
                      color: Colors.white),
                ),
                Text(
                  "scansubtitle".tr,
                  style: const TextStyle(
                      fontFamily: "Battambang",
                      fontSize: 20,
                      color: Colors.white),
                ),
                const BuildQRWidget(),
              ].withSpaceBetween(height: 10),
            ),
          )
        ],
      ),
    );
  }
}

class BuildQRWidget extends StatelessWidget {
  const BuildQRWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      height: 300,
      width: 300,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 71, 122, 211),
          ),
        ),
      ),
    );
  }
}

class BuildPhoneUI extends StatelessWidget {
  const BuildPhoneUI({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/splash_logo_new.png",
          width: 250,
        ),
        const SizedBox(height: 10),
        // buildQrScanWiget(),
        Container(
          padding: const EdgeInsets.all(6),
          height: 300,
          width: 300,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 71, 122, 211),
              ),
            ),
          ),
        )
      ],
    );
  }
}
