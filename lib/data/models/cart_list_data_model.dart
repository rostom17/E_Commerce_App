
import 'package:e_commerce_app/data/models/cart_product_data_model.dart';

class CartListDataModel {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  String? qty;
  String? price;
  String? createdAt;
  String? updatedAt;
  CartProductDataModel? product;

  CartListDataModel(
      {this.id,
        this.userId,
        this.productId,
        this.color,
        this.size,
        this.qty,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.product});

  CartListDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = json['qty'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? CartProductDataModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['color'] = color;
    data['size'] = size;
    data['qty'] = qty;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}