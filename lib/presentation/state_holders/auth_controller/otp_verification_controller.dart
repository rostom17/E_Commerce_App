import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  String? msg;
  String? token;

  bool optVerificationInProgress = false;
  bool isSuccessful = false;
  String? _errorMessage;

  Future<bool> otpVerificationRequest (String email, String otp) async {
    optVerificationInProgress = true;
    update();

    NetworkResponse response = await NetworkCallers.getRequest("${Urls.otpVerificationURL}$email/$otp");

    if(response.isSuccessful) {
      isSuccessful = true;
      _errorMessage = null;
      msg = response.responseData['msg'];
      if(msg == 'fail') {
        _errorMessage = "Server has ran into some trouble! Please Try again Letter";

        optVerificationInProgress = false;
        update();
        return false;
      }
      token = response.responseData['data'];
    }
    else {
      isSuccessful = false;
      _errorMessage = response.errorMessage;
    }

    optVerificationInProgress = false;
    update();

    return isSuccessful;
  }

  String? get errorMessage => _errorMessage;


}