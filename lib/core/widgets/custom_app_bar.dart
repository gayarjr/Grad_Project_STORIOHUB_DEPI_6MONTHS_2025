import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_constants.dart';

AppBar customAppbar() {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.menu, color: AppColors.textColor),
      onPressed: () {},
    ),
    title: const Text(
      AppConstants.appTitle,
      style: TextStyle(
        color: AppColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.greyShade,
          child: const Icon(Icons.person, color: AppColors.textColor),
        ),
      ),
    ],
  );
}
