// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tracking_web/config/helper/function.dart';
import 'package:tracking_web/controller/agency/agency_controller.dart';
import 'dart:ui_web' as ui;
import 'package:web/web.dart';

class CustomFileView extends StatelessWidget {
  final bool isImage;
  final String fileUrl;
  final bool? showToolBar;
  final bool? canScroll;
  CustomFileView(
      {super.key,
      required this.isImage,
      required this.fileUrl,
      this.showToolBar,
      this.canScroll});
  final controller = Get.put(AgencyController());
  @override
  Widget build(BuildContext context) {
    if (isImage) {
      ui.platformViewRegistry.registerViewFactory(
        fileUrl,
        (int viewId) => HTMLImageElement()
          ..src = fileUrl
          ..style.width = 'auto'
          ..style.height = '100%'
          ..style.display = 'block'
          ..style.margin = 'auto',
      );
      return InkWell(
        onTap: () {
          // controller.fetchImageBytes(documentPath);
          // dialogShowImage(context, documentPath);
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 3,
              ),
            ],
          ),
          alignment: Alignment.center,
          width: 150,
          height: 180,
          child: HtmlElementView(
            viewType: fileUrl,
          ),
          // Image.network(
          //   pathUrl,
          //   headers: const <String, String>{
          //     "Content-Type": "text/html",
          //     "Access-Control-Allow-Origin": "*",
          //     "Access-Control-Allow-Methods": "GET,POST,OPTIONS"
          //   },
          //   errorBuilder: ((context, error, stackTrace) {
          //     return Container(
          //       width: 150,
          //       height: 180,
          //       padding: const EdgeInsets.all(8.0),
          //       decoration: const BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage('assets/images/noimage.jpg')),
          //       ),
          //     );
          //   }),
          // ),
          // child: CachedNetworkImage(
          //   imageUrl: documentPath,
          //   progressIndicatorBuilder: (context, url, downloadProgress) =>
          //       CircularProgressIndicator(
          //     value: downloadProgress.progress,
          //   ),
          //   imageBuilder: (context, imageProvider) {
          //     return Container(
          //       decoration: BoxDecoration(
          //         image: DecorationImage(image: imageProvider),
          //       ),
          //     );
          //   },
          //   errorWidget: (context, url, error) => Container(
          //     width: 150,
          //     height: 180,
          //     padding: const EdgeInsets.all(8.0),
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage('assets/images/noimage.jpg')),
          //     ),
          //   ),
          // ),
        ),
      );
    } else {
      final String pdfUrlWithParams =
          '$fileUrl#toolbar=${showToolBar == true ? 1 : 0}';
      ui.platformViewRegistry.registerViewFactory(
        pdfUrlWithParams,
        (int viewId) {
          return IFrameElement()
            ..src = pdfUrlWithParams
            ..style.border = 'none'
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.display = 'block'
            ..style.pointerEvents = canScroll == true ? 'auto' : 'none';
        },
      );

      return Column(
        children: [
          SizedBox(
            height: 153,
            width: 140,
            child: InkWell(
              onTap: () {
                controller.launchPdf(fileUrl);
              },
              // child: FileViewer(
              //   fileUrl:
              //       'https://ocwc.co/volume/uploads/agency/documents/1937/2024-05-231716436221_ID Card_RELIEVER C.pdf',
              //   fileType: FileTypes.pdf,
              // ),
            ),
            // decoration: BoxDecoration(
            //   image: const DecorationImage(
            //       image: AssetImage('assets/images/pdf_logo.jpg')),
            //   border: Border.all(color: Colors.grey[300]!),
            // ),
            // child: PdfViewer.openFutureFile(() async {
            //   return documentPath;
            // }, loadingBannerBuilder: (context) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }, onError: (error) {
            //   print(error);
            // }),
          ),
          // Text("filetype".tr,
          //     style: TextStyle(
          //       fontFamily: homeController.langCode.value == "en"
          //           ? "SourceSansPro-Bold"
          //           : "Battambang-Bold",
          //       fontSize: homeController.langCode.value == "en" ? 14 : 12,
          //     )),
          // Text("clickfile".tr,
          //     style: TextStyle(
          //       fontFamily: homeController.langCode.value == "en"
          //           ? "SourceSansPro-Bold"
          //           : "Battambang-Bold",
          //       fontSize: homeController.langCode.value == "en" ? 14 : 12,
          //     )),
        ].withSpaceBetween(height: 5),
      );
    }
  }
}
