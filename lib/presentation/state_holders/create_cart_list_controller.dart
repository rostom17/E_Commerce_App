import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class CreateCartListController extends GetxController {
  bool createCartListInProgress = false;
  bool isSuccessful = false;

  Future<bool> createCartListRequest (Map<String, dynamic> body, String token) async {

    createCartListInProgress = true;
    update();

    NetworkResponse response = await NetworkCallers.postRequest(Urls.createCartListURL, token, body);

    createCartListInProgress = false;
    update();

    if(response.isSuccessful) {
      isSuccessful = true;
    }
    else{
      isSuccessful = false;
    }

    return isSuccessful;
  }
}