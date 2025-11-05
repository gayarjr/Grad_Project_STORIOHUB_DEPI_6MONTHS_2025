import 'package:flutter/material.dart';
import 'package:gradprojectstorio/core/utils/app_colors.dart';

class EmptySearchView extends StatelessWidget {
  final List<String> recentSearches;
  final Function(String)? onRecentTap;
  final VoidCallback? onClearAll;
  final Function(String)? onRemoveItem;

  const EmptySearchView({
    super.key,
    this.recentSearches = const [],
    this.onRecentTap,
    this.onClearAll,
    this.onRemoveItem,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasRecent = recentSearches.isNotEmpty;

    if (!hasRecent) {
      return const Center(
        child: Text(
          "Search for a product!",
          style: TextStyle(fontSize: 16, color: AppColors.grey),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent Searches",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: onClearAll,
                child: const Text(
                  "Clear all",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Expanded(
            child: ListView.separated(
              itemCount: recentSearches.length,
              separatorBuilder: (_, __) => const Divider(
                height: 1,
                thickness: 0.6,
                color: Color.fromARGB(255, 165, 164, 164),
              ),
              itemBuilder: (context, index) {
                final search = recentSearches[index];
                return InkWell(
                  onTap: () => onRecentTap?.call(search),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            search,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(221, 70, 69, 69),
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        InkWell(
                          onTap: () => onRemoveItem?.call(search),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color.fromARGB(255, 85, 87, 87),
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
