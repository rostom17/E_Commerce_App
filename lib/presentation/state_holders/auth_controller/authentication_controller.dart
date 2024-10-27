import 'dart:convert';
import 'package:e_commerce_app/data/models/user_models/user_details_data_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  UserDetailsDataModel? userData;
  final String _userDataKey = "user-data";
  String? accessToken;
  final String _tokenKey = 'access-token';

  Future<void> saveAccessToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    accessToken = token;
  }

  Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString(_tokenKey);
    accessToken = token;
    return accessToken;
  }

  bool isLoggedIn() {
    if (accessToken != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_tokenKey);
    await sharedPreferences.remove(_userDataKey);
    userData = null;
    accessToken = null;
  }

  Future<void> saveUserData(UserDetailsDataModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(
        _userDataKey, jsonEncode(userModel.toJson()));
    userData = userModel;
  }

  Future<UserDetailsDataModel?> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString(_userDataKey);
    if (data != null) {
      UserDetailsDataModel userDataModel =
          UserDetailsDataModel.fromJson(jsonDecode(data));
      return userDataModel;
    } else {
      return null;
    }
  }
}
