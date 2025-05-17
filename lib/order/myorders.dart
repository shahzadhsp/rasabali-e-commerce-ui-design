import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Example mock data
    final orders = [
      {
        'orderId': 'ORD123456',
        'date': 'May 1, 2025',
        'status': 'Shipped',
        'total': '\$120.00'
      },
      {
        'orderId': 'ORD123457',
        'date': 'April 28, 2025',
        'status': 'Processing',
        'total': '\$89.50'
      },
      {
        'orderId': 'ORD123458',
        'date': 'April 20, 2025',
        'status': 'Delivered',
        'total': '\$45.99'
      },
    ];

    return Scaffold(
      backgroundColor: Color(0xfff4ab3c),
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Orders', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(3)),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order #${order['orderId']}',
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff4ab3c),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date:', style: TextStyle(color: Colors.black)),
                        Text(order['date']!,
                            style:
                                const TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Status:', style: TextStyle(color: Colors.black)),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Color(0xfff4ab3c),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            order['status']!,
                            style: const TextStyle(
                              color: Color(0xfff4ab3c),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:', style: TextStyle(color: Colors.black)),
                        Text(order['total']!,
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Navigate to order details if needed
                        },
                        child: const Text(
                          'View Details',
                          style: TextStyle(color: Color(0xfff4ab3c)),
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
    );
  }
}
