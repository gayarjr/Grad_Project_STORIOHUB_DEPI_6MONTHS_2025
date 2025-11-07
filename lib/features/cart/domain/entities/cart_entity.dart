import 'package:gradprojectstorio/features/cart/domain/entities/product_cart_entity.dart';

class CartEntity {
  final String cartId;
  final num totalPrice;
  final List<ProductCartEntity> products;

  CartEntity({
    required this.cartId,
    required this.totalPrice,
    required this.products,
  });
}
