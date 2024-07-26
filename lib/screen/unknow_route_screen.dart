import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/helper/function.dart';

class UnknowRouteScreen extends StatelessWidget {
  
  const UnknowRouteScreen({super.key,});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/notfound.gif",
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 71, 122, 211),
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Return To HomePage",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ].withSpaceBetween(height: 10),
        ),
      ),
    );
  }
}
