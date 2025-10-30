class CartItem {
  final String id;
  final String name;
  final String size;
  final double price;
  final String imageUrl;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.size,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  CartItem copyWith({
    String? id,
    String? name,
    String? size,
    double? price,
    String? imageUrl,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      size: size ?? this.size,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }
}
