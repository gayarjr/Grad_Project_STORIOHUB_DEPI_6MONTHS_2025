import 'cart_item.dart';
import 'shipping_address.dart';

class CashResponse {
  num? taxPrice;
  num? shippingPrice;
  num? totalOrderPrice;
  String? paymentMethodType;
  bool? isPaid;
  bool? isDelivered;
  String? id;
  String? user;
  List<CartItemModel>? cartItems;
  ShippingAddress? shippingAddress;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? orderId;
  num? v;

  CashResponse({
    this.taxPrice,
    this.shippingPrice,
    this.totalOrderPrice,
    this.paymentMethodType,
    this.isPaid,
    this.isDelivered,
    this.id,
    this.user,
    this.cartItems,
    this.shippingAddress,
    this.createdAt,
    this.updatedAt,
    this.orderId,
    this.v,
  });

  factory CashResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return CashResponse(
      taxPrice: data['taxPrice'] as num?,
      shippingPrice: data['shippingPrice'] as num?,
      totalOrderPrice: data['totalOrderPrice'] as num?,
      paymentMethodType: data['paymentMethodType'] as String?,
      isPaid: data['isPaid'] as bool?,
      isDelivered: data['isDelivered'] as bool?,
      id: data['_id'] as String?,
      user: data['user'] as String?,
      cartItems: (data['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      shippingAddress: data['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              data['shippingAddress'] as Map<String, dynamic>,
            ),
      createdAt: data['createdAt'] == null
          ? null
          : DateTime.parse(data['createdAt'] as String),
      updatedAt: data['updatedAt'] == null
          ? null
          : DateTime.parse(data['updatedAt'] as String),
      orderId: data['id'] as num?,
      v: data['__v'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'taxPrice': taxPrice,
    'shippingPrice': shippingPrice,
    'totalOrderPrice': totalOrderPrice,
    'paymentMethodType': paymentMethodType,
    'isPaid': isPaid,
    'isDelivered': isDelivered,
    '_id': id,
    'user': user,
    'cartItems': cartItems?.map((e) => e.toJson()).toList(),
    'shippingAddress': shippingAddress?.toJson(),
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'id': orderId,
    '__v': v,
  };
}
