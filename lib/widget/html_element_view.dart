// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:web/web.dart';

class FileViewer extends StatelessWidget {
  final String fileUrl;
  final FileTypes fileType;
  final bool? showToolBar;
  final bool? canScroll;
  final String? base64;
  final void Function()? onTap;

  const FileViewer({
    super.key,
    required this.fileUrl,
    required this.fileType,
    this.base64,
    this.showToolBar,
    this.canScroll,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (fileType == FileTypes.image) {
      ui.platformViewRegistry.registerViewFactory(
        fileUrl,
        (int viewId) => HTMLImageElement()
          ..src = fileUrl
          ..style.width = 'auto'
          ..style.height = '100%'
          ..style.display = 'block'
          ..style.margin = 'auto',
      );

      return Stack(
        children: [
          HtmlElementView(
            viewType: fileUrl,
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: onTap,
              ),
            ),
          ),
        ],
      );
    } else if (fileType == FileTypes.pdf) {
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

      return Stack(
        children: [
          HtmlElementView(
            viewType: pdfUrlWithParams,
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: onTap,
              ),
            ),
          ),
        ],
      );
    }
    if (fileType == FileTypes.base64) {
      final dataUrl = 'data:application/pdf;base64,$base64';

      ui.platformViewRegistry.registerViewFactory(
        dataUrl,
        (int viewId) {
          final iframe = IFrameElement()
            ..src = dataUrl
            ..style.border = 'none'
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.display = 'block'
            ..style.pointerEvents = 'none';

          return iframe;
        },
      );

      return Stack(
        children: [
          HtmlElementView(
            viewType: dataUrl,
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

enum FileTypes { image, pdf, base64 }
