import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/features/home/presentation/views/home_view.dart';
import 'package:gradprojectstorio/features/profile/presentation/pages/account_page.dart';
import 'package:gradprojectstorio/features/search/presentation/views/search_view.dart';
import 'package:gradprojectstorio/features/watchlist/presentation/views/wishlist_view.dart';

import '../cart/presentation/screens/cart_screen.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _currentIndex = 0;

  List<Widget> get _pages => [
    const HomeView(),
    SearchView(),
    WishlistView(),

    const CartScreen(),

    AccountScreen(),
  ];

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => changeTab(index),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        backgroundColor: AppColors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
