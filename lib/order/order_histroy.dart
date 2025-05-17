import 'package:flutter/material.dart';
import 'package:rasabali1/order/class.dart';

class OrderHistroy extends StatefulWidget {
  const OrderHistroy({super.key});

  @override
  State<OrderHistroy> createState() => _OrderHistroyState();
}

class _OrderHistroyState extends State<OrderHistroy> {
  final List<Order> orders = [
    Order(
      orderId: "#21421",
      status: "Shipped",
      date: DateTime(2016, 2, 16),
      location: "Palo Alto, California",
      items: [
        OrderItem(name: "Strandmond", quantity: 1, price: 296.63),
        OrderItem(name: "Nockeby", quantity: 1, price: 296.00),
        OrderItem(name: "Mellby", quantity: 3, price: 2248.68),
      ],
      total: 2841.49,
    ),
    Order(
      orderId: "#69314",
      status: "Shipped",
      date: DateTime(2016, 1, 29),
      location: "Palo Alto, California",
      items: [
        OrderItem(name: "Micke", quantity: 5, price: 721.05),
        OrderItem(name: "Strandmond", quantity: 1, price: 296.63),
        OrderItem(name: "Nockeby", quantity: 1, price: 296.00),
      ],
      total: 1313.68,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            color: Colors.white,
            elevation: 2,
            margin: EdgeInsets.only(bottom: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order ${order.orderId}",
                          style: TextStyle(
                              color: Color(0xfff4ab3c),
                              fontWeight: FontWeight.bold)),
                      Text(order.date.toLocal().toString().split(' ')[0],
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(children: [
                    Icon(Icons.local_shipping_outlined,
                        size: 16, color: Colors.black),
                    SizedBox(width: 4),
                    Text(order.status, style: TextStyle(color: Colors.grey)),
                  ]),
                  SizedBox(height: 12),
                  ...order.items.map((item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                item.name,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "${item.quantity} pcs",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "\$${item.price.toStringAsFixed(2)}",
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(children: [
                        Icon(Icons.location_on_outlined,
                            size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(order.location,
                            style: TextStyle(color: Colors.grey)),
                      ]),
                      Text("Total \$${order.total.toStringAsFixed(2)}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
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
