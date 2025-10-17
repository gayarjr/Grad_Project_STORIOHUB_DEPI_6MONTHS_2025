import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';
import 'package:gradprojectstorio/core/utils/app_constants.dart';
import 'package:gradprojectstorio/features/Home/presentation/pages/home.dart';
import 'package:gradprojectstorio/features/wishlist/presentation/page/wishlist_view.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});
  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const WishlistView(),
    const Center(child: Text("Cart Page")),
    const Center(child: Text("Search Page")),
    const Center(child: Text("Profile Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppConstants.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: AppConstants.wishlist,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: AppConstants.cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppConstants.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: AppConstants.profile,
          ),
        ],
      ),
    );
  }
}
