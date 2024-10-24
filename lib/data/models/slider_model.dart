import 'package:e_commerce_app/data/models/slider_data_model.dart';

class SliderModel {
  String? msg;
  List<SliderDataModel>? sliderList;

  SliderModel({this.msg, this.sliderList});

  SliderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderList = <SliderDataModel>[];
      json['data'].forEach((v) {
        sliderList!.add(SliderDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (sliderList != null) {
      data['data'] = sliderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
