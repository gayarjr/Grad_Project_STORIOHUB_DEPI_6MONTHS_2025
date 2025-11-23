import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/profile/domain/repos/profile_repo.dart';
import 'package:gradprojectstorio/features/profile/presentation/manager/My_Order_Cubit/my_order_state.dart';

class MyOrderCubit extends Cubit<OrdersState> {
  MyOrderCubit({required this.profileRepo}) : super(OrdersInitial()) {
    print("MyOrderCubit created");
  }

  final ProfileRepo profileRepo;

  void getOrder() async {
    emit(OrdersLoading());

    final result = await profileRepo.getMyOrder();

    result.fold(
      (failure) {
        emit(OrdersError(failure.message));
      },
      (ordersList) {
        emit(OrdersLoaded(ordersList));
      },
    );
  }
}
