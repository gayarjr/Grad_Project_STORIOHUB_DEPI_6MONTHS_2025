import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/checkout/data/models/request/chechout_request/checkout_request.dart';
import 'package:gradprojectstorio/features/checkout/data/models/response/cash_response/cash_response.dart';
import 'package:gradprojectstorio/features/checkout/domain/repo/checkout_repo.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.checkoutRepo}) : super(CheckoutInitial());

  final CheckoutRepo checkoutRepo;

  Future<void> cash({
    required CheckoutRequest request,
    required String cartId,
  }) async {
    emit(CheckoutLoading());
    final data = await checkoutRepo.cash(request: request, cartId: cartId);
    data.fold(
      (l) => emit(CheckoutError(message: l.message)),
      (r) => emit(CheckoutCashLoaded(cash: r)),
    );
  }
}
