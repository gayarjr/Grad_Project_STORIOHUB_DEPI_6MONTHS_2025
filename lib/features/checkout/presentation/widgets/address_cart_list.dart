import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/features/checkout/presentation/widgets/address_cart_item.dart';
import 'package:gradprojectstorio/features/profile/data/models/responses/address_response.dart';

class AddressCartList extends StatefulWidget {
  const AddressCartList({
    super.key,
    required this.address,
    required this.onTap,
  });

  final List<AddressResponse> address;
  final Function(AddressResponse address) onTap;

  @override
  State<AddressCartList> createState() => _AddressCartListState();
}

class _AddressCartListState extends State<AddressCartList> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.address.length,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemBuilder: (context, index) => AddressCartItem(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.onTap(widget.address[index]);
            });
          },
          isSelected: selectedIndex == index,
          address:
              '${widget.address[index].details}, ${widget.address[index].name}, ${widget.address[index].city}',
        ),
      ),
    );
  }
}
