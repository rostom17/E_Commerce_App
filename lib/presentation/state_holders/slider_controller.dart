import 'package:e_commerce_app/data/services/network_response.dart';
import 'package:e_commerce_app/data/models/slider_data_model.dart';
import 'package:e_commerce_app/data/models/slider_model.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  bool sliderListRequestInProgress = false;
  bool dataFetchIsSuccessful = false;
  String? _errorMessage;
  List<SliderDataModel> _sliderList = [];

  Future<bool> getSliderData() async {
    sliderListRequestInProgress = true;
    update();

    NetworkResponse networkResponse =
        await NetworkCallers.getRequest(Urls.sliderProductListURL);

    if (networkResponse.isSuccessful) {
      SliderModel sliderModel =
          SliderModel.fromJson(networkResponse.responseData);

      if (sliderModel.data != null && sliderModel.data!.results != null) {
        _sliderList = sliderModel.data!.results!;
      }
      _errorMessage = null;
      dataFetchIsSuccessful = true;
      //_sliderList = sliderList;
    } else {
      dataFetchIsSuccessful = false;
      _errorMessage = networkResponse.errorMessage;
    }

    sliderListRequestInProgress = false;
    update();

    return dataFetchIsSuccessful;
  }

  String? get errorMessage => _errorMessage;

  List<SliderDataModel> get sliderList => _sliderList;

  int get sliderListLength => sliderList.length;
}
