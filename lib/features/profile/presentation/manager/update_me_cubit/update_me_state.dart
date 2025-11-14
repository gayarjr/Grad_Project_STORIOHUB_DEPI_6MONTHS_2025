part of 'update_me_cubit.dart';

sealed class UpdateMeState extends Equatable {
  const UpdateMeState();

  @override
  List<Object> get props => [];
}

final class UpdateMeInitial extends UpdateMeState {}

final class UpdateMeLoading extends UpdateMeState {}

final class UpdateMeLoaded extends UpdateMeState {}

final class UpdateMeError extends UpdateMeState {
  final String message;
  const UpdateMeError({required this.message});
}
