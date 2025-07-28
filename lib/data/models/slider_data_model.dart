class SliderDataModel {
  String? sId;
  String? photoUrl;
  String? description;
  dynamic product;
  String? brand;
  dynamic category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SliderDataModel(
      {this.sId,
      this.photoUrl,
      this.description,
      this.product,
      this.brand,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SliderDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    photoUrl = json['photo_url'];
    description = json['description'];
    product = json['product'];
    brand = json['brand'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['photo_url'] = photoUrl;
    data['description'] = description;
    data['product'] = product;
    data['brand'] = brand;
    data['category'] = category;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
