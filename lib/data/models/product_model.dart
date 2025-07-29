import 'package:e_commerce_app/data/models/product_details_model.dart';

class ProductModel {
  int? code;
  String? status;
  String? msg;
  ProductAdditionalModel? data;

  ProductModel({this.code, this.status, this.msg, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null
        ? ProductAdditionalModel.fromJson(json['data'])
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

class ProductAdditionalModel {
  List<ProductDetailsModel>? results;
  int? total;
  dynamic firstPage;
  dynamic previous;
  int? next;
  int? lastPage;

  ProductAdditionalModel(
      {this.results,
      this.total,
      this.firstPage,
      this.previous,
      this.next,
      this.lastPage});

  ProductAdditionalModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <ProductDetailsModel>[];
      json['results'].forEach((v) {
        results!.add(ProductDetailsModel.fromJson(v));
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
