import 'package:e_commerce_app/data/models/cart_list_data_model.dart';

class CartListModel {
  String? msg;
  List<CartListDataModel>? data;

  CartListModel({this.msg, this.data});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CartListDataModel>[];
      json['data'].forEach((v) {
        data!.add(CartListDataModel.fromJson(v));
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
