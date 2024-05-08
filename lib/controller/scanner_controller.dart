// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image/image.dart' as img;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:zxing2/qrcode.dart' hide BarcodeFormat;
import 'package:http/http.dart' as http;
import '../config/routes/app_route.dart';
import '../models/qr_scan_data.dart';

class ScannerController extends GetxController {
  PlatformFile? file;
  RxString qrValid = "".obs;

  final MobileScannerController mobileScannerController =
      MobileScannerController(
    torchEnabled: true,
    useNewCameraSelector: true,
    formats: [BarcodeFormat.qrCode],
    facing: CameraFacing.back,
    detectionTimeoutMs: 1000,
  );

  Barcode? _barcode;

  get barcode => _barcode;

  set setbarcode(value) {
    _barcode = value;
  }

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result == null) {
      return;
    } else {
      showImageOnWidget(result);
      scanQrCodeFromImage();
    }
  }

  void scanQrCodeFromImage() async {
    qrValid.value = "Scanning please wait...";
    String apiUrl = "https://api.qrserver.com/v1/read-qr-code/";
    final MultipartRequest request = http.MultipartRequest(
      "POST",
      Uri.parse(apiUrl),
    );
    final headers = {
      "Content-Type": "multipart/form-data",
    };
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile.fromBytes(
      'file',
      file!.bytes!,
      filename: file!.name,
    ));
    final response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      var steam = await http.Response.fromStream(response);
      qrValid.value = "";
      var qrData = parseQRDataFromJson(steam.body);
      for (var temp in qrData) {
        if (temp.symbols.first.data == null) {
          qrValid.value = temp.symbols.first.error ?? "";
        } else {
          file = null;
          routeToDetail(temp.symbols.first.data ?? "");
          update();
        }
      }
    } else if (response.statusCode == 400) {
      qrValid.value = 'validQR'.tr;
    }
  }

  void routeToDetail(String qrData) {
    String validUrl = "/profile?id";
    if (!qrData.contains(validUrl)) {
      qrValid.value = 'validQR'.tr;
    } else {
      List<String> hashCodes = qrData.split("=");
      print("have data : ${hashCodes[1]}");
      Get.toNamed(Routes.detail, parameters: {"id": hashCodes[1]});
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

  void _handleBarcode(BarcodeCapture barcodes) {
    _barcode = barcodes.barcodes.firstOrNull;
    if (_barcode == null) {
    } else {
      routeToDetail(_barcode!.displayValue!);
    }
  }

  void startScan() {
    mobileScannerController.barcodes.listen(_handleBarcode);
    unawaited(mobileScannerController.start());
  }

  @override
  void onReady() {
    print("ready");
    startScan();
    super.onReady();
  }

  @override
  void onClose() {
    _barcode = null;
    unawaited(mobileScannerController.stop());
    super.onClose();
  }
}
