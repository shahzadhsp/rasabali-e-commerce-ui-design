import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final Color primaryColor = const Color(0xfff4ab3c);

  List<Map<String, dynamic>> wishlistItems = [
    {
      'id': '1',
      'name': 'Dairy free',
      'image': 'assets/images/1.png',
      'price': 49.99,
      'quantity': 1,
    },
    {
      'id': '2',
      'name': 'Millets',
      'image': 'assets/images/2.png',
      'price': 79.99,
      'quantity': 1,
    },
  ];
  void addToCart(Map<String, dynamic> item) {
    print('Added to cart: ${item['name']} (Qty: ${item['quantity']})');
  }

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      wishlistItems[index]['quantity'] = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('My Wishlist'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final item = wishlistItems[index];
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item['image'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '\$${item['price']}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Text('Qty:'),
                            const SizedBox(width: 8),
                            DropdownButton<int>(
                              value: item['quantity'],
                              borderRadius: BorderRadius.circular(10),
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              dropdownColor: Colors.white,
                              items: List.generate(10, (i) => i + 1).map((qty) {
                                return DropdownMenuItem(
                                  value: qty,
                                  child: Text(qty.toString()),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  updateQuantity(index, value);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => addToCart(item),
                    child: const Text(
                      'Add',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
