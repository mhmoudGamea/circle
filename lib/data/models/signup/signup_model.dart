import 'data_model.dart';

class SignupModel {
  final Data data;
  final String message;
  final int code;

  SignupModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
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
