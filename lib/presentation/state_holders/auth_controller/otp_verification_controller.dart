import 'package:e_commerce_app/data/services/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/read_profile_controller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  String? msg;
  String? token;

  bool optVerificationInProgress = false;

  String? _errorMessage;

  Future<int> otpVerificationRequest (String email, String otp) async {
    int hint = 0;
    // 0 = unsuccessful
    // 1 = successful but profileData = null
    // 2 = successful and has profileData
    optVerificationInProgress = true;
    update();

    NetworkResponse response = await NetworkCallers.getRequest("${Urls.otpVerificationURL}$email/$otp");

    if(response.isSuccessful) {
      _errorMessage = null;
      msg = response.responseData['msg'];
      if(msg == 'fail') {
        _errorMessage = "Server has ran into some trouble! Please Try again Letter";
        return 0;
      } else {
        token = response.responseData['data'];
        int result = await Get.find<ReadProfileController>().readProfileRequest("$token");
        optVerificationInProgress = false;
        update();
        return result;
      }
    }
    else {
      _errorMessage = response.errorMessage;
    }

    optVerificationInProgress = false;
    update();
    return hint;
  }

  String? get errorMessage => _errorMessage;

  String? get accessToken => token;


}