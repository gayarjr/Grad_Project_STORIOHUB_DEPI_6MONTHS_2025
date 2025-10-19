import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/custom_app_bar.dart';
import 'checkout_page.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<CartItem> cartItems = [
    CartItem(
      id: '1',
      name: 'Lapis Set, Necklace, ring, earrings',
      description: 'lightweight',
      price: 28.00,
      imageUrl: 'assets/lapis_blue.png',
      backgroundColor: Colors.grey[200],
    ),
    CartItem(
      id: '2',
      name: 'Lapis Set, Necklace, ring, earrings',
      description: 'lightweight',
      price: 28.00,
      imageUrl: 'assets/lapis_gold.png',
      backgroundColor: Colors.grey[100],
    ),
    CartItem(
      id: '3',
      name: 'Lapis Set, Necklace, ring, earrings',
      description: 'lightweight',
      price: 28.00,
      imageUrl: 'assets/lapis_pendant.png',
      backgroundColor: Colors.lightBlue[100],
    ),
  ];

  void _updateQuantity(String id, int delta) {
    setState(() {
      final item = cartItems.firstWhere((item) => item.id == id);
      item.quantity = (item.quantity + delta).clamp(1, 99);
    });
  }

  void _removeItem(String id) {
    setState(() {
      cartItems.removeWhere((item) => item.id == id);
    });
  }

  void _clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  void _navigateToCheckout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutPage(cartItems: cartItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shopping Cart - ${cartItems.length} items',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                OutlinedButton(
                  onPressed: _clearCart,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(color: Colors.blue),
                  ),
                  child: const Text('Clear'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  item: cartItems[index],
                  onQuantityChanged: (delta) =>
                      _updateQuantity(cartItems[index].id, delta),
                  onRemove: () => _removeItem(cartItems[index].id),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: cartItems.isEmpty ? null : _navigateToCheckout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D5F8C),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}