import 'package:dio/dio.dart';
import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/features/home/data/models/product_response/product_response.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';

class ProductRepository {
  ApiService apiService = ApiService(Dio());

  Future<List<ProductEntity>> getAllProducts() async {
    final response = await apiService.get(endPoint: '/products');
    final List<dynamic> data = response['data'];
    return data.map((e) => ProductResponse.fromJson(e).toEntity()).toList();
  }
}
