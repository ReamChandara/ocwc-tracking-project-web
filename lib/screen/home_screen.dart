// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tracking_web/controller/worker_controller.dart';
import '../widget/textfield_widget.dart';

class HomeScreen extends GetView<WorkerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
              child:
                  Form(key: controller.globalKey, child: _buildBody(context)))),
    );
  }

  bool validateDate(String text) {
    final RegExp dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/(19|20)\d\d$');
    return (dateRegex.hasMatch(text));
  }

  Widget _buildBody(context) {
    return Container(
      height: 520,
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
              "Find Your OCWC Information",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter Name And Date of birth",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 40,
            ),
            TextFieldWidget(
              onFieldSubmitted: (val) {
                controller.setNameController = val;
                controller.submit();
              },
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Full name is required.";
                } else {
                  return null;
                }
              },
              controller: controller.nameController,
              labelText: "Latin Name",
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              controller: controller.dateController,
              labelText: "date of birth",
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
                  return "Date of Birth is required!";
                } else if (!validateDate(val)) {
                  return "Date of birth is invalid.";
                } else {
                  return null;
                }
              },
              onFieldSubmitted: (val) {
                controller.setDateController = val;
                controller.submit();
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
                GestureDetector(
                  onTap: () {
                    controller.searchWorker();

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserDetailScreen(),
                    //   ),
                    // );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 42,
                    width: 100,
                    color: Colors.blue,
                    child: Text(
                      "Find",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
