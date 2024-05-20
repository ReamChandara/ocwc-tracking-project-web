// ignore_for_file: avoid_print
import 'dart:async';

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
  late final MobileScannerController mobileScanner = MobileScannerController(
    torchEnabled: false,
    detectionSpeed: DetectionSpeed.unrestricted,
    formats: [
      BarcodeFormat.qrCode,
    ],
    detectionTimeoutMs: 1000,
  );

  void _handleBarcode(BarcodeCapture barcodes) {
    if (barcodes.barcodes.isEmpty) {
    } else {
      _subscription.cancel();
      findWorker(barcodes.barcodes.first.displayValue!);
      update();
    }
  }

  void startScanning() {
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
      showImageOnWidget(result);
      scanQrCodeFromImage();
    }
  }

  void switchCamera() async {
    await mobileScanner.switchCamera();
  }

  void scanQrCodeFromImage() async {
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
          findWorker(temp.symbols.first.data ?? "");
          update();
        }
      }
    } else if (response.statusCode == 400) {
      qrValid.value = 'validQR'.tr;
    }
  }

  void findWorker(String qrData) async {
    String validUrl = "/profile?id";
    if (!qrData.contains(validUrl)) {
      qrValid.value = 'validQR'.tr;
    } else {
      List<String> hashCodes = qrData.split("=");
      print("have data : ${hashCodes[1]}");
      var data =
          await Get.toNamed(Routes.detail, parameters: {"id": hashCodes[1]});
      if (data == null) {
      } else {
        startScanning();
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
    startScanning();
    super.onInit();
  }

  @override
  void onClose() async {
    print("close");
    stopScan();
    super.onClose();
  }
}
