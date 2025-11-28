import 'package:gradprojectstorio/features/profile/domain/entities/orders_item_entity.dart';

class OrdersEntity {
  final num id;
  final String address;
  final String phone;
  final List<OrdersItemEntity> items;

  OrdersEntity({
    required this.id,
    required this.address,
    required this.phone,
    required this.items,
  });
}
