import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle textRegular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textRegular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textMedium12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textMedium16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textMedium24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textSemiBold12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textBold10 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle textBold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
}
