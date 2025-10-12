import 'package:flutter/material.dart';

class Onboarding1Screen extends StatefulWidget {
  const Onboarding1Screen({super.key});

  @override
  State<Onboarding1Screen> createState() => _Onboarding1ScreenState();
}

class _Onboarding1ScreenState extends State<Onboarding1Screen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Onboarding pages data
  final List<Map<String, String>> pages = [
    {
      'title': 'Customer',
      'body':
      'Easily browse and purchase high-quality products with a few clicks. Enjoy a smooth and simple shopping experience designed for you.',
      'image': 'assets/images/onboarding1.png',
    },
    {
      'title': 'Business Owner',
      'body':
      'Manage your store efficiently, track sales, and connect directly with your customers. Empower your business with Innova.',
      'image': 'assets/images/onboarding2.png',
    },
    {
      'title': 'Local Brand Store',
      'body':
      'Every local brand can have its own dedicated store to showcase products and reach customers easily through our platform.',
      'image': 'assets/images/onboarding3.png',
    },
  ];

  // Navigate to next page with animation
  void _goToNextPage() {
    if (_currentPage < pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Finished onboarding')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF126090),
      body: Column(
        children: [
          // App header with app name
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: const Text(
              'Innova',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
              ),
            ),
          ),

          // Onboarding pages
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              physics: const NeverScrollableScrollPhysics(), // Disable all swipe
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                final page = pages[index];
                return Column(
                  children: [
                    // Image card with bottom rounded corners
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.zero,
                            topRight: Radius.zero,
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                          child: Image.asset(
                            page['image']!,
                            width: double.infinity,
                            height: 320,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // Text content
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: const Color(0xFF126090),
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              page['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              page['body']!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Page indicators and navigation button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Page indicators
                Row(
                  children: List.generate(
                    pages.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 22 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                // Next / Get Started button
                TextButton(
                  onPressed: _goToNextPage,
                  child: Row(
                    children: [
                      Text(
                        _currentPage < pages.length - 1
                            ? 'Next'
                            : 'Get Started',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (_currentPage < pages.length - 1) ...[
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

