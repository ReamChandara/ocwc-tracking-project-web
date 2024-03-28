class ValidationMessage {
  String? message;

  final MessageData data;
  ValidationMessage({required this.message, required this.data});

  factory ValidationMessage.fromJson(Map<String, dynamic> json) {
    return ValidationMessage(
      message: json['message'],
      data: MessageData.fromJson(json['data']),
    );
  }
}

class MessageData {
  final List<dynamic>? fullName;
  final List<dynamic>? dob;

  MessageData({required this.fullName, required this.dob});

  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      fullName: json['full_name'] == null ? null : List.from(json['full_name']),
      dob: json['dob'] == null ? null : List.from(json['dob']),
    );
  }
}
