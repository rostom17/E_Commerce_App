import 'package:e_commerce_app/data/models/network_response.dart';
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
        await NetworkCallers.getRequest(Urls.productListByRemark_Popular_URL);
    NetworkResponse networkResponseNew =
        await NetworkCallers.getRequest(Urls.productListByRemark_New_URL);
    NetworkResponse networkResponseRegular =
        await NetworkCallers.getRequest(Urls.productListByRemark_Regular_URL);

    if(networkResponsePopular.isSuccessful) {
      isFetchDataSuccessful = true;
      ProductListModel productListModel = ProductListModel.fromJson(networkResponsePopular.responseData);
      _productListPopular = productListModel.productList ?? [];
    }

    if(networkResponseNew.isSuccessful) {
      isFetchDataSuccessful = true;
      ProductListModel productListModel = ProductListModel.fromJson(networkResponsePopular.responseData);
      _productListNew = productListModel.productList ?? [];
    }

    if(networkResponseRegular.isSuccessful) {
      isFetchDataSuccessful = true;
      ProductListModel productListModel = ProductListModel.fromJson(networkResponsePopular.responseData);
      _productListRegular = productListModel.productList ?? [];
    }

    getProductListRequestInProgress = false;
    update();

    return isFetchDataSuccessful;
  }

  List<ProductListDataModel> get productListPopular => _productListPopular;
  List<ProductListDataModel> get productListNew => _productListNew;
  List<ProductListDataModel> get productListRegular => _productListRegular;
}
