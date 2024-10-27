import 'package:e_commerce_app/data/models/product_review_data_model.dart';

class ProductReviewModel {
  String? msg;
  List<ProductReviewDataModel>? data;

  ProductReviewModel({this.msg, this.data});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductReviewDataModel>[];
      json['data'].forEach((v) {
        data!.add(ProductReviewDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
