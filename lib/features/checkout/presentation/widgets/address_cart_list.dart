import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/features/checkout/presentation/widgets/address_cart_item.dart';

class AddressCartList extends StatefulWidget {
  const AddressCartList({super.key});

  @override
  State<AddressCartList> createState() => _AddressCartListState();
}

class _AddressCartListState extends State<AddressCartList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 2,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemBuilder: (context, index) => AddressCartItem(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          isSelected: selectedIndex == index,
          address: '123 Main Street, City, Country',
        ),
      ),
    );
  }
}
