import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/widgets/custom_app_bar.dart';
import 'package:gradprojectstorio/features/wishlist/presentation/widgets/wishlist_view_body.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppbar(), body: WishlistViewBody());
  }
}
