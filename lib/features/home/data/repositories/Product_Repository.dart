import 'package:gradprojectstorio/core/network/api_service.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/models/product_model.dart';

class ProductRepository {
  final ApiService apiService = ApiService(); // ✅ استخدميه مباشرة

  Future<List<ProductEntity>> getAllProducts() async {
    final response = await apiService.get(endpoint: '/api/v1/products');
    final List<dynamic> data = response['data'];
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }
}
