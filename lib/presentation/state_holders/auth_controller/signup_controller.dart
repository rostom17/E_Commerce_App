import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/services/network_response.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  int statusCode = -1;
  String? msg;
  String? data;

  bool signupInProgress = false;
  bool isSuccessful = false;
  String? _errorMessage;

  Future<bool> signUpRequest({required Map<String, dynamic> requstBody}) async {
    signupInProgress = true;
    update();

    NetworkResponse response =
        await NetworkCallers.postRequest(Urls.signUpURL, null, requstBody);

    if (response.isSuccessful) {
      isSuccessful = true;
      _errorMessage = null;

      msg = response.responseData['msg'];
      statusCode = response.statusCode;
      
    } else {
      isSuccessful = false;
      statusCode = response.statusCode;
      _errorMessage = response.errorMessage;
      print("$statusCode");
    }

    signupInProgress = false;
    update();

    return isSuccessful;
  }

  String? get errorMessage => _errorMessage;
  String? get receivedData => data;
}
