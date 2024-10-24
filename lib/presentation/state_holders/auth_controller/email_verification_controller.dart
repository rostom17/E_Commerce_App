import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  String? msg;
  String? data;

  bool emailVerificationInProgress = false;
  bool isSuccessful = false;
  String? _errorMessage;

  Future<bool> emailVerificationRequest(String email) async {
    emailVerificationInProgress = true;
    update();

    NetworkResponse response =
        await NetworkCallers.getRequest(Urls.emailVerificationURL + email);

    if (response.isSuccessful) {
      isSuccessful = true;
      _errorMessage = null;

      msg = response.responseData['msg'];
      if(msg == "fail") {
        emailVerificationInProgress = false;
        update();
        _errorMessage = "Server has ran into some trouble! Please Try again Letter";
        return false;
      }
      if(response.responseData['data'] != null) {
        data = response.responseData['data'];
      }
    } else {
      isSuccessful = false;
      _errorMessage = response.errorMessage;
    }

    emailVerificationInProgress = false;
    update();

    return isSuccessful;
  }

  String? get errorMessage => _errorMessage;
  String? get receivedData => data;
}
