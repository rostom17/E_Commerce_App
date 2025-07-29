import 'package:e_commerce_app/data/models/user_models/login_model.dart';
import 'package:e_commerce_app/data/services/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/services/secure_storage_service.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  String? msg;
  String? token;
  late bool isSuccessful;
  int _statusCode = -1;

  bool optVerificationInProgress = false;

  String? _errorMessage;

  Future<bool> otpVerificationRequest(
      {required String email, required String otp}) async {
    optVerificationInProgress = true;
    update();

    Map<String, String> body = {"email": email, "otp": otp};

    NetworkResponse response =
        await NetworkCallers.postRequest(Urls.otpVerificationURL, null, body);

    if (response.isSuccessful) {
      _errorMessage = null;
      msg = response.responseData['msg'];
      isSuccessful = true;
      _statusCode = response.statusCode;

      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      if (loginModel.data != null) {
        final token = loginModel.data!.token;
        final user = loginModel.data!.user;

        if (token != null && user != null) {
          SecureStorageService.storeAuthCredentials(token: token);
          SecureStorageService.saveUserData(user);
          print(token);
        }
      }
    } else {
      _errorMessage = response.errorMessage;
      isSuccessful = false;
      _statusCode = response.statusCode;
    }

    optVerificationInProgress = false;
    update();
    return isSuccessful;
  }

  String? get errorMessage => _errorMessage;

  String? get accessToken => token;

  int get statusCode => _statusCode;
}
