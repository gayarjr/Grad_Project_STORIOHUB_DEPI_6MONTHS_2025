import 'product.dart';

class CartItem {
  num? count;
  String? id;
  Product? product;
  num? price;

  CartItem({this.count, this.id, this.product, this.price});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    count: json['count'] as num?,
    id: json['_id'] as String?,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    price: json['price'] as num?,
  );

  Map<String, dynamic> toJson() => {
    'count': count,
    '_id': id,
    'product': product?.toJson(),
    'price': price,
  };
}
