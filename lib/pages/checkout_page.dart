import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../models/shipping_option.dart';
import '../widgets/checkout_item_widget.dart';
import '../widgets/custom_app_bar.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CheckoutPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int? selectedShippingIndex;

  final List<ShippingOption> shippingOptions = [
    ShippingOption(
      name: 'Cash on Delivery',
      duration: '1 to 2 days',
      price: 0,
    ),
    ShippingOption(
      name: 'Standard Shipping',
      duration: '1 to 5 day',
      price: 10,
    ),
    ShippingOption(
      name: 'Express Shipping',
      duration: '1 to 3 days',
      price: 20,
    ),
    ShippingOption(
      name: 'Free Shipping',
      duration: '1 to 2 weeks',
      price: 0,
    ),
  ];

  double get subtotal {
    return widget.cartItems.fold(
      0,
          (sum, item) => sum + (item.price * item.quantity),
    );
  }

  double get shippingCost {
    return selectedShippingIndex != null
        ? shippingOptions[selectedShippingIndex!].price
        : 0;
  }

  double get total => subtotal + shippingCost;

  void _updateQuantity(String id, int delta) {
    setState(() {
      final item = widget.cartItems.firstWhere((item) => item.id == id);
      item.quantity = (item.quantity + delta).clamp(1, 99);
    });
  }

  void _removeItem(String id) {
    setState(() {
      widget.cartItems.removeWhere((item) => item.id == id);
    });
    if (widget.cartItems.isEmpty) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCouponBanner(),
            _buildCartItemsList(),
            _buildShippingOptions(),
            _buildOrderSummary(),
            _buildBuyButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponBanner() {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0D5F8C),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.white),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Coupon applied: 25OFF',
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: widget.cartItems.length,
      itemBuilder: (context, index) {
        return CheckoutItemWidget(
          item: widget.cartItems[index],
          onQuantityChanged: (delta) =>
              _updateQuantity(widget.cartItems[index].id, delta),
          onRemove: () => _removeItem(widget.cartItems[index].id),
        );
      },
    );
  }

  Widget _buildShippingOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(shippingOptions.length, (index) {
          return RadioListTile<int>(
            value: index,
            groupValue: selectedShippingIndex,
            onChanged: (value) {
              setState(() {
                selectedShippingIndex = value;
              });
            },
            title: Text(
              '${shippingOptions[index].name} ( ${shippingOptions[index].duration} ) | \$${shippingOptions[index].price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 14),
            ),
            dense: true,
            contentPadding: EdgeInsets.zero,
          );
        }),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order summary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                _buildSummaryRow('Subtotal', subtotal),
                const SizedBox(height: 8),
                _buildSummaryRow('Shipping', shippingCost),
                const Divider(height: 24),
                _buildSummaryRow('Total', total, isTotal: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildBuyButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Order placed successfully!'),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0D5F8C),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Buy Now',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}