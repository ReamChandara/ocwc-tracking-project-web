// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import '../config/routes/app_route.dart';
import '../models/qr_scan_data.dart';

enum ScaningType { scanQr, scanImage }

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

  void _handleBarcode(BarcodeCapture barcodes) {
    print("scanning");
    _barcode = barcodes.barcodes.firstOrNull;
    if (_barcode == null) {
    } else {
      routeToDetail(_barcode!.displayValue!);
    }
  }

  void startScan() async {
    print("start");
    mobileScannerController.start();
    mobileScannerController.barcodes.listen(_handleBarcode);
    update();
  }

  void stopScan() async {
    await mobileScannerController.dispose();
    _barcode = null;
    update();
  }

  void pickImage() async {
    await mobileScannerController.stop();
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

  void setImageToNull() {
    startScan();
    file = null;
    update();
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
          qrValid.value = 'validQR'.tr;
        } else {
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
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => Get.toNamed(Routes.detail, parameters: {"id": hashCodes[1]}));
      // Get.toNamed(Routes.detail, parameters: {"id": hashCodes[1]});
    }
  }

  void showImageOnWidget(FilePickerResult pickerResult) {
    file = pickerResult.files.first;
    update();
  }

  @override
  void onInit() {
    //startScan();
    super.onInit();
  }

  @override
  void onClose() async {
    print("close");
    // stopScan();
    super.onClose();
  }
}
