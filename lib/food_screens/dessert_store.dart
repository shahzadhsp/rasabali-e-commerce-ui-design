import 'package:flutter/material.dart';
import 'package:rasabali1/product_details.dart/detail.dart';

class DessertStore extends StatefulWidget {
  late final String? flavor;

  DessertStore({super.key, this.flavor});

  @override
  State<DessertStore> createState() => _DessertStoreState();
}

class _DessertStoreState extends State<DessertStore> {
  final List<String> categories = const [
    "Cakes",
    "Donuts",
    "Puddings",
    "IceCream",
    "Cookies",
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> displayCategories =
        widget.flavor != null ? [widget.flavor!] : categories;

    return Scaffold(
      backgroundColor: Colors.white,
      // Removed AppBar
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: displayCategories.map((category) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildDessertList(context, category),
                    const SizedBox(height: 24),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDessertList(BuildContext context, String category) {
    final List<Map<String, dynamic>> items = _getItemsForCategory(category);

    return Column(
      children: items.map((item) {
        final double rating = item['rating'];
        final int fullStars = rating.floor();

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  name: item['name'],
                  imageUrl: item['imageUrl'],
                  description: item['description'],
                  rating: item['rating'],
                ),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    item['imageUrl'],
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              Icons.star,
                              size: 18,
                              color: starIndex < fullStars
                                  ? Colors.amber
                                  : Colors.grey[300],
                            );
                          }),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['description'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  List<Map<String, dynamic>> _getItemsForCategory(String category) {
    switch (category) {
      case 'Cakes':
        return [
          {
            'name': 'Chocolate Cake',
            'imageUrl': 'assets/images/1.png',
            'description': 'Rich chocolate sponge with dark ganache.',
            'rating': 4.8,
          },
          {
            'name': 'Red Velvet Cake',
            'imageUrl': 'assets/images/2.png',
            'description': 'Classic red velvet with cream cheese frosting.',
            'rating': 4.7,
          },
        ];
      case 'Donuts':
        return [
          {
            'name': 'Glazed Donut',
            'imageUrl': 'assets/images/3.png',
            'description': 'Sweet glazed donut with a soft center.',
            'rating': 4.5,
          },
          {
            'name': 'Chocolate Donut',
            'imageUrl': 'assets/images/1.png',
            'description': 'Chocolate-covered donut with sprinkles.',
            'rating': 4.6,
          },
        ];
      case 'Puddings':
        return [
          {
            'name': 'Vanilla Pudding',
            'imageUrl': 'assets/images/5.png',
            'description': 'Creamy vanilla pudding topped with whipped cream.',
            'rating': 4.4,
          },
          {
            'name': 'Chocolate Pudding',
            'imageUrl': 'assets/images/1.png',
            'description': 'Rich chocolate pudding with chocolate shavings.',
            'rating': 4.5,
          },
        ];
      case 'IceCream':
        return [
          {
            'name': 'Vanilla Ice Cream',
            'imageUrl': 'assets/images/1.png',
            'description': 'Classic vanilla ice cream with a smooth texture.',
            'rating': 4.7,
          },
          {
            'name': 'Strawberry Ice Cream',
            'imageUrl': 'assets/images/3.png',
            'description': 'Fresh strawberry ice cream with real berries.',
            'rating': 4.6,
          },
        ];
      case 'Cookies':
        return [
          {
            'name': 'Chocolate Chip Cookie',
            'imageUrl': 'assets/images/2.png',
            'description': 'Soft cookie loaded with chocolate chips.',
            'rating': 4.8,
          },
          {
            'name': 'Oatmeal Raisin Cookie',
            'imageUrl': 'assets/images/1.png',
            'description': 'Chewy oatmeal cookie with plump raisins.',
            'rating': 4.4,
          },
        ];
      default:
        return [];
    }
  }
}
