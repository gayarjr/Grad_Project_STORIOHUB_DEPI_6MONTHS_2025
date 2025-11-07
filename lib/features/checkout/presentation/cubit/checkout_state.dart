part of 'checkout_cubit.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutVisaLoaded extends CheckoutState {
  final String url;
  const CheckoutVisaLoaded({required this.url});
}

final class CheckoutCashLoaded extends CheckoutState {
  final CashResponse cash;
  const CheckoutCashLoaded({required this.cash});
}

final class CheckoutError extends CheckoutState {
  final String message;
  const CheckoutError({required this.message});
}
