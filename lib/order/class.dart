class Order {
  final String orderId;
  final String status;
  final DateTime date;
  final String location;
  final List<OrderItem> items;
  final double total;

  Order({
    required this.orderId,
    required this.status,
    required this.date,
    required this.location,
    required this.items,
    required this.total,
  });
}

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({required this.name, required this.quantity, required this.price});
}
