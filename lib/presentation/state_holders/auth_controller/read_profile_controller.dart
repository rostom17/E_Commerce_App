import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/user_models/user_details_data_model.dart';
import 'package:e_commerce_app/data/models/user_models/user_details_model.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool readProfileInProgress = false;
  String? _errorMessage;
  UserDetailsDataModel? _userDetails;

  Future<int> readProfileRequest (String token) async {
    //0 == unsuccessful
    //1 == successful but data = null
    //2 == successful + data

    int hint = 0;
    readProfileInProgress = true;
    update();

    NetworkResponse response = await NetworkCallers.getRequest(Urls.readProfileURL,token: token);

    readProfileInProgress = false;
    update();

    if(response.isSuccessful) {
      if(response.responseData['data'] == null) {
        hint = 1;
      }
      else {
        hint = 2;
        UserDetailsModel userDetailsModel = UserDetailsModel.fromJson(response.responseData);
        _userDetails = userDetailsModel.userData;
        // await _controller.saveUserData(userModel.userData!);
        Get.find<AuthenticationController>().saveAccessToken(token);
        Get.find<AuthenticationController>().saveUserData(_userDetails!);
      }
    } else {
      hint = 0;
    }

    return hint;
  }

  UserDetailsDataModel? get userData => _userDetails;

}