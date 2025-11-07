import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/cart/domain/entities/cart_entity.dart';
import 'package:gradprojectstorio/features/cart/domain/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo}) : super(CartInitial());

  final CartRepo cartRepo;

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await cartRepo.getCart();
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartLoaded(cartEntity: cart)),
    );
  }

  Future<void> removeFromCart({required String productId}) async {
    emit(CartLoading());
    final result = await cartRepo.removeFromCart(productId: productId);
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartLoaded(cartEntity: cart)),
    );
  }

  Future<void> addToCart({required String productId}) async {
    emit(CartLoading());
    final result = await cartRepo.addToCart(productId: productId);
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (cart) async => await getCart(),
    );
  }

  Future<void> updateProductFromCart({
    required String productId,
    required String count,
  }) async {
    emit(CartLoading());
    final result = await cartRepo.updateProductFromCart(
      productId: productId,
      count: count,
    );
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (cart) => emit(CartLoaded(cartEntity: cart)),
    );
  }
}
