import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/wish_list_data_model.dart';
import 'package:e_commerce_app/data/models/wish_list_model.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:get/get.dart';

class ReadWishListController extends GetxController {
  bool isSuccessful = false;
  bool readWishListInProgress = false;
  List<WishListDataModel> _wishList = [];

  Future<bool> readWishListRequest () async {
    readWishListInProgress = true;
    update();
    String token = Get.find<AuthenticationController>().accessToken!;
    NetworkResponse response = await NetworkCallers.getRequest(Urls.readWishList, token: token);
    if(response.isSuccessful) {
      isSuccessful = true;
      WishListModel wishListModel = WishListModel.fromJson(response.responseData);
      _wishList = wishListModel.data ?? [];
    }
    else {
      isSuccessful = false;
    }

    return isSuccessful;
  }
  List<WishListDataModel> get wishList => _wishList;
  int get wishListSize => _wishList.length;



}