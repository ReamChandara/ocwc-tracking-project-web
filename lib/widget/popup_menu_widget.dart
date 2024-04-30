import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Obx(() {
          return PopupMenuButton(
            offset: const Offset(
              0.0,
              10,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
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
                      value: "en",
                      child: Row(
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
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    )
                  : PopupMenuItem(
                      value: "kh",
                      child: Row(
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
          );
        }),
      ],
    );
  }
}
