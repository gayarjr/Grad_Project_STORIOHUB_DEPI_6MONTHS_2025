class ProductCartEntity {
  final String id;
  final String imageCover;
  final String title;
  num count;
  final num price;

  ProductCartEntity({
    required this.id,
    required this.imageCover,
    required this.title,
    required this.count,
    required this.price,
  });
}
