import '../entities/cart_item.dart';
import '../entities/delivery_address.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<void> addToCart(CartItem item);
  Future<void> removeFromCart(String itemId);
  Future<void> updateQuantity(String itemId, int quantity);
  Future<void> clearCart();
  Future<List<DeliveryAddress>> getAddresses();
  Future<bool> placeOrder({
    required List<CartItem> items,
    required DeliveryAddress address,
    required double total,
    String? promoCode,
  });
  int getCartItemCount();
  bool isItemInCart(String productId);
}
