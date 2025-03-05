import 'auth_login.dart';
import 'user_model.dart';

class Data {
  final User user;
  final Auth auth;

  Data({
    required this.user,
    required this.auth,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      auth: Auth.fromJson(json['auth']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'auth': auth.toJson(),
    };
  }
}
