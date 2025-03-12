class ModifyAccountModel {
  final String firstName;
  final String lastName;
  final String? image;

  ModifyAccountModel(
      {this.image, required this.firstName, required this.lastName});

  factory ModifyAccountModel.fromJson(Map<String, dynamic> json) {
    return ModifyAccountModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'image': image,
    };
  }
}
