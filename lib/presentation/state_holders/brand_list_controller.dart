import 'package:e_commerce_app/data/models/brand_list_data_model.dart';
import 'package:e_commerce_app/data/models/brand_list_model.dart';
import 'package:e_commerce_app/data/services/network_response.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class BrandListController extends GetxController {
  List<BrandListDataModel> _brandList = [];
  String? _errorMessage;
  bool getBrandListInProgress = false;
  bool dataFetchIsSuccessful = false;

  Future<bool> getBrandListRequest() async {
    getBrandListInProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCallers.getRequest(Urls.brandListURL);

    if (networkResponse.isSuccessful) {
      BrandListModel brandListModel =
          BrandListModel.fromJson(networkResponse.responseData);

      if (brandListModel.data != null && brandListModel.data!.results != null) {
        _brandList = brandListModel.data!.results!;
      }

      dataFetchIsSuccessful = true;
      _errorMessage = null;
    } else {
      _errorMessage = networkResponse.errorMessage;
      dataFetchIsSuccessful = false;
    }

    getBrandListInProgress = false;
    update();
    return dataFetchIsSuccessful;
  }

  List<BrandListDataModel> get brandList => _brandList;

  String? get errorMessage => _errorMessage;
}
