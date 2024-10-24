import 'package:e_commerce_app/data/models/brand_list_data_model.dart';

class BrandListModel {
  String? msg;
  List<BrandListDataModel>? brandList;

  BrandListModel({this.msg, this.brandList});

  BrandListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      brandList = <BrandListDataModel>[];
      json['data'].forEach((v) {
        brandList!.add(new BrandListDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (brandList != null) {
      data['data'] = brandList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
