import '../../domain/entities/cart_item.dart';
import '../../domain/entities/delivery_address.dart';
import '../../domain/repositories/cart_repository.dart';
import 'checkout_state.dart';
import '../../domain/usecases/place_order_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final CartRepository repository;
  final PlaceOrderUseCase placeOrderUseCase;

  CheckoutCubit({
    required this.repository,
    required this.placeOrderUseCase,
  }) : super(CheckoutInitial());

  Future<void> loadCheckout() async {
    emit(CheckoutLoading());
    try {
      final addresses = await repository.getAddresses();
      final defaultAddress = addresses.firstWhere(
            (addr) => addr.isDefault,
        orElse: () => addresses.first,
      );
      emit(CheckoutLoaded(
        addresses: addresses,
        selectedAddress: defaultAddress,
      ));
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }

  void selectAddress(DeliveryAddress address) {
    if (state is CheckoutLoaded) {
      final current = state as CheckoutLoaded;
      emit(current.copyWith(selectedAddress: address));
    }
  }

  void applyPromoCode(String code) {
    if (state is CheckoutLoaded) {
      final current = state as CheckoutLoaded;
      emit(current.copyWith(promoCode: code));
    }
  }

  Future<void> placeOrder({
    required List<CartItem> items,
    required double total,
  }) async {
    if (state is CheckoutLoaded) {
      final current = state as CheckoutLoaded;
      emit(CheckoutLoading());
      try {
        final success = await placeOrderUseCase(
          items: items,
          address: current.selectedAddress,
          total: total + current.shippingFee,
          promoCode: current.promoCode,
        );
        if (success) {
          await repository.clearCart();
          emit(CheckoutSuccess());
        } else {
          emit(CheckoutError('Failed to place order'));
        }
      } catch (e) {
        emit(CheckoutError(e.toString()));
      }
    }
  }
}