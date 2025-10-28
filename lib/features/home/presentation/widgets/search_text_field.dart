import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.readOnly = false,
    this.onTap,
    this.controller,
  });

  final bool readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: 'Search for clothes...',
        prefixIcon: Icon(Icons.search, color: Colors.grey),
      ),
    );
  }
}
