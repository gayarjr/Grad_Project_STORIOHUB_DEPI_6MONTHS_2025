import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradprojectstorio/features/home/data/repositories/product_repository.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  Future<void> fetchAllProducts() async {
    emit(ProductLoading());
    try {
      final products = await repository.getAllProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
