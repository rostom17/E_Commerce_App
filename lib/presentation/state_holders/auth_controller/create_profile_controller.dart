import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/user_models/create_profile_model.dart';
import 'package:e_commerce_app/data/models/user_models/user_details_model.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/read_profile_controller.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  final _controller = Get.find<AuthenticationController>();
  bool createProfileInProgress = false;
  bool isSuccessful = false;

  Future<bool> createProfileRequest (String token, Map<String, dynamic> body) async {
    createProfileInProgress = true;
    update();

    NetworkResponse response = await NetworkCallers.postRequest(Urls.createProfileURL, token, body);

    createProfileInProgress = false;
    update();

    if(response.isSuccessful) {
      isSuccessful = true;
      await Get.find<ReadProfileController>().readProfileRequest(token);
      // await _controller.saveAccessToken(token);
      // await _controller.saveUserData(userModel.userData!);
    }
    else {
      isSuccessful = false;
    }
    return isSuccessful;
  }
}