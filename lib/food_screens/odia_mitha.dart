import 'package:flutter/material.dart';
import 'package:rasabali1/product_details.dart/detail.dart';

class OdiaMithaStore extends StatelessWidget {
  late final String? category;

  OdiaMithaStore({super.key, this.category});

  final List<String> categories = const [
    "Chhena Poda",
    "Rasagola",
    "Chhena Jhili",
    "Khurma",
    "Pitha",
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> displayCategories =
        category != null ? [category!] : categories;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          category != null ? '$category Specials' : 'Odia Mitha Categories',
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: displayCategories.map((cat) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cat,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildMithaList(context, cat),
                  const SizedBox(height: 24),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildMithaList(BuildContext context, String category) {
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
      case 'Chhena Poda':
        return [
          {
            'name': 'Classic Chhena Poda',
            'imageUrl': 'assets/images/1.png',
            'description': 'Caramelized baked cheese dessert with cardamom.',
            'rating': 4.9,
          },
          {
            'name': 'Dry Fruit Chhena Poda',
            'imageUrl': 'assets/images/3.png',
            'description': 'Baked delight with raisins, cashews & almonds.',
            'rating': 4.8,
          },
        ];
      case 'Rasagola':
        return [
          {
            'name': 'Odia Rasagola',
            'imageUrl': 'assets/images/1.png',
            'description': 'Soft, spongy syrup-soaked chhena balls.',
            'rating': 4.8,
          },
          {
            'name': 'Brown Rasagola',
            'imageUrl': 'assets/images/2.png',
            'description': 'Traditional version made with caramelized syrup.',
            'rating': 4.7,
          },
        ];
      case 'Chhena Jhili':
        return [
          {
            'name': 'Chhena Jhili (Nimapada)',
            'imageUrl': 'assets/images/3.png',
            'description': 'Fried chhena balls soaked in light sugar syrup.',
            'rating': 4.7,
          },
        ];
      case 'Khurma':
        return [
          {
            'name': 'Sweet Khurma',
            'imageUrl': 'assets/images/1.png',
            'description': 'Fried crunchy bites coated in sugar crystals.',
            'rating': 4.6,
          },
          {
            'name': 'Gur Khurma',
            'imageUrl': 'assets/images/3.png',
            'description': 'Khurma glazed in jaggery syrup.',
            'rating': 4.5,
          },
        ];
      case 'Pitha':
        return [
          {
            'name': 'Arisa Pitha',
            'imageUrl': 'assets/images/2.png',
            'description': 'Crispy rice cake fried in ghee and sweetened.',
            'rating': 4.7,
          },
          {
            'name': 'Poda Pitha',
            'imageUrl': 'assets/images/5.png',
            'description':
                'Baked rice-coconut cake, typically made during Raja.',
            'rating': 4.8,
          },
        ];
      default:
        return [];
    }
  }
}
