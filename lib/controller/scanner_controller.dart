// ignore_for_file: avoid_print
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart' hide Image;
import 'package:qr_code_vision/decode/decode_data.dart';
import 'package:qr_code_vision/qr_code_vision.dart';
import '../config/routes/app_route.dart';
import '../models/qr_scan_data.dart';
import 'package:http/http.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;

class ScannerController extends GetxController {
  PlatformFile? file;
  RxString qrValid = "".obs;

  late StreamSubscription<Object?> _subscription;
  late MobileScannerController mobileScanner = MobileScannerController(
    autoStart: true,
    torchEnabled: false,
    // detectionSpeed: DetectionSpeed.unrestricted,
    formats: [
      // BarcodeFormat.qrCode,BarcodeFormat.codebar
      BarcodeFormat.qrCode,
    ],
    detectionTimeoutMs: 1000,
  );

  void _handleBarcode(BarcodeCapture barcodes) {
    if (barcodes.barcodes.isEmpty) {
    } else {
      // print("qr resulf is ${barcodes.barcodes.first.displayValue!}");
      findWorker(
        barcodes.barcodes.first.displayValue!,
        type: Get.parameters['type'],
      );
    }
  }

  void startScanning({String? type}) {
    print("startScanning");
    _subscription = mobileScanner.barcodes.listen(_handleBarcode);
    update();
  }

  void stopScan() async {
    await mobileScanner.dispose();
  }

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result == null) {
      return;
    } else {
      // scanQrCodeFromImage();
      // showImageOnWidget(result);
      // detectImage(result.files.first.bytes!);
      startScanImage(result);
    }
  }

  void switchCamera() async {
    await mobileScanner.switchCamera();
  }

  final qrCode = QrCode();
  QrContent? qrContent;
  QrLocation? qrLocation;
  void startScanImage(FilePickerResult result) async {
    qrValid.value = "scaningmess".tr;
    showImageOnWidget(result);
    // await scanQrCodeFromImage();
    await Future.delayed(const Duration(seconds: 2)).whenComplete(
      () => detectImage(result.files.first.bytes!),
    );
    qrValid.value = "";
    print(qrContent?.text ?? "no qr");
    if (qrContent == null) {
      qrValid.value = 'validQR'.tr;
    } else {
      findWorker(qrContent!.text, type: Get.parameters['type']);
    }
    print("qr valid : ${qrValid.value}");
  }
  // format: ui.ImageByteFormat.rawRgba

  void detectImage(Uint8List bytes) async {
    ui.Image? image = await decodeImageFromList(bytes);
    final byteData = (await image.toByteData())?.buffer.asUint8List();
    qrCode.scanRgbaBytes(byteData!, image.width, image.height);
    // qrCode.scanImageBytes(byteData!);
    print("qr code reader : ${qrCode.content?.text ?? "no qr"}");
    if (qrCode.location == null) {
      print('No QR code found');
    } else {
      if (qrCode.content == null) {
        // print('The content of the QR code could not be decoded');
      } else {
        qrContent = qrCode.content;
      }
    }
  }

  Future<void> scanQrCodeFromImage() async {
    qrValid.value = "scaningmess".tr;
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
      var stream = await http.Response.fromStream(response);
      qrValid.value = "";
      var qrData = parseQRDataFromJson(stream.body);
      for (var temp in qrData) {
        if (temp.symbols.first.data == null) {
          qrValid.value = 'validQR'.tr;
        } else {
          print(temp.symbols.first.data);
          // findWorker(temp.symbols.first.data ?? "");
          update();
        }
      }
    } else if (response.statusCode == 400) {
      qrValid.value = 'validQR'.tr;
    } else if (response.statusCode == 404) {}
  }

  void findWorker(String qrData, {String? type}) async {
    if (type == null) {
      String validUrl = "/profile?id";
      if (!qrData.contains(validUrl)) {
        qrValid.value = 'validQR'.tr;
      } else {
        _subscription.cancel();
        stopScan();
        List<String> hashCodes = qrData.split("=");
        print("have data : ${hashCodes[1]}");
        // var data = await Get.toNamed("/${RouteView.detail.name}",
        //     parameters: {"id": hashCodes[1]});
        await RouteView.detail.go(parameters: {"id": hashCodes[1]});
        // print(data);
        // if (data == null) {
        // } else {
        //   startScanning();
        // }
      }
    } else {
      print("recruiter type");
      print("qr data : $qrData");
      String validUrl = "/recruiter-identify-card?id";
      if (!qrData.contains(validUrl)) {
        qrValid.value = 'validQR'.tr;
      } else {
        _subscription.cancel();
        stopScan();
        List<String> hashCodes = qrData.split("=");
        print("have data : ${hashCodes[1]}");
        RouteView.recruiterDetail.go(parameters: {"hash_id": hashCodes[1]});
      }
    }
  }

  void showImageOnWidget(FilePickerResult pickerResult) {
    file = pickerResult.files.first;
    update();
  }

  void clearImage() {
    file = null;
    update();
  }

  @override
  void onInit() async {
    print(Get.parameters["type"]);
    startScanning();
    super.onInit();
  }

  @override
  void onClose() async {
    // print("close");
    // stopScan();
    super.onClose();
  }
}
