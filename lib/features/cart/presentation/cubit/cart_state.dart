import '../../domain/entities/cart_item.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;
  final double total;
  final int itemCount;

  CartLoaded({
    required this.items,
    required this.total,
    required this.itemCount,
  });

  double get subtotal => items.fold(0, (sum, item) => sum + (item.price * item.quantity));
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartItemAdded extends CartState {
  final String message;
  CartItemAdded(this.message);
}