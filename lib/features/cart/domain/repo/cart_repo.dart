import 'package:dartz/dartz.dart';
import 'package:gradprojectstorio/core/errors/failure.dart';
import 'package:gradprojectstorio/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Failure, void>> addToCart({required String productId});
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> removeFromCart({
    required String productId,
  });
  Future<Either<Failure, CartEntity>> updateProductFromCart({
    required String productId,
    required String count,
  });
}
