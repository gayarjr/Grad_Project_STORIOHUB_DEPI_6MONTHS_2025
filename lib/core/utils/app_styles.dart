import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static const String fontFamily = 'Poppins';
  static TextStyle textRegular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textSemiBold32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textMedium16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textMedium14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
}
