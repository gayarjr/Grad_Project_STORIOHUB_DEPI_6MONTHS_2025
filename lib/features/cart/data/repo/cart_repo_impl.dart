import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gradprojectstorio/core/errors/failure.dart';
import 'package:gradprojectstorio/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:gradprojectstorio/features/cart/domain/entities/cart_entity.dart';
import 'package:gradprojectstorio/features/cart/domain/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, void>> addToCart({required String productId}) async {
    try {
      await cartRemoteDataSource.addProductToCart(productId: productId);
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      final data = await cartRemoteDataSource.getCart();
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CartEntity>> removeFromCart({
    required String productId,
  }) async {
    try {
      final data = await cartRemoteDataSource.removeProductFromCart(
        productId: productId,
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

  @override
  Future<Either<Failure, CartEntity>> updateProductFromCart({
    required String productId,
    required String count,
  }) async {
    try {
      final data = await cartRemoteDataSource.updateProductFromCart(
        productId: productId,
        count: count,
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
