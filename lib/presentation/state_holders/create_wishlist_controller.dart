import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:get/get.dart';

class CreateWishListController extends GetxController {
  bool _isFav = false;

  bool get isFav => _isFav;

  void toggle () {
    _isFav = !_isFav;
  }
  
  bool isSuccess = false ;
  bool createWishListInProgress = false;
  
  Future<bool> createWishListRequest (String id) async {
    createWishListInProgress = true;
    update();

    String token = Get.find<AuthenticationController>().accessToken!;
    NetworkResponse response = await NetworkCallers.getRequest("${Urls.createWishList}$id", token: token);

    createWishListInProgress = false;
    update();

    if(response.isSuccessful) {
      isSuccess = true;
      // toggle();
    }
    else {
      isSuccess = false;
    }
    
    return isSuccess;
  }
}