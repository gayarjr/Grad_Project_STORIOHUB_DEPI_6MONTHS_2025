import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatelessWidget {
  final List<String> images;
  final Function(int) onPageChanged;
  final int activeIndex;

  const ImageSlider({
    super.key,
    required this.images,
    required this.onPageChanged,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
          options: CarouselOptions(
            height: 160,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) => onPageChanged(index),
          ),
        ),
        const SizedBox(height: 10),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: images.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: AppColors.primaryColor,
            dotHeight: 6,
            dotWidth: 6,
          ),
        ),
      ],
    );
  }
}
