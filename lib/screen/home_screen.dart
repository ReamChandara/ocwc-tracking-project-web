// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
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

  void submit() {
    if (validation()) {
    } else {
      controller.searchWorker();
    }
  }

  get buildNewBody {
    return Form(
        key: formKey,
        child: Container(
          color: Colors.yellow,
        ));
  }

  Widget _buildBody(context) {
    return Form(
      key: formKey,
      child: Container(
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
                        inactiveThumbImage:
                            const AssetImage('assets/images/english_flag.png'),
                        value: controller.switchValue.value,
                        onChanged: (value) {
                          controller.changeSwitch(value);
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "subTitle".tr,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 40,
              ),
              TextFieldWidget(
                onFieldSubmitted: (val) {
                  controller.setNameController = val;
                  submit();
                },
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
                  submit();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      submit();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 100,
                      color: Colors.blue,
                      child: Text(
                        "track".tr,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
