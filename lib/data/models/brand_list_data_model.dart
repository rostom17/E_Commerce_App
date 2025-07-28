class BrandListDataModel {
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? icon;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BrandListDataModel(
      {this.sId,
      this.title,
      this.slug,
      this.description,
      this.icon,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BrandListDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    icon = json['icon'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['icon'] = icon;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
