class CartItemModel {
  int? count;
  String? id;
  String? product;
  int? price;

  CartItemModel({this.count, this.id, this.product, this.price});

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    count: json['count'] as int?,
    id: json['_id'] as String?,
    product: json['product'] as String?,
    price: json['price'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'count': count,
    '_id': id,
    'product': product,
    'price': price,
  };
}
