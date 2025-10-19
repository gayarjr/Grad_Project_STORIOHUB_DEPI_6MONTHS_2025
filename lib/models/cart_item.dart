import 'dart:ui';

class CartItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final Color? backgroundColor;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.backgroundColor,
    this.quantity = 1,
  });
}
