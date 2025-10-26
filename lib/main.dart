import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Storio());
}

class Storio extends StatelessWidget {
  const Storio({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(),
      ),
    );
  }
}
