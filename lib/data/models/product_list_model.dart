import 'package:e_commerce_app/data/models/product_list_data_model.dart';

class ProductListModel {
  String? msg;
  List<ProductListDataModel>? productList;

  ProductListModel({this.msg, this.productList});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productList = <ProductListDataModel>[];
      json['data'].forEach((v) {
        productList!.add(ProductListDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (productList != null) {
      data['data'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
