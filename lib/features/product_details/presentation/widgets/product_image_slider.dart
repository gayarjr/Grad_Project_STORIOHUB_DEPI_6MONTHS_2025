import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatelessWidget {
  final List<dynamic> images;

  const ProductImageSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: images
          .map(
            (item) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(item, fit: BoxFit.cover, width: 1000),
            ),
          )
          .toList(),
    );
  }
}
