import 'package:e_commerce_app/data/models/category_list_data_model.dart';

class CategoryListModel {
  int? code;
  String? status;
  String? msg;
  CategoryListAditionalDataModel? data;

  CategoryListModel({this.code, this.status, this.msg, this.data});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null
        ? CategoryListAditionalDataModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CategoryListAditionalDataModel {
  List<CategoryListDataModel>? results;
  int? total;
  dynamic firstPage;
  dynamic previous;
  int? next;
  int? lastPage;

  CategoryListAditionalDataModel(
      {this.results,
      this.total,
      this.firstPage,
      this.previous,
      this.next,
      this.lastPage});

  CategoryListAditionalDataModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <CategoryListDataModel>[];
      json['results'].forEach((v) {
        results!.add(CategoryListDataModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['first_page'] = firstPage;
    data['previous'] = previous;
    data['next'] = next;
    data['last_page'] = lastPage;
    return data;
  }
}

