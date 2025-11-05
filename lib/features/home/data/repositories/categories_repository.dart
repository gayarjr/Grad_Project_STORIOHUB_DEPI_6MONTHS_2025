import 'package:gradprojectstorio/core/network/api_service.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:gradprojectstorio/features/home/models/category_model.dart';

class CategoriesRepository {
  final ApiService apiService = ApiService();

  Future<List<CategoryEntity>> getAllCategories() async {
    final response = await apiService.get(endpoint: '/api/v1/categories');
    final List<dynamic> data = response['data'];

    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
