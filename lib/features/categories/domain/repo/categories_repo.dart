import 'package:dartz/dartz.dart';
import 'package:gradprojectstorio/core/errors/failure.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({
    required String idCategory,
  });
}
