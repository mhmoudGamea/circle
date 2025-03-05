import 'city_model.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneCode;
  final String phone;
  final String image;
  final int points;
  final String invitationCode;
  final int cityId;
  final City city;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneCode,
    required this.phone,
    required this.image,
    required this.points,
    required this.invitationCode,
    required this.cityId,
    required this.city,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneCode: json['phone_code'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      invitationCode: json['invitation_code'],
      cityId: json['city_id'],
      city: City.fromJson(json['city']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone_code': phoneCode,
      'phone': phone,
      'image': image,
      'points': points,
      'invitation_code': invitationCode,
      'city_id': cityId,
      'city': city.toJson(),
    };
  }
}
