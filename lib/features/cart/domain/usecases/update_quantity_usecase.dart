import '../repositories/cart_repository.dart';

class UpdateQuantityUseCase {
  final CartRepository repository;

  UpdateQuantityUseCase(this.repository);

  Future<void> call(String itemId, int quantity) async {
    if (quantity < 1) throw Exception('Quantity must be at least 1');
    await repository.updateQuantity(itemId, quantity);
  }
}
