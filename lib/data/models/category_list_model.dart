import 'package:e_commerce_app/data/models/category_list_data_model.dart';

class CategoryListModel {
  String? msg;
  List<CategoryListDataModel>? categoryList;

  CategoryListModel({this.msg, this.categoryList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryList = <CategoryListDataModel>[];
      json['data'].forEach((v) {
        categoryList!.add(CategoryListDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (categoryList != null) {
      data['data'] = categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
