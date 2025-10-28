import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String imageCover;
  @HiveField(2)
  final List<String> images;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final num price;
  @HiveField(6)
  final num rating;
  @HiveField(7)
  final num ratingCount;
  @HiveField(8)
  final CategoryEntity brand;

  ProductEntity({
    required this.brand,
    required this.id,
    required this.imageCover,
    required this.images,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.ratingCount,
  });
}
