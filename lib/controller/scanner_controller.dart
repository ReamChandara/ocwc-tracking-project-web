// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:zxing2/qrcode.dart' hide BarcodeFormat;

import '../config/routes/app_route.dart';

class ScannerController extends GetxController {
  PlatformFile? file;
  String? qrRead;
  void pickAndAnalyzeImage() async {
    FilePickerResult? pickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (pickerResult == null) {
      return;
    } else {
      showImageOnWidget(pickerResult);
      processImage();
    }
  }

  void showImageOnWidget(FilePickerResult pickerResult) {
    file = pickerResult.files.first;
    update();
  }

  Future<String> analyzeImage(Uint8List bytes) async {
    return await Future<String>(() {
      try {
        var image = img.decodeImage(bytes)!;
        LuminanceSource source = RGBLuminanceSource(
          image.width,
          image.height,
          image
              .convert(numChannels: 4)
              .getBytes(order: img.ChannelOrder.abgr)
              .buffer
              .asInt32List(),
        );
        var bitmap = BinaryBitmap(GlobalHistogramBinarizer(source));
        var reader = QRCodeReader();
        var result = reader.decode(bitmap);
        return result.text;
      } catch (e) {
        throw Exception('Error analyzing image: $e');
      }
    });
  }

  void processImage() async {
    try {
      
      var result = await analyzeImage(file!.bytes!);
      print('Image analysis result: $result');
      List<String> hashCodes = result.split("=");
      print("have data : ${hashCodes[1]}");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.toNamed(Routes.detail, parameters: {"id": hashCodes[1]});
      });
    } catch (e) {
      print('Error processing image: $e');
    }
  }

  // Future<String> analyzeImage(Uint8List bytes) async {
  //   var completer = Completer<String>();

  //   // Create a ReceivePort to receive messages from the isolate
  //   ReceivePort receivePort = ReceivePort();

  //   // Spawn a new isolate
  //   Isolate isolate = await Isolate.spawn(_analyzeImageInIsolate, {
  //     'bytes': bytes,
  //     'sendPort': receivePort.sendPort,
  //   });

  //   // Listen for messages from the isolate
  //   receivePort.listen((message) {
  //     if (message is String) {
  //       completer.complete(message);
  //       // Close the receive port and terminate the isolate
  //       receivePort.close();
  //       isolate.kill();
  //     } else {
  //       completer.completeError('Error analyzing image');
  //       // Close the receive port
  //       receivePort.close();
  //       // Terminate the isolate
  //       isolate.kill();
  //     }
  //   });

  //   return completer.future;
  // }

  // void _analyzeImageInIsolate(Map<String, dynamic> message) {
  //   Uint8List bytes = message['bytes'];
  //   SendPort sendPort = message['sendPort'];
  //   try {
  //     var image = img.decodeImage(bytes)!;
  //     LuminanceSource source = RGBLuminanceSource(
  //       image.width,
  //       image.height,
  //       image
  //           .convert(numChannels: 4)
  //           .getBytes(order: img.ChannelOrder.abgr)
  //           .buffer
  //           .asInt32List(),
  //     );
  //     var bitmap = BinaryBitmap(GlobalHistogramBinarizer(source));
  //     var reader = QRCodeReader();
  //     var result = reader.decode(bitmap);
  //     sendPort.send(result.text);
  //   } catch (e) {
  //     print(e);
  //     sendPort.send('Error analyzing image');
  //   }
  // }

  // Future<String> analyzeImage() async {
  //   var image = img.decodeImage(file!.bytes!)!;
  //   LuminanceSource source = RGBLuminanceSource(
  //       image.width,
  //       image.height,
  //       image
  //           .convert(numChannels: 4)
  //           .getBytes(order: img.ChannelOrder.abgr)
  //           .buffer
  //           .asInt32List());
  //   var bitmap = BinaryBitmap(GlobalHistogramBinarizer(source));
  //   var reader = QRCodeReader();
  //   var result = reader.decode(bitmap);
  //   return result.text;
  // }

  final MobileScannerController mobileScannerController =
      MobileScannerController(
          torchEnabled: true,
          useNewCameraSelector: true,
          formats: [BarcodeFormat.qrCode],
          facing: CameraFacing.back,
          detectionTimeoutMs: 1000);

  Barcode? _barcode;

  get barcode => _barcode;

  set setbarcode(value) {
    _barcode = value;
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    _barcode = barcodes.barcodes.firstOrNull;
    update();
  }

  @override
  void onInit() {
    mobileScannerController.barcodes.listen(_handleBarcode);
    unawaited(mobileScannerController.start());
    super.onInit();
  }

  @override
  void onClose() {
    _barcode = null;
    super.onClose();
  }
}
