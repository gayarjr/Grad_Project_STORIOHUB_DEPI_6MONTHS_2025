import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/cart_item_model.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/get_cart_items_usecase.dart';
import '../../domain/usecases/remove_item_usecase.dart';
import '../../domain/usecases/update_quantity_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartItemsUseCase getCartItemsUseCase;
  final AddToCartUseCase addToCartUseCase;
  final UpdateQuantityUseCase updateQuantityUseCase;
  final RemoveItemUseCase removeItemUseCase;
  final CartRepository repository;

  CartCubit({
    required this.getCartItemsUseCase,
    required this.addToCartUseCase,
    required this.updateQuantityUseCase,
    required this.removeItemUseCase,
    required this.repository,
  }) : super(CartInitial());

  Future<void> loadCart() async {
    emit(CartLoading());
    try {
      final items = await getCartItemsUseCase();
      final total = _calculateTotal(items);
      final itemCount = repository.getCartItemCount();
      emit(CartLoaded(items: items, total: total, itemCount: itemCount));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> addToCart({
    required String id,
    required String name,
    required String size,
    required double price,
    required String imageUrl,
    int quantity = 1,
  }) async {
    try {
      final cartItem = CartItemModel(
        id: id,
        name: name,
        size: size,
        price: price,
        imageUrl: imageUrl,
        quantity: quantity,
      );

      await addToCartUseCase(cartItem);
      await loadCart();

      emit(CartItemAdded('Item added to cart successfully'));
      // Reload cart after showing message
      await Future.delayed(const Duration(milliseconds: 100));
      await loadCart();
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> updateQuantity(String itemId, int quantity) async {
    if (state is CartLoaded) {
      try {
        await updateQuantityUseCase(itemId, quantity);
        await loadCart();
      } catch (e) {
        emit(CartError(e.toString()));
      }
    }
  }

  Future<void> removeItem(String itemId) async {
    if (state is CartLoaded) {
      try {
        await removeItemUseCase(itemId);
        await loadCart();
      } catch (e) {
        emit(CartError(e.toString()));
      }
    }
  }

  int getCartCount() {
    return repository.getCartItemCount();
  }

  bool isInCart(String productId) {
    return repository.isItemInCart(productId);
  }

  double _calculateTotal(List<CartItem> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}