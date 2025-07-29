import 'package:e_commerce_app/data/models/user_models/login_model.dart';
import 'package:e_commerce_app/data/services/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/services/secure_storage_service.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  int statusCode = -1;
  String? msg;
  String? data;

  bool emailVerificationInProgress = false;
  bool isSuccessful = false;
  String? _errorMessage;

  Future<bool> loginRequest(
      {required String email, required String password}) async {
    emailVerificationInProgress = true;
    update();

    NetworkResponse response = await NetworkCallers.postRequest(
        Urls.loginURL, null, {"email": email, "password": password});

    if (response.isSuccessful) {
      isSuccessful = true;
      _errorMessage = null;

      msg = response.responseData['msg'];
      statusCode = response.statusCode;

      LoginModel loginModel = LoginModel.fromJson(response.responseData);

      if (loginModel.data != null) {
        final token = loginModel.data!.token;
        final user = loginModel.data!.user;

        if (token != null && user != null) {
          SecureStorageService.storeAuthCredentials(
            token: token,
          );
          SecureStorageService.saveUserData(user);
          print(token);
        }
      }
    } else {
      isSuccessful = false;
      statusCode = response.statusCode;
      _errorMessage = response.errorMessage;
      print("$statusCode");
    }

    emailVerificationInProgress = false;
    update();

    return isSuccessful;
  }

  String? get errorMessage => _errorMessage;
  String? get receivedData => data;
}
