class BaseSignupModel {
  final String firstName;
  final String lastName;
  final String phoneCode;
  final String phoneNumber;
  final String cityId;
  final String? image;
  final String? invitationCode;

  BaseSignupModel({
    required this.firstName,
    required this.lastName,
    required this.phoneCode,
    required this.phoneNumber,
    required this.cityId,
    this.image,
    this.invitationCode,
  });

  factory BaseSignupModel.fromJson(Map<String, dynamic> json) {
    return BaseSignupModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneCode: json['phone_code'],
      phoneNumber: json['phone'],
      cityId: json['city_id'],
      image: json['image'],
      invitationCode: json['invitation_code'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_code': phoneCode,
      'phone': phoneNumber,
      'city_id': cityId,
      'image': image,
      'invitation_code': invitationCode,
    };
  }
}
