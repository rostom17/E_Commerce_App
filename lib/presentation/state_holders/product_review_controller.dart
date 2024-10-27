import 'package:e_commerce_app/data/models/network_response.dart';
import 'package:e_commerce_app/data/models/product_review_data_model.dart';
import 'package:e_commerce_app/data/models/product_review_model.dart';
import 'package:e_commerce_app/data/services/network_callers.dart';
import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:get/get.dart';

class ProductReviewController extends GetxController {
  bool productReviewInProgress = false;
  bool isSuccessful = false;
  List<ProductReviewDataModel> _productReviewList = [];

  Future<bool> productReviewRequest (String productId) async {
    productReviewInProgress = true;
    update();

    NetworkResponse response = await NetworkCallers.getRequest(Urls.productReview+productId);

    productReviewInProgress = false;
    update();

    if(response.isSuccessful) {
      ProductReviewModel productReviewModel = ProductReviewModel.fromJson(response.responseData);
      _productReviewList = productReviewModel.data ?? [];
      isSuccessful = true;
    } else {
      isSuccessful = false;
    }
    return isSuccessful;
  }

  List<ProductReviewDataModel> get reviewList => _productReviewList;
  int get reviewListLength => _productReviewList.length;
}