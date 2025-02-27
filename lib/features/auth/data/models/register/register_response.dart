import 'package:shared_project/features/auth/data/models/user_model.dart';

class RegisterResponse {
  final String accessToken;
  final String tokenType;
  final UserModel user;

  RegisterResponse({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
