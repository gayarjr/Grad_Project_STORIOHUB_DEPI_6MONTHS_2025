import 'package:hive_flutter/hive_flutter.dart';
part 'category_entity.g.dart';

@HiveType(typeId: 1)
class CategoryEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String name;

  CategoryEntity({required this.id, required this.image, required this.name});
}
