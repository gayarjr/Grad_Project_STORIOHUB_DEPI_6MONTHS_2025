import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gradprojectstorio/core/errors/failure.dart';
import 'package:gradprojectstorio/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:gradprojectstorio/features/checkout/data/models/request/chechout_request/checkout_request.dart';
import 'package:gradprojectstorio/features/checkout/data/models/response/cash_response/cash_response.dart';
import 'package:gradprojectstorio/features/checkout/domain/repo/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final CheckoutRemoteDataSource checkoutRemoteDataSource;
  CheckoutRepoImpl({required this.checkoutRemoteDataSource});

  @override
  Future<Either<Failure, CashResponse>> cash({
    required CheckoutRequest request,
    required String cartId,
  }) async {
    try {
      final data = await checkoutRemoteDataSource.cash(
        request: request,
        cartId: cartId,
      );
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
