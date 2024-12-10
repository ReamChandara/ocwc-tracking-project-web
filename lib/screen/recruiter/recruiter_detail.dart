// ignore: avoid_web_libraries_in_flutter
import "dart:html" as html;
import 'dart:ui_web' as ui;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tracking_web/config/responsive/main_resposive.dart';
import 'package:tracking_web/controller/recruiter/recruiter_controller.dart';
import 'package:tracking_web/widget/appbar_widget.dart';
import '../../config/routes/app_route.dart';
import '../../controller/home_controller.dart';

class RecruiterDetail extends StatelessWidget {
  RecruiterDetail({super.key});

  final HomeController homeController = Get.put(HomeController());
  final controller = Get.put(RecruiterDetialController());
  final int tilteFlex = 2;
  final int dataFlex = 2;

  void dialogShowImage(BuildContext context, String path) {
    Alert(
        style: AlertStyle(
            titleStyle: TextStyle(
              fontFamily: homeController.langCode.value == "en"
                  ? "SourceSansPro-Regular"
                  : "Battambang",
            ),
            descStyle: TextStyle(
              fontFamily: homeController.langCode.value == "en"
                  ? "SourceSansPro-Regular"
                  : "Battambang",
            ),
            descPadding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            animationType: AnimationType.grow,
            overlayColor: Colors.grey.shade100.withOpacity(0.9)),
        image: CachedNetworkImage(
          imageUrl: path,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
          imageBuilder: (context, imageProvider) {
            return Container(
              height: 250,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider),
              ),
            );
          },
          errorWidget: (context, url, error) => Container(
            height: 250,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/noimage.jpg')),
            ),
          ),
          // Container(
          //   alignment: Alignment.center,
          //   width: 120,
          //   height: 100,
          //   margin: const EdgeInsets.only(
          //     right: 10,
          //   ),
          //   decoration: BoxDecoration(
          //     border: Border.all(
          //       color: Colors.grey.shade200,
          //       width: 3,
          //     ),
          //     image: const DecorationImage(
          //         image: AssetImage('assets/images/noimage.jpg')),
          //     shape: BoxShape.circle,
          //   ),
          //   // child: const Icon(Icons.error),
          // ),
        ),
        context: context,
        buttons: [
          DialogButton(
              color: const Color.fromARGB(255, 71, 122, 211),
              child: Text(
                "close".tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: homeController.langCode.value == "en"
                      ? "SourceSansPro-Regular"
                      : "Battambang",
                ),
              ),
              onPressed: () {
                Get.back();
              })
        ]).show();
  }

  _buildHtmlView(String htmlraw) {
    final html.IFrameElement iframe = html.IFrameElement()
      ..srcdoc = htmlraw
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.border = '0';

    // final html.DivElement htmlElement = html.DivElement()
    //   ..setInnerHtml(htmlraw, validator: customValidator);

    // Register the element with a unique view ID
    const String viewId = 'html-view';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewId,
      (int viewId) => iframe,
    );
    return const SizedBox(
      child: HtmlElementView(viewType: viewId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          title: "ភ្នាក់ងារ".tr,
          onPressed: () {
            RouteView.recruiterDetail.go(
              backRoutes: RouteView.recruiter.name,
            );
          }),
      body: LayoutBuilder(
        builder: (context, constrained) {
          return MainResposive(
            large: Obx(
              () => controller.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _buildHtmlView(controller.htmlRaw.value),
            ),
          );
        },
      ),
    );
  }
}
