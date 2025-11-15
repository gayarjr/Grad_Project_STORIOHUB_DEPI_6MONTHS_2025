// lib/models/order_model.dart
class OrderModel {
  final String id;
  final String imageUrl;
  final int itemsCount;
  final double totalPrice;
  final bool isPaid;
  final bool isDelivered;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.imageUrl,
    required this.itemsCount,
    required this.totalPrice,
    required this.isPaid,
    required this.isDelivered,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final cartItems = json['cartItems'] as List<dynamic>? ?? [];

    final itemsCount = cartItems.fold<int>(
      0,
      (previousValue, item) =>
          previousValue + ((item['count'] as num?)?.toInt() ?? 0),
    );

    final imageUrl = (cartItems.isNotEmpty)
        ? (cartItems[0]['product']?['imageCover'] as String? ?? '')
        : '';

    return OrderModel(
      id: json['_id'] as String? ?? '',
      imageUrl: imageUrl,
      itemsCount: itemsCount,
      totalPrice: (json['totalOrderPrice'] as num?)?.toDouble() ?? 0.0,
      isPaid: json['isPaid'] as bool? ?? false,
      isDelivered: json['isDelivered'] as bool? ?? false,
      createdAt:
          DateTime.tryParse(json['createdAt'] as String? ?? '') ??
          DateTime.now(),
    );
  }
}
