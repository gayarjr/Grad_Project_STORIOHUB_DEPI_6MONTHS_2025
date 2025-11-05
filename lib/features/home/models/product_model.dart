import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';
import 'package:gradprojectstorio/features/home/domain/entities/category_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.imageCover,
    required super.images,
    required super.ratingsAverage,
    required super.ratingsQuantity,
    required super.category,
    required super.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      imageCover: json['imageCover'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      ratingsAverage: (json['ratingsAverage'] ?? 0).toDouble(),
      ratingsQuantity: (json['ratingsQuantity'] ?? 0).toInt(),
      category: CategoryEntity(
        id: json['category']['_id'] ?? '',
        name: json['category']['name'] ?? '',
        image: json['category']['image'] ?? '',
      ),
      brand: CategoryEntity(
        id: json['brand']['_id'] ?? '',
        name: json['brand']['name'] ?? '',
        image: json['brand']['image'] ?? '',
      ),
    );
  }
}
