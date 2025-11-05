import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/home/data/repositories/categories_repository.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository repository;

  CategoriesCubit(this.repository) : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    try {
      final categories = await repository.getAllCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
