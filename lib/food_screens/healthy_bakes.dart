import 'package:flutter/material.dart';
import 'package:rasabali1/product_details.dart/detail.dart';

class HealthyBakesStore extends StatelessWidget {
  late final String? flavor;

  HealthyBakesStore({super.key, this.flavor});

  final List<String> categories = const [
    "Gluten-Free",
    "Vegan",
    "Low-Sugar",
    "Protein-Rich",
    "Keto-Friendly",
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> displayCategories =
        flavor != null ? [flavor!] : categories;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          flavor != null ? '$flavor Bakes' : 'Healthy Bake Categories',
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
                  _buildBakeList(context, category),
                  const SizedBox(height: 24),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildBakeList(BuildContext context, String category) {
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
      case 'Gluten-Free':
        return [
          {
            'name': 'Gluten-Free Chocolate Cake',
            'imageUrl': 'assets/images/1.png',
            'description': 'Moist chocolate cake made with almond flour.',
            'rating': 4.8,
          },
          {
            'name': 'Gluten-Free Banana Muffins',
            'imageUrl': 'assets/images/2.png',
            'description': 'Naturally sweetened banana muffins.',
            'rating': 4.7,
          },
        ];
      case 'Vegan':
        return [
          {
            'name': 'Vegan Brownies',
            'imageUrl': 'assets/images/2.png',
            'description': 'Fudgy brownies with flax eggs and coconut oil.',
            'rating': 4.6,
          },
          {
            'name': 'Vegan Carrot Cake',
            'imageUrl': 'assets/images/1.png',
            'description':
                'Spiced carrot cake with vegan cream cheese frosting.',
            'rating': 4.7,
          },
        ];
      case 'Low-Sugar':
        return [
          {
            'name': 'Sugar-Free Lemon Bars',
            'imageUrl': 'assets/images/1.png',
            'description': 'Tart lemon bars sweetened with stevia.',
            'rating': 4.5,
          },
          {
            'name': 'Low-Sugar Apple Crisp',
            'imageUrl': 'assets/images/1.png',
            'description': 'Warm apple crisp with a crunchy oat topping.',
            'rating': 4.6,
          },
        ];
      case 'Protein-Rich':
        return [
          {
            'name': 'Protein Peanut Butter Cookies',
            'imageUrl': 'assets/images/2.png',
            'description': 'High-protein cookies packed with peanut butter.',
            'rating': 4.7,
          },
          {
            'name': 'Protein Brownies',
            'imageUrl': 'assets/images/5.png',
            'description': 'Rich brownies boosted with whey protein.',
            'rating': 4.6,
          },
        ];
      case 'Keto-Friendly':
        return [
          {
            'name': 'Keto Cheesecake Bites',
            'imageUrl': 'assets/images/1.png',
            'description': 'Mini cheesecakes sweetened with erythritol.',
            'rating': 4.8,
          },
          {
            'name': 'Keto Chocolate Muffins',
            'imageUrl': 'assets/images/3.png',
            'description':
                'Low-carb chocolate muffins made with coconut flour.',
            'rating': 4.7,
          },
        ];
      default:
        return [];
    }
  }
}
