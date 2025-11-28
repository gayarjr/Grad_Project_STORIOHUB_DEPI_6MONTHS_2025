import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/profile/domain/entities/orders_entity.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit({required this.profileRepo}) : super(OrdersInitial());

  final ProfileRepo profileRepo;

  Future<void> getOrders({required String userId}) async {
    emit(OrdersLoading());
    final result = await profileRepo.getOrders(userId: userId);
    result.fold(
      (l) => emit(OrdersError(message: l.message)),
      (r) => emit(OrdersLoaded(orders: r)),
    );
  }
}
