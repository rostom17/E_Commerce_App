import 'dart:convert';

import 'package:e_commerce_app/data/models/user_models/user_data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SecureStorageService  {
  static const _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(
          accessibility: KeychainAccessibility.first_unlock_this_device));

  static const String _accessTokenKey = "access_token";
  static const String _userDataKey = "current_user";

  static Future<void> storeAuthCredentials({required String token}) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  static Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token == null ? false : true;
  }

  static Future<void> saveUserData(UserData userData) async {
    final userJson = jsonEncode(userData.toJson());
    await _storage.write(key: _userDataKey, value: userJson);
  }

  static Future<UserData?> getUserData() async {
    final userJson = await _storage.read(key: _userDataKey);

    if (userJson == null) return null;

    return UserData.fromJson(jsonDecode(userJson));
  }

  Future<void> deleteUserData() async {
    await _storage.delete(key: _accessTokenKey);

    await _storage.delete(key: _userDataKey);
  }
}
