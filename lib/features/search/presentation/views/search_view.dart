import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojectstorio/core/utils/app_styles.dart';
import 'package:gradprojectstorio/features/product_details/presentation/views/product_details_view.dart';
import 'package:gradprojectstorio/features/search/presentation/widgets/empty_search_view.dart';
import 'package:gradprojectstorio/features/search/presentation/widgets/no_results_view.dart';
import 'package:gradprojectstorio/features/search/presentation/widgets/search_results_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/Product_Cubit.dart';
import 'package:gradprojectstorio/features/home/presentation/cubit/product_state.dart';
import 'package:gradprojectstorio/features/home/domain/entities/product_entity.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductEntity> filteredProducts = [];
  List<String> recentSearches = [];

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
  }

  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches = prefs.getStringList('recent_searches') ?? [];
    });
  }

  Future<void> _addToRecentSearches(String query) async {
    if (query.trim().isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches.remove(query);
      recentSearches.insert(0, query);
      if (recentSearches.length > 5) recentSearches.removeLast();
    });
    await prefs.setStringList('recent_searches', recentSearches);
  }

  Future<void> _clearAllRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches.clear();
    });
    await prefs.remove('recent_searches');
  }

  Future<void> _removeRecentSearch(String query) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      recentSearches.remove(query);
    });
    await prefs.setStringList('recent_searches', recentSearches);
  }

  void _searchProducts(String query, {bool save = false}) {
    final state = context.read<ProductCubit>().state;
    if (state is ProductLoaded) {
      final allProducts = state.products;

      if (query.isEmpty) {
        setState(() {
          filteredProducts = [];
        });
        return;
      }

      final results = allProducts
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();

      setState(() {
        filteredProducts = results;
      });

      if (save) _addToRecentSearches(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool noResults =
        _searchController.text.isNotEmpty && filteredProducts.isEmpty;

    Widget content;

    if (_searchController.text.isEmpty) {
      content = EmptySearchView(
        recentSearches: recentSearches,
        onRecentTap: (search) {
          _searchController.text = search;
          _searchProducts(search, save: true);
        },
        onClearAll: _clearAllRecentSearches,
        onRemoveItem: _removeRecentSearch,
      );
    } else if (noResults) {
      content = const NoResultsView();
    } else {
      content = SearchResultsView(
        products: filteredProducts,
        onProductTap: (ProductEntity product) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailsView(product: product),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Search", style: AppStyles.textSemiBold24),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24.w),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              onChanged: (value) {
                _searchProducts(value, save: false);
              },
              onSubmitted: (value) {
                _searchProducts(value, save: true);
              },
              decoration: InputDecoration(
                hintText: "Search products...",
                prefixIcon: const Icon(Icons.search),
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
