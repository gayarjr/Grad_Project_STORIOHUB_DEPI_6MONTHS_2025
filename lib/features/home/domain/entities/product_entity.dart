import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

class ProductEntity {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageCover;
  final List<String> images;
  final double ratingsAverage;
  final int ratingsQuantity;
  final CategoryEntity category;
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
    required this.category,
    required this.brand,
  });
}
