import '../entities/cart_item.dart';
import '../entities/delivery_address.dart';
import '../repositories/cart_repository.dart';

class PlaceOrderUseCase {
  final CartRepository repository;

  PlaceOrderUseCase(this.repository);

  Future<bool> call({
    required List<CartItem> items,
    required DeliveryAddress address,
    required double total,
    String? promoCode,
  }) async {
    if (items.isEmpty) throw Exception('Cart is empty');
    return await repository.placeOrder(
      items: items,
      address: address,
      total: total,
      promoCode: promoCode,
    );
  }
}
