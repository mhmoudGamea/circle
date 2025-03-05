class FailureModel {
  final String? data;
  final String message;
  final int code;

  FailureModel({
    this.data,
    required this.message,
    required this.code,
  });

  factory FailureModel.fromJson(Map<String, dynamic> json) {
    return FailureModel(
      data: json['data'] ?? '',
      message: json['message'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'message': message,
      'code': code,
    };
  }
}
