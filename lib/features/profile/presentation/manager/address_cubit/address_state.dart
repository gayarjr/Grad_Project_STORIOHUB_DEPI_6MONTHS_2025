part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressLoaded extends AddressState {
  final List<AddressResponse> addresses;
  const AddressLoaded({required this.addresses});
}

final class AddressError extends AddressState {
  final String message;
  const AddressError({required this.message});
}
