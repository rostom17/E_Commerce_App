import 'package:e_commerce_app/data/models/wish_list_data_model.dart';

class WishListModel {
  String? msg;
  List<WishListDataModel>? data;

  WishListModel({this.msg, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <WishListDataModel>[];
      json['data'].forEach((v) {
        data!.add(new WishListDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
