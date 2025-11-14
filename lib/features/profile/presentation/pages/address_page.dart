import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/profile/presentation/widgets/address_view_body.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address", style: AppStyles.textSemiBold24),
        centerTitle: true,
      ),
      body: AddressViewBody(),
    );
  }
}
