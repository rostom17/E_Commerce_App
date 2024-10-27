import 'package:e_commerce_app/data/models/user_models/user_details_data_model.dart';

class UserDetailsModel {
  String? msg;
  UserDetailsDataModel? userData;

  UserDetailsModel({this.msg, this.userData});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    userData = json['data'] != null ? new UserDetailsDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['msg'] = msg;
    if (userData != null) {
      data['data'] = userData!.toJson();
    }
    return data;
  }
}

