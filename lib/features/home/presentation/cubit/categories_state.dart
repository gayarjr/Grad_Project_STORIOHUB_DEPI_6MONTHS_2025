import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categories;

  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError(this.message);
}
