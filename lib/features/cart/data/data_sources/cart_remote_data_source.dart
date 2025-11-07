import 'package:gradprojectstorio/core/services/api_service.dart';
import 'package:gradprojectstorio/features/cart/data/models/cart_response.dart';
import 'package:gradprojectstorio/features/cart/domain/entities/cart_entity.dart';

abstract class CartRemoteDataSource {
  Future<CartEntity> getCart();
  Future<CartEntity> updateProductFromCart({
    required String productId,
    required String count,
  });
  Future<void> addProductToCart({required String productId});
  Future<CartEntity> removeProductFromCart({required String productId});
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiService apiService;
  CartRemoteDataSourceImpl({required this.apiService});

  @override
  Future<void> addProductToCart({required String productId}) async {
    await apiService.post(endPoint: '/cart', data: {"productId": productId});
  }

  @override
  Future<CartEntity> getCart() async {
    var response = await apiService.get(endPoint: '/cart');
    return CartResponse.fromJson(response['data']).toEntity();
  }

  @override
  Future<CartEntity> removeProductFromCart({required String productId}) async {
    var response = await apiService.delete(endPoint: '/cart/$productId');
    return CartResponse.fromJson(response['data']).toEntity();
  }

  @override
  Future<CartEntity> updateProductFromCart({
    required String productId,
    required String count,
  }) async {
    var response = await apiService.put(
      endPoint: '/cart/$productId',
      data: {"count": count},
    );
    return CartResponse.fromJson(response['data']).toEntity();
  }
}
