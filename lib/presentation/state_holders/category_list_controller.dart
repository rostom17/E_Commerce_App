import 'package:e_commerce_app/data/models/category_list_data_model.dart';
import 'package:e_commerce_app/data/models/category_list_model.dart';
import 'package:e_commerce_app/data/services/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool getCategoryListInProgress = false;
  String? _errorMessage ;
  bool dataFetchIsSuccessful = false;

  List<CategoryListDataModel> _categoryList = [];

  Future<bool> getCategoryList () async {
    getCategoryListInProgress = true;
    update();

    NetworkResponse networkResponse = await NetworkCallers.getRequest(Urls.categoryListURL);

    if(networkResponse.isSuccessful) {
      CategoryListModel categoryListModel = CategoryListModel.fromJson(networkResponse.responseData);
      _categoryList =categoryListModel.categoryList ?? [];
      dataFetchIsSuccessful = true;
    }
    else {
      _errorMessage = networkResponse.errorMessage;

    }

    getCategoryListInProgress = false;
    update();

    return dataFetchIsSuccessful;
  }

  String? get errorMessage => _errorMessage;

  List<CategoryListDataModel> get categoryList => _categoryList;

}