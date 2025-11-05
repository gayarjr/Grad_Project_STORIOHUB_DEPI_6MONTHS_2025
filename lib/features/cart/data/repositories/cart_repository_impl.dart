import '../../domain/entities/cart_item.dart';
import '../../domain/entities/delivery_address.dart';
import '../../domain/repositories/cart_repository.dart';
import '../models/delivery_address_model.dart';

class CartRepositoryImpl implements CartRepository {
  final List<CartItem> _cartItems = [];
  final List<DeliveryAddress> _addresses = [
    DeliveryAddressModel(
      id: '1',
      label: 'Home',
      address: '925 S Chugach St #APT 10, Alaska 99645',
      isDefault: true,
    ),
    DeliveryAddressModel(
      id: '2',
      label: 'Office',
      address: '2438 6th Ave, Ketchikan, Alaska',
      isDefault: false,
    ),
    DeliveryAddressModel(
      id: '3',
      label: 'Apartment',
      address: '2551 Vista Dr #B301, Juneau, Alaska',
      isDefault: false,
    ),
  ];

  @override
  Future<List<CartItem>> getCartItems() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.from(_cartItems);
  }

  @override
  Future<void> addToCart(CartItem item) async {
    await Future.delayed(const Duration(milliseconds: 300));

    // Check if item already exists in cart
    final existingIndex = _cartItems.indexWhere(
      (cartItem) => cartItem.id == item.id && cartItem.size == item.size,
    );

    if (existingIndex != -1) {
      // Update quantity if item exists
      final existingItem = _cartItems[existingIndex];
      _cartItems[existingIndex] = existingItem.copyWith(
        quantity: existingItem.quantity + item.quantity,
      );
    } else {
      // Add new item
      _cartItems.add(item);
    }
  }

  @override
  Future<void> removeFromCart(String itemId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _cartItems.removeWhere((item) => item.id == itemId);
  }

  @override
  Future<void> updateQuantity(String itemId, int quantity) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _cartItems.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      _cartItems[index] = _cartItems[index].copyWith(quantity: quantity);
    }
  }

  @override
  Future<void> clearCart() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _cartItems.clear();
  }

  @override
  Future<List<DeliveryAddress>> getAddresses() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _addresses;
  }

  @override
  Future<bool> placeOrder({
    required List<CartItem> items,
    required DeliveryAddress address,
    required double total,
    String? promoCode,
  }) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  int getCartItemCount() {
    return _cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  @override
  bool isItemInCart(String productId) {
    return _cartItems.any((item) => item.id == productId);
  }
}
