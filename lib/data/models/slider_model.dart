import 'package:e_commerce_app/data/models/slider_data_model.dart';

class SliderModel {
  int? code;
  String? status;
  String? msg;
  SliderAdditionalDataModel? data;

  SliderModel({this.code, this.status, this.msg, this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null
        ? SliderAdditionalDataModel.fromJson(json['data'])
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

class SliderAdditionalDataModel {
  List<SliderDataModel>? results;
  int? total;
  dynamic firstPage;
  dynamic previous;
  dynamic next;
  dynamic lastPage;

  SliderAdditionalDataModel(
      {this.results,
      this.total,
      this.firstPage,
      this.previous,
      this.next,
      this.lastPage});

  SliderAdditionalDataModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <SliderDataModel>[];
      json['results'].forEach((v) {
        results!.add(SliderDataModel.fromJson(v));
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
