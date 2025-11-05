import '../../domain/entities/delivery_address.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final List<DeliveryAddress> addresses;
  final DeliveryAddress selectedAddress;
  final double shippingFee;
  final String? promoCode;

  CheckoutLoaded({
    required this.addresses,
    required this.selectedAddress,
    this.shippingFee = 80,
    this.promoCode,
  });

  CheckoutLoaded copyWith({
    List<DeliveryAddress>? addresses,
    DeliveryAddress? selectedAddress,
    double? shippingFee,
    String? promoCode,
  }) {
    return CheckoutLoaded(
      addresses: addresses ?? this.addresses,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      shippingFee: shippingFee ?? this.shippingFee,
      promoCode: promoCode ?? this.promoCode,
    );
  }
}

class CheckoutSuccess extends CheckoutState {}

class CheckoutError extends CheckoutState {
  final String message;
  CheckoutError(this.message);
}
