import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tracking_web/config/helper/function.dart';

import '../controller/worker_controller.dart';
import '../widget/textfield_widget.dart';

class SearchWorkerScreen extends GetView<WorkerController> {
  SearchWorkerScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, boxConstraints) {
        return Container(
            width: boxConstraints.maxWidth,
            height: boxConstraints.maxHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpg"),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  () {
                    if (boxConstraints.maxWidth > 1000) {
                      return buildWebUI(context);
                    } else {
                      return _buildPhoneUI(context);
                    }
                  }(),
                ],
              ),
            ));
      }),
    );
  }

  Widget buildWebUI(BuildContext context) {
    return SizedBox(
      height: 900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/splash_logo_new.png",
            width: 400,
          ),
          buidCardSearch(context),
        ],
      ),
    );
  }

  Widget _buildPhoneUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Image.asset(
          "assets/images/splash_logo_new.png",
          width: 250,
        ),
        const SizedBox(height: 20),
        buidCardSearch(context),
      ],
    );
  }

  void submit(BuildContext context) {
    if (validation()) {
    } else {
      controller.searchWorker(context);
      //  Get.rootDelegate.toNamed(Routes.detail);
    }
  }

  bool validateDate(String text) {
    final RegExp dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/(19|20)\d\d$');
    return (dateRegex.hasMatch(text));
  }

  bool validation() {
    if (formKey.currentState!.validate()) {
      return false;
    } else {
      return true;
    }
  }

  Widget buidCardSearch(BuildContext context) {
    return Container(
      height: 450,
      width: 400,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(35, 54, 93, 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "title".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: controller.langCode == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                ),
                Text(
                  "subTitle".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: controller.langCode == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  onFieldSubmitted: (val) {
                    controller.setNameController = val;
                    submit(context);
                  },
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      width: 10,
                      "assets/icons/id-card.png",
                      color: Colors.blueGrey,
                    ),
                  ),
                  errorStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: controller.langCode == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: controller.langCode == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "nameWarning".tr;
                    } else {
                      return null;
                    }
                  },
                  controller: controller.nameController,
                  hintText: "latin".tr,
                ),
                TextFieldWidget(
                  controller: controller.dateController,
                  hintText: "date".tr,
                  errorStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: controller.langCode == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: controller.langCode == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      width: 10,
                      "assets/icons/calendar.png",
                      color: Colors.blueGrey,
                    ),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        controller.showDialogPicker(context);
                      },
                      icon: const Icon(
                        Icons.date_range,
                        color: Colors.blueGrey,
                      )),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "dateWarning".tr;
                    } else if (!validateDate(val)) {
                      return "dateMatch".tr;
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (val) {
                    controller.setDateController = val;
                    submit(context);
                  },
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: '##/##/####',
                      filter: {"#": RegExp(r'[0-9]')},
                      type: MaskAutoCompletionType.lazy,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    submit(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("track".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: controller.langCode == "en"
                                ? "SourceSansPro-Regular"
                                : "Battambang")),
                  ),
                ),
              ].withSpaceBetween(height: 20)),
        ),
      ),
    );
  }
}
