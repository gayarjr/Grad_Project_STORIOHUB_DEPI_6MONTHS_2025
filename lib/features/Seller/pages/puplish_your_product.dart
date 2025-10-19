import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_constants.dart';

class PuplishYourProduct extends StatelessWidget {
  const PuplishYourProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            AppConstants.publishYourProduct,
            style: TextStyle(color: AppColors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Image.asset("images/Icon.png"),
            ),
          ],
        ),

        //appbar
        SizedBox(height: 10),
        Row(
          children: [
            Text("ddd", style: TextStyle(color: Colors.black)),
            TextFormField(),
          ],
        ),
      ],
    );
  }
}
