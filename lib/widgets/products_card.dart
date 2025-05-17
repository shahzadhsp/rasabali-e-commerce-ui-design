import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Listproducts() {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Escape',
      'imageUrl': 'assets/images/2.jpg',
      'subtitle': 'Paperback',
      'rating': 4.1,
    },
    {
      'name': 'Killer',
      'imageUrl': 'assets/images/1.jpg',
      'rating': 4.2,
      'subtitle': 'Paperback',
    },
    {
      'name': 'Awakings',
      'imageUrl': 'assets/images/pizza.png',
      'rating': 4.4,
      'subtitle': 'Paperback',
    },
    {
      'name': 'Trails',
      'imageUrl': 'assets/images/1.jpg',
      'subtitle': 'Paperback',
      'rating': 4.6,
    },
  ];

  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      final double rating = product['rating'];
      final int fullStars = rating.floor();

      return GestureDetector(
        onTap: () {},
        child: Card(
          color: Colors.white,
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  product['imageUrl'],
                  height: 150,
                  width: 120,
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
                        product['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ...List.generate(5, (starIndex) {
                            return Icon(
                              Icons.star,
                              size: 20,
                              color: starIndex < fullStars
                                  ? Colors.yellow
                                  : Colors.grey[300],
                            );
                          }),
                          const SizedBox(width: 8),
                          Text(
                            '${product['rating']}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product['subtitle'],
                        maxLines: 3,
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
    },
  );
}
