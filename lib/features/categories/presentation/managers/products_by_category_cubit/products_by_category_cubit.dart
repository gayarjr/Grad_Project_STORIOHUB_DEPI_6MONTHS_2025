import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/categories/domain/repo/categories_repo.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';

part 'products_by_category_state.dart';

class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  ProductsByCategoryCubit({required this.categoriesRepo})
    : super(ProductsByCategoryInitial());

  final CategoriesRepo categoriesRepo;

  Future<void> getProductsByCategory({required String categoryId}) async {
    emit(ProductsByCategoryLoading());
    final result = await categoriesRepo.getProductsByCategory(
      idCategory: categoryId,
    );
    result.fold(
      (l) => emit(ProductsByCategoryError(message: l.message)),
      (r) => emit(ProductsByCategoryLoaded(products: r)),
    );
  }
}
