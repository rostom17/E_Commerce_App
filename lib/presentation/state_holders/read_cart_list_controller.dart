import 'package:e_commerce_app/data/models/cart_list_data_model.dart';
import 'package:e_commerce_app/data/models/cart_list_model.dart';
import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class ReadCartListController extends GetxController {
  bool isSuccessful = false;
  bool readCartListInProgress = false;
  List<CartListDataModel> _cartList = [];

  Future<bool> readCartListRequest (String token) async {
    readCartListInProgress = true;
    update();

    NetworkResponse response = await NetworkCallers.getRequest(Urls.readCartList, token: token);

    readCartListInProgress = true;
    update();

    if(response.isSuccessful) {
      isSuccessful = true;
      CartListModel  cartListModel = CartListModel.fromJson(response.responseData);
      _cartList = cartListModel.data ?? [];
    }
    else {
      isSuccessful = false;
    }

    return isSuccessful;
  }

  List<CartListDataModel> get cartList => _cartList;
  int get cartListSize => _cartList.length;

  int totalPrice () {
    int tp = 0;
    for(int i=0; i<_cartList.length; i++) {
      int? val = int.tryParse(_cartList[i].price!);
      tp += val ?? 0;
    }
    return tp;
  }
}