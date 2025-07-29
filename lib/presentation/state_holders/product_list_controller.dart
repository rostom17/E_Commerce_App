import 'package:e_commerce_app/data/models/product_details_model.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/data/services/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/services/secure_storage_service.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  bool getProductListRequestInProgress = false;
  List<ProductDetailsModel> _productList = [];

  String? _errorMessage;
  late bool isFetchDataSuccessful;
  late int _statusCode;

  Future<bool> getProductList() async {
    getProductListRequestInProgress = true;
    update();

    NetworkResponse response = await NetworkCallers.getRequest(Urls.productsURL,
        token: await SecureStorageService.getAccessToken());

    if (response.isSuccessful) {
      ProductModel productModel = ProductModel.fromJson(response.responseData);
      if (productModel.data != null && productModel.data!.results != null) {
        _productList = productModel.data!.results ?? [];
      }
      isFetchDataSuccessful = true;
      _statusCode = response.statusCode;
    } else {
      isFetchDataSuccessful = false;
      _errorMessage = response.errorMessage;
      _statusCode = response.statusCode;
    }

    getProductListRequestInProgress = false;
    update();

    return isFetchDataSuccessful;
  }

  List<ProductDetailsModel> get productList => _productList;

  String? get errorMessage => _errorMessage;
  int get statusCode => _statusCode;
}
