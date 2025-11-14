part of 'products_by_category_cubit.dart';

sealed class ProductsByCategoryState {}

final class ProductsByCategoryInitial extends ProductsByCategoryState {}

final class ProductsByCategoryLoading extends ProductsByCategoryState {}

final class ProductsByCategoryLoaded extends ProductsByCategoryState {
  final List<ProductEntity> products;
  ProductsByCategoryLoaded({required this.products});
}

final class ProductsByCategoryError extends ProductsByCategoryState {
  final String message;
  ProductsByCategoryError({required this.message});
}
