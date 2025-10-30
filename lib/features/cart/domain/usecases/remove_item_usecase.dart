import '../repositories/cart_repository.dart';

class RemoveItemUseCase {
  final CartRepository repository;

  RemoveItemUseCase(this.repository);

  Future<void> call(String itemId) async {
    await repository.removeFromCart(itemId);
  }
}
