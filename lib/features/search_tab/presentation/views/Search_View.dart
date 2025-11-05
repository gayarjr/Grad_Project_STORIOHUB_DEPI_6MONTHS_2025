import 'package:flutter/material.dart';
import 'package:gradprojectstorio/features/search_tab/presentation/widgets/Empty_Search_View.dart';
import 'package:gradprojectstorio/features/search_tab/presentation/widgets/No_Results_View.dart';
import 'package:gradprojectstorio/features/search_tab/presentation/widgets/Search_Results_View.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> allProducts = [
    {"name": "Regular Fit Slogan", "price": 1190},
    {"name": "Regular Fit Polo", "price": 1100, "discount": "52%"},
    {"name": "Regular Fit Black", "price": 1690},
    {"name": "Regular Fit V-Neck", "price": 1290},
  ];

  List<Map<String, dynamic>> filteredProducts = [];

  final String productImageUrl =
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80';

  void _searchProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredProducts = [];
      });
      return;
    }

    final results = allProducts.where((product) {
      return product['name'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredProducts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool noResults =
        _searchController.text.isNotEmpty && filteredProducts.isEmpty;

    Widget content;

    if (_searchController.text.isEmpty) {
      content = const EmptySearchView();
    } else if (noResults) {
      content = const NoResultsView();
    } else {
      content = SearchResultsView(
        products: filteredProducts,
        imageUrl: productImageUrl,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              onChanged: _searchProducts,
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(child: content),
        ],
      ),
    );
  }
}
