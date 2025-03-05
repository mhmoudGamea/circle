import 'data_model.dart';

class LoginModel {
  final Data data;
  final String message;
  final int code;

  LoginModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      data: Data.fromJson(json['data']),
      message: json['message'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'message': message,
      'code': code,
    };
  }
}
