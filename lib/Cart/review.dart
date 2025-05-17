import 'package:flutter/material.dart';
import 'package:rasabali1/thanks/thanks.dart';

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // AppBar replacement
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text("Checkout",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 48), // balances the back button
                ],
              ),
              const SizedBox(height: 16),
              // Step indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _stepIcon(true, "Shipping"),
                  _stepLine(),
                  _stepIcon(true, "Payment"),
                  _stepLine(),
                  _stepIcon(false, "Review"),
                ],
              ),
              const SizedBox(height: 16),
              // Expandable scrollable section
              Expanded(
                child: ListView(
                  children: [
                    _sectionCard(
                      title: "Order Summary",
                      child: Column(
                        children: [
                          _summaryRow("Subtotal", "\$150.00"),
                          _summaryRow("Delivery", "\$9.90"),
                          const Divider(),
                          _summaryRow("Total", "\$159.90", bold: true),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Please confirm and submit your order",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "By clicking submit order, you agree to Terms of Use and Privacy Policy",
                      style: TextStyle(color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    _sectionCard(
                      title: "Payment",
                      trailing: const Text("Edit",
                          style: TextStyle(color: Color(0xfff4ab3c))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Image.asset('assets/images/logo.png', height: 24),
                            const SizedBox(width: 8),
                            const Text("•••• •••• •••• 6522"),
                          ]),
                          const Text("07/23"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _sectionCard(
                      title: "Shipping address",
                      trailing: const Text("Edit",
                          style: TextStyle(color: Color(0xfff4ab3c))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _summaryRow("Name", "Hikmet Alçeken"),
                          _summaryRow("Street", "1234 Street"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Submit button pinned at bottom
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThanksPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfff4ab3c),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Submit Order",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepIcon(bool done, String label) {
    return Column(
      children: [
        Icon(Icons.check_circle,
            color: done ? Color(0xfff4ab3c) : Colors.grey, size: 28),
        const SizedBox(height: 4),
        Text(label,
            style: TextStyle(
                color: done ? Colors.black : Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _stepLine() {
    return Container(
      width: 20,
      height: 2,
      color: Colors.grey.shade300,
    );
  }

  Widget _sectionCard(
      {required String title, required Widget child, Widget? trailing}) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                if (trailing != null) trailing,
              ],
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(value,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14)),
        ],
      ),
    );
  }
}
