import 'package:gradprojectstorio/features/profile/domain/entities/orders_entity.dart';
import 'package:gradprojectstorio/features/profile/domain/entities/orders_item_entity.dart';

import 'cart_item.dart';
import 'shipping_address.dart';
import 'user.dart';

class OrdersResponse {
  ShippingAddress? shippingAddress;
  num? taxPrice;
  num? shippingPrice;
  num? totalOrderPrice;
  String? paymentMethodType;
  bool? isPaid;
  bool? isDelivered;
  String? id;
  User? user;
  List<CartItem>? cartItems;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? orderId;
  num? v;

  OrdersResponse({
    this.shippingAddress,
    this.taxPrice,
    this.shippingPrice,
    this.totalOrderPrice,
    this.paymentMethodType,
    this.isPaid,
    this.isDelivered,
    this.id,
    this.user,
    this.cartItems,
    this.createdAt,
    this.updatedAt,
    this.orderId,
    this.v,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      shippingAddress: json['shippingAddress'] == null
          ? null
          : ShippingAddress.fromJson(
              json['shippingAddress'] as Map<String, dynamic>,
            ),
      taxPrice: json['taxPrice'] as num?,
      shippingPrice: json['shippingPrice'] as num?,
      totalOrderPrice: json['totalOrderPrice'] as num?,
      paymentMethodType: json['paymentMethodType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      cartItems: (json['cartItems'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      orderId: json['id'] as num?,
      v: json['__v'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'shippingAddress': shippingAddress?.toJson(),
    'taxPrice': taxPrice,
    'shippingPrice': shippingPrice,
    'totalOrderPrice': totalOrderPrice,
    'paymentMethodType': paymentMethodType,
    'isPaid': isPaid,
    'isDelivered': isDelivered,
    '_id': id,
    'user': user?.toJson(),
    'cartItems': cartItems?.map((e) => e.toJson()).toList(),
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'id': orderId,
    '__v': v,
  };

  OrdersEntity toEntity() => OrdersEntity(
    id: orderId ?? 0,
    address: '${shippingAddress?.details} ${shippingAddress?.city}',
    phone: shippingAddress?.phone ?? '',
    items:
        cartItems
            ?.map(
              (e) => OrdersItemEntity(
                image: e.product?.imageCover ?? '',
                title: e.product?.title ?? '',
                count: e.count ?? 0,
                price: e.price ?? 0,
              ),
            )
            .toList() ??
        [],
  );
}
