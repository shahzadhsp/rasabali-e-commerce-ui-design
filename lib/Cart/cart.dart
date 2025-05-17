import 'package:flutter/material.dart';
import 'package:rasabali1/Cart/checkout.dart';
import 'package:rasabali1/Cart/productdetailScreen.dart';

// Cart item model
class CartItem {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  int quantity;
  String selectedPlace;

  CartItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
    this.selectedPlace = 'Choose an option',
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> places = ['Choose an option', 'Bhubaneswar', 'Cuttack', 'Puri'];

  List<CartItem> cartItems = [
    CartItem(
      name: 'Puran Poli',
      description: 'Sweet lentil flatbread with chana dal stuffing',
      price: 159.0,
      imagePath: 'assets/images/1.jpg',
    ),
    CartItem(
      name: 'Modak',
      description: 'Steamed dumpling with coconut and jaggery filling',
      price: 129.0,
      imagePath: 'assets/images/1.jpg',
    ),
  ];

  double get totalPrice => cartItems.fold(
        0.0,
        (sum, item) => sum + item.price * item.quantity,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: const Text("Cart")),
        backgroundColor: Color(0xfff4ab3c),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListView.builder(
              itemCount: cartItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PRoductDetailScreen(),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.imagePath,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Text(
                                  item.description,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "₹${item.price.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xfff4ab3c),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                DropdownButton<String>(
                                  isExpanded: true,
                                  value: item.selectedPlace,
                                  items: places
                                      .map((place) => DropdownMenuItem(
                                            value: place,
                                            child: Text(place),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      item.selectedPlace = value!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Text("Quantity: "),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (item.quantity > 1) {
                                            item.quantity--;
                                          }
                                        });
                                      },
                                    ),
                                    Text(item.quantity.toString()),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          item.quantity++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Total and Checkout Button
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Total:',
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text(
                        "₹${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xfff4ab3c),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutStepperScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff4ab3c),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Proceed to Checkout",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
