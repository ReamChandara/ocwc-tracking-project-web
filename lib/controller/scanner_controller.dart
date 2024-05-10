// ignore_for_file: avoid_print

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

  final MobileScannerController mobileScanner = MobileScannerController(
      autoStart: false,
      detectionSpeed: DetectionSpeed.normal,
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
    if (_barcode == null) {
    } else {
      routeToDetail(_barcode!.displayValue!);
    }
  }

  void startScan() async {
    mobileScanner.start();
    mobileScanner.barcodes.listen(_handleBarcode);
  }

  void stopScan() async {
    await mobileScanner.dispose();
    _barcode = null;
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
      mobileScanner.barcodes.listen(_handleBarcode).cancel();
      Get.toNamed(Routes.detail, parameters: {"id": hashCodes[1]});
    }
  }

  void showImageOnWidget(FilePickerResult pickerResult) {
    file = pickerResult.files.first;
    update();
  }

  @override
  void onInit() {
    startScan();
    super.onInit();
  }

  @override
  void onClose() async {
    print("close");
    stopScan();
    super.onClose();
  }
}
