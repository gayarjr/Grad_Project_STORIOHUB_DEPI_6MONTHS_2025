import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/features/categories/data/models/categories_response/category_response.dart';
import 'package:gradprojectstorio/features/home/data/models/product_response/product_response.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getProductsByCategory({
    required String idCategory,
  });
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiService apiService;
  CategoriesRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    var response = await apiService.get(endPoint: '/categories?limit=50');
    return (response['data'] as List)
        .map((e) => CategoryResponse.fromJson(e).toEntity())
        .toList();
  }

  @override
  Future<List<ProductEntity>> getProductsByCategory({
    required String idCategory,
  }) async {
    var response = await apiService.get(
      endPoint: '/products?limit=60&category[in]=$idCategory',
    );
    return (response['data'] as List)
        .map((e) => ProductResponse.fromJson(e).toEntity())
        .toList();
  }
}
