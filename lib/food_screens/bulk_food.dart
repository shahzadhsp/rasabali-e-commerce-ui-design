import 'package:flutter/material.dart';
import 'package:rasabali1/product_details.dart/detail.dart';

class BulkFoodsStore extends StatelessWidget {
  late final String? category;

  BulkFoodsStore({super.key, this.category});

  final List<String> categories = const [
    'Rice',
    'Daal',
    'Curd',
    'Fried Snacks',
    'Curries',
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
          category != null ? '$category Bulk Foods' : 'Bulk Food Categories',
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
                  _buildFoodList(context, cat),
                  const SizedBox(height: 24),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildFoodList(BuildContext context, String category) {
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
      case 'Rice':
        return [
          {
            'name': 'Steamed Rice',
            'imageUrl': 'assets/images/1.png',
            'description': 'Fluffy, aromatic basmati rice.',
            'rating': 4.7,
          },
          {
            'name': 'Brown Rice',
            'imageUrl': 'assets/images/2.png',
            'description': 'Healthy whole grain brown rice.',
            'rating': 4.6,
          },
        ];
      case 'Daal':
        return [
          {
            'name': 'Yellow Daal',
            'imageUrl': 'assets/images/2.png',
            'description': 'Comforting yellow lentil curry.',
            'rating': 4.8,
          },
          {
            'name': 'Black Daal',
            'imageUrl': 'assets/images/3.png',
            'description': 'Rich and creamy black lentil curry.',
            'rating': 4.7,
          },
        ];
      case 'Curd':
        return [
          {
            'name': 'Homemade Curd',
            'imageUrl': 'assets/images/5.png',
            'description': 'Fresh and creamy homemade curd.',
            'rating': 4.6,
          },
          {
            'name': 'Greek Yogurt',
            'imageUrl': 'assets/images/5.png',
            'description': 'Thick, protein-packed Greek yogurt.',
            'rating': 4.7,
          },
        ];
      case 'Fried Snacks':
        return [
          {
            'name': 'Samosa',
            'imageUrl': 'assets/images/1.png',
            'description': 'Crispy fried pastry with spiced filling.',
            'rating': 4.8,
          },
          {
            'name': 'Pakora',
            'imageUrl': 'assets/images/2.png',
            'description': 'Golden fried fritters made with chickpea batter.',
            'rating': 4.7,
          },
        ];
      case 'Curries':
        return [
          {
            'name': 'Paneer Butter Masala',
            'imageUrl': 'assets/images/3.png',
            'description': 'Rich tomato-based curry with soft paneer cubes.',
            'rating': 4.9,
          },
          {
            'name': 'Vegetable Korma',
            'imageUrl': 'assets/images/5.png',
            'description': 'Mild creamy curry with mixed vegetables.',
            'rating': 4.8,
          },
        ];
      default:
        return [];
    }
  }
}
