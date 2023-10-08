class ErrorMessageModel {
  final int statusCode;
  final String statusMessage;
  final bool success;

  ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success'],
      );
}
