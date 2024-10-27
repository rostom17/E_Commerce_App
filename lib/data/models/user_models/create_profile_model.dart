import 'package:e_commerce_app/data/models/user_models/create_profile_user_data_model.dart';

class CreateProfileModel {
  String? msg;
  CreateProfileUserDataModel? data;

  CreateProfileModel({this.msg, this.data});

  CreateProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? CreateProfileUserDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
