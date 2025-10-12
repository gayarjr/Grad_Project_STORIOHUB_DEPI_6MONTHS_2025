import 'package:flutter/material.dart';
import 'package:gradprojectstorio/features/Home/presentation/pages/main_nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STORIO',
      home: const MainNavScreen(),
    );
  }
}
