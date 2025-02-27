import 'package:shared_project/features/auth/data/models/user_model.dart';

class LoginResponse {
  final String accessToken;
  final UserModel user;

  LoginResponse({
    required this.accessToken,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}