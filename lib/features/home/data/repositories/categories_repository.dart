import 'package:dio/dio.dart';
import 'package:gradprojectstorio/features/home/data/models/categories_response.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

import '../../../../core/services/api_service.dart';

class CategoriesRepository {
  ApiService apiService = ApiService(Dio());

  Future<List<CategoryEntity>> getAllCategories() async {
    final response = await apiService.get(endPoint: '/categories');
    final List<dynamic> data = response['data'];
    return data.map((e) => CategoriesResponse.fromJson(e).toEntity()).toList();
  }
}
