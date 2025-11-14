import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/categories/domain/repo/categories_repo.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required this.categoriesRepo}) : super(CategoriesInitial());

  final CategoriesRepo categoriesRepo;

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final result = await categoriesRepo.getCategories();
    result.fold(
      (l) => emit(CategoriesError(message: l.message)),
      (r) => emit(CategoriesLoaded(categories: r)),
    );
  }
}
