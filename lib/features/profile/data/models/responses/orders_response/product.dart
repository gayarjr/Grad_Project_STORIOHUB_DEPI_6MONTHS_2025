import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

class Product {
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;

  Product({
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    subcategory: (json['subcategory'] as List<dynamic>?)
        ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    ratingsQuantity: json['ratingsQuantity'] as num?,
    id: json['_id'] as String?,
    title: json['title'] as String?,
    imageCover: json['imageCover'] as String?,
    category: json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    brand: json['brand'] == null
        ? null
        : Brand.fromJson(json['brand'] as Map<String, dynamic>),
    ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'subcategory': subcategory?.map((e) => e.toJson()).toList(),
    'ratingsQuantity': ratingsQuantity,
    '_id': id,
    'title': title,
    'imageCover': imageCover,
    'category': category?.toJson(),
    'brand': brand?.toJson(),
    'ratingsAverage': ratingsAverage,
  };
}
