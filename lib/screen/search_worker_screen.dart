import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/home_controller.dart';
import 'package:tracking_web/controller/new_worker_controller.dart';
import 'package:tracking_web/widget/dialog_widget.dart';
import '../widget/textfield_widget.dart';

class SearchWorkerScreen extends StatefulWidget {
  const SearchWorkerScreen({super.key});

  @override
  State<SearchWorkerScreen> createState() => _SearchWorkerScreenState();
}

class _SearchWorkerScreenState extends State<SearchWorkerScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late HomeController homeController;
  late NewWorkerController workerController = Get.put(NewWorkerController());
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  late Future<DateTime?> selectedDate;

  void submit(BuildContext context) {
    String name = nameController.text.trim();
    String date = dateController.text.replaceAll("/", "-");
    if (validation()) {
    } else {
      DialogWidget.laodingDailog(context, homeController.langCode.value);
      workerController.searchWoker(
        context,
        name,
        date,
        langCode: homeController.langCode.value,
      );
    }
  }

  setDate() async {
    DialogWidget.showDialogPicker(
      context,
      homeController.langCode.value == "en"
          ? "SourceSansPro-Regular"
          : "Battambang",
    ).then((value) {
      dateController.text = DateFormat("dd/MM/yyyy").format(value);
    });
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

  @override
  void initState() {
    homeController = Get.put(HomeController());
    // workerController = Get.put(NewWorkerController());
    super.initState();
  }

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
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => PopupMenuButton(
                            position: PopupMenuPosition.under,
                            child: homeController.langCode.value == "kh"
                                ? Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/cambodia_flag.png",
                                        ),
                                      ),
                                    ),
                                    height: 30,
                                    width: 30,
                                  )
                                : Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/images/english_flag.png",
                                        ),
                                      ),
                                    ),
                                    height: 30,
                                    width: 30,
                                  ),
                            onSelected: (value) {
                              if (value == "kh") {
                                homeController.changeLang("kh");
                              } else if (value == "en") {
                                homeController.changeLang("en");
                              }
                            },
                            itemBuilder: (BuildContext context) => [
                              homeController.langCode.value == "kh"
                                  ? PopupMenuItem(
                                      height: 30,
                                      value: "en",
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  "assets/images/english_flag.png",
                                                ),
                                              ),
                                            ),
                                            height: 30,
                                            width: 30,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "English",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : PopupMenuItem(
                                      height: 30,
                                      value: "kh",
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  "assets/images/cambodia_flag.png",
                                                ),
                                              ),
                                            ),
                                            height: 30,
                                            width: 30,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "ភាសាខ្មែរ",
                                            style: TextStyle(
                                              fontFamily: "Battambang",
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      fontFamily: homeController.langCode.value == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                ),
                Text(
                  "subTitle".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: homeController.langCode.value == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  controller: nameController,
                  onFieldSubmitted: (val) {
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
                      fontFamily: homeController.langCode.value == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: homeController.langCode.value == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "nameWarning".tr;
                    } else {
                      return null;
                    }
                  },
                  hintText: "latin".tr,
                ),
                TextFieldWidget(
                  controller: dateController,
                  hintText: "date".tr,
                  errorStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: homeController.langCode.value == "en"
                          ? "SourceSansPro-Regular"
                          : "Battambang"),
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: homeController.langCode.value == "en"
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
                        setDate();
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
                            fontFamily: homeController.langCode.value == "en"
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
