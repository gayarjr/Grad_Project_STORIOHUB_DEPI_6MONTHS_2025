part of 'orders_cubit.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersLoaded extends OrdersState {
  final List<OrdersEntity> orders;
  const OrdersLoaded({required this.orders});
}

final class OrdersError extends OrdersState {
  final String message;
  const OrdersError({required this.message});
}
