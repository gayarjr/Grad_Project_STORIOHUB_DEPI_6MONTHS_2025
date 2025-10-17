import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';

class OwnerInfo extends StatelessWidget {
  const OwnerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: NetworkImage('https://picsum.photos/400/300?1'),
          ),
        ),
      ),
      title: Text('Owner Name', style: AppStyles.textSemiBold12),
      trailing: GestureDetector(
        onTap: () {},
        child: Icon(Icons.favorite, color: Colors.red),
      ),
    );
  }
}
