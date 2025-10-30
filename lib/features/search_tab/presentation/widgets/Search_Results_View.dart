import 'package:flutter/material.dart';

class SearchResultsView extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final String imageUrl;

  const SearchResultsView({
    super.key,
    required this.products,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            product['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              Text("\$${product['price']}"),
              if (product['discount'] != null) ...[
                const SizedBox(width: 6),
                Text(
                  "-${product['discount']}",
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
          trailing: const Icon(Icons.arrow_outward),
        );
      },
    );
  }
}
