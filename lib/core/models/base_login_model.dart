class BaseLoginModel {
  final String phoneCode;
  final String phoneNumber;

  BaseLoginModel({
    required this.phoneCode,
    required this.phoneNumber,
  });

  factory BaseLoginModel.fromJson(Map<String, dynamic> json) {
    return BaseLoginModel(
      phoneCode: json['phone_code'],
      phoneNumber: json['phone'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone_code': phoneCode,
      'phone': phoneNumber,
    };
  }
}
