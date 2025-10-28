import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

class ProductEntity {
  final String id;
  final String imageCover;
  final List<String> images;
  final String title;
  final String description;
  final num price;
  final num rating;
  final num ratingCount;
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
