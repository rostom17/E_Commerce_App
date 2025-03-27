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
        sliderList!.add(new SliderDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.sliderList != null) {
      data['data'] = this.sliderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
