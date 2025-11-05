import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final num price;
  @HiveField(4)
  final String imageCover;
  @HiveField(5)
  final List<dynamic> images;
  @HiveField(6)
  final num ratingsAverage;
  @HiveField(7)
  final num ratingsQuantity;
  @HiveField(8)
  final CategoryEntity brand;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageCover,
    required this.images,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.brand,
  });
}
