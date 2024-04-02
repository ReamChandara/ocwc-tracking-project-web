// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tracking_web/controller/worker_controller.dart';
import '../widget/textfield_widget.dart';

class HomeScreen extends GetView<WorkerController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SingleChildScrollView(child: _buildBody(context))),
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  void submit(BuildContext context) {
    if (validation()) {
    } else {
      controller.searchWorker(context);
    }
  }

  get buildNewBody {
    return Form(
        key: formKey,
        child: Container(
          color: Colors.yellow,
        ));
  }

  // This function is used to update the page title
  void setPageTitle(String title, BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: title,
      primaryColor:
          Theme.of(context).primaryColor.value, // This line is required
    ));
  }

  Widget _buildBody(context) {
    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 500,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() {
                    return Switch(
                        trackColor: MaterialStateProperty.all(Colors.grey),
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        activeThumbImage: const AssetImage(
                          'assets/images/cambodia_flag.png',
                        ),
                        inactiveThumbImage: const AssetImage(
                          'assets/images/english_flag.png',
                        ),
                        value: controller.changValue.value,
                        onChanged: (value) {
                          controller.changeLang(value);
                        });
                  }),
                ],
              ),
              Image.asset(
                "assets/images/logo_ocwc.jpg",
                width: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "title".tr,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "subTitle".tr,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
              ),
              SizedBox(
                height: 40,
              ),
              TextFieldWidget(
                onFieldSubmitted: (val) {
                  controller.setNameController = val;
                  submit(context);
                },
                errorStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                labelStyle: TextStyle(
                    fontSize: 16,
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
                labelText: "latin".tr,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                controller: controller.dateController,
                labelText: "date".tr,
                hintText: "DD/MM/YYYY",
                errorStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                labelStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: controller.langCode == "en"
                        ? "SourceSansPro-Regular"
                        : "Battambang"),
                suffixIcon: IconButton(
                    onPressed: () async {
                      controller.showDialogPicker(context);
                    },
                    icon: const Icon(
                      Icons.date_range,
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
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  submit(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("track".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: controller.langCode == "en"
                              ? "SourceSansPro-Regular"
                              : "Battambang")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
