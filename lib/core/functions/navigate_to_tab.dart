import 'package:flutter/material.dart';
import 'package:gradprojectstorio/features/main/main_view.dart';

void navigateToTab(BuildContext context, int index) {
  final mainViewState = context.findAncestorStateOfType<MainViewState>();
  mainViewState?.changeTab(index);
}
