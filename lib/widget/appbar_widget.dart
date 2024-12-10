import 'package:flutter/material.dart';
import 'package:tracking_web/widget/popup_menu_widget.dart';

buildAppBar({required String title ,required void Function() onPressed}){
  return  AppBar(
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back),
      ),
      backgroundColor: const Color.fromARGB(255, 71, 122, 211),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: "Battambang",
          // homeController.langCode.value == "kh"
          //     ? "Battambang"
          //     : "SourceSansPro-Regular"
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: PopupMenuWidget(),
        ),
      ],
    );
}