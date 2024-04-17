// ignore_for_file: avoid_print

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart' hide Barcode;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scanning_effect/scanning_effect.dart';

class ScanQRScreen extends StatefulWidget {
  const ScanQRScreen({super.key});

  @override
  State<ScanQRScreen> createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen>
    with SingleTickerProviderStateMixin {
  Uint8List? image;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result == null) {
    } else {
      image = result.files.first.bytes;
      decodeQrCode(image!);
    }
  }

  Future<void> decodeQrCode(Uint8List bytes) async {
    try {
    
    } catch (e) {
      print('Error decoding QR code: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Color overlayColour = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: 600,
            height: Get.height * 0.90,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[100]!,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.grey[100]!,
                  offset: const Offset(0.5, 0.5),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  "Please put your card to scan your information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        width: 350,
                        height: 200,
                      ),
                      image != null
                          ? Container(
                              width: 330,
                              height: 190,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: MemoryImage(image!),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )
                          : Positioned(
                              child: Container(
                                width: 330,
                                height: 190,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MobileScanner(
                                  onDetect: (capture) {
                                    final List<Barcode> barcodes =
                                        capture.barcodes;
                                    for (final barcode in barcodes) {
                                      debugPrint(
                                        'Barcode found! ${barcode.rawValue}',
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                      Positioned(
                        top: 10,
                        child: SizedBox(
                          width: 330,
                          height: 180,
                          child: ScanningEffect(
                            scanningLinePadding: const EdgeInsets.all(0),
                            scanningColor: Colors.blue,
                            borderLineColor: Colors.blue,
                            delay: const Duration(seconds: 1),
                            duration: const Duration(seconds: 2),
                            child: Container(
                              width: 330,
                              height: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    pickFiles();
                  },
                  icon: const Icon(Icons.upload_file),
                  label: const Text(
                    "Upload Card",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
