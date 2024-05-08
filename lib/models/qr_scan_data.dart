import 'dart:convert';

List<QRScanData> parseQRDataFromJson(String json) {
  return List.from(jsonDecode(json).map((e) => QRScanData.fromJson(e)));
}

class QRScanData {
  final String type;
  final List<Symbol> symbols;

  QRScanData({required this.type, required this.symbols});

  factory QRScanData.fromJson(Map<String, dynamic> json) {
    return QRScanData(
      type: json["type"],
      symbols: List<Symbol>.from(json['symbol'].map((e) => Symbol.fromJson(e))),
    );
  }
}

class Symbol {
  final int seq;
  final String? data;
  final String? error;

  Symbol({required this.seq, required this.data, required this.error});

  factory Symbol.fromJson(Map<String, dynamic> json) {
    return Symbol(
      seq: json["seq"],
      data: json['data'],
      error: json['error'],
    );
  }
}
