import 'package:e_commerce_app/data/services/network_response.dart';
import 'package:e_commerce_app/data/models/product_list_data_model.dart';
import 'package:e_commerce_app/data/models/product_list_model.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool getProductListRequestInProgress = false;
  List<ProductListDataModel> _productListNew = [];
  List<ProductListDataModel> _productListPopular = [];
  List<ProductListDataModel> _productListRegular = [];
  String? _errorMessage;
  bool isFetchDataSuccessful = false;

  Future<bool> getProductList() async {
    getProductListRequestInProgress = true;
    update();

    NetworkResponse networkResponsePopular =
        await NetworkCallers.getRequest(Urls.productListByRemarkPopularURL);
    NetworkResponse networkResponseNew =
        await NetworkCallers.getRequest(Urls.productListByRemarkNewURL);
    NetworkResponse networkResponseRegular =
        await NetworkCallers.getRequest(Urls.productListByRemarkRegularURL);

    if (networkResponsePopular.isSuccessful) {
      isFetchDataSuccessful = true;
      ProductListModel productListModel =
          ProductListModel.fromJson(networkResponsePopular.responseData);
      _productListPopular = productListModel.productList ?? [];
    } else {
      _errorMessage = networkResponsePopular.errorMessage;
    }

    if (networkResponseNew.isSuccessful) {
      isFetchDataSuccessful = true;
      ProductListModel productListModel =
          ProductListModel.fromJson(networkResponseNew.responseData);
      _productListNew = productListModel.productList ?? [];
    } else {
      _errorMessage =
          "$_errorMessage.\nNew: ${networkResponseNew.errorMessage}";
    }

    if (networkResponseRegular.isSuccessful) {
      isFetchDataSuccessful = true;
      ProductListModel productListModel =
          ProductListModel.fromJson(networkResponseRegular.responseData);
      _productListRegular = productListModel.productList ?? [];
    } else {
      _errorMessage =
          "$_errorMessage. \n Regular: ${networkResponseRegular.errorMessage}";
    }

    getProductListRequestInProgress = false;
    update();

    return isFetchDataSuccessful;
  }

  List<ProductListDataModel> get productListPopular => _productListPopular;
  List<ProductListDataModel> get productListNew => _productListNew;
  List<ProductListDataModel> get productListRegular => _productListRegular;

  String? get errorMessage => _errorMessage;
}
