import 'package:flutter/material.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Search for a product 🔍",
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
