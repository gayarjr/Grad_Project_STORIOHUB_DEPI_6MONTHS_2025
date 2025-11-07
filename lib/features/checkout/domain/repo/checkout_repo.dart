import 'package:dartz/dartz.dart';
import 'package:gradprojectstorio/core/errors/failure.dart';
import 'package:gradprojectstorio/features/checkout/data/models/request/chechout_request/checkout_request.dart';
import 'package:gradprojectstorio/features/checkout/data/models/response/cash_response/cash_response.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, CashResponse>> cash({
    required CheckoutRequest request,
    required String cartId,
  });
}
