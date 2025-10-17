import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSection extends StatefulWidget {
  const ImageSection({super.key, required this.images});
  final List<String> images;

  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  int selectedIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductImageSlider(
          images: widget.images,
          controller: _controller,
          onPageChanged: (index) {
            setState(() => selectedIndex = index);
          },
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(widget.images.length, (index) {
              final image = widget.images[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                  _controller.animateToPage(index);
                },
                child: Container(
                  height: 72.h,
                  width: 72.w,
                  margin: EdgeInsets.only(right: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.transparent,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class ProductImageSlider extends StatelessWidget {
  final List<String> images;
  final CarouselSliderController controller;
  final Function(int) onPageChanged;

  const ProductImageSlider({
    super.key,
    required this.images,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
        height: 250.h,
        autoPlay: true,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) => onPageChanged(index),
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
