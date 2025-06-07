import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:routus_clean/features/auth/data/models/user_model.dart';

class PreferencesHelper {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  Future<bool> get isLoggedIn async => await getUser() != null;

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> saveUser(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(userModel.toJson());
    await prefs.setString(_userKey, jsonString);
  }

  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;

    try {
      final jsonMap = json.decode(jsonString);
      return UserModel.fromJson(jsonMap);
    } catch (_) {
      return null;
    }
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
