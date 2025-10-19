import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/widgets/custom_app_bar.dart';
import 'package:gradprojectstorio/features/Seller/pages/puplish_your_product.dart';

class HomeSeller extends StatelessWidget {
  const HomeSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),

      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.primaryColor,
              ),
              height: 50,
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "  Publish New Product ",
                      style: TextStyle(fontSize: 16, color: AppColors.white),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.backgroundColor,
                        builder: (context) {
                          return FractionallySizedBox(
                            heightFactor: 0.8, //
                            child: PuplishYourProduct(),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.add),
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showPublishProductSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: PuplishYourProduct(),
        ),
      );
    },
  );
}
