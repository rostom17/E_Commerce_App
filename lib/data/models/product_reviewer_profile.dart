class ProductReviewerProfile {
  int? id;
  String? cusName;

  ProductReviewerProfile({this.id, this.cusName});

  ProductReviewerProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['cus_name'] = cusName;
    return data;
  }
}