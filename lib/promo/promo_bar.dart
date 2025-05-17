import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Expanded(
          child: _PromoBox(
            icon: Icons.verified,
            text: '100% Safe & Secure Payments',
          ),
        ),
        VerticalDivider(
          color: Colors.grey,
          thickness: 1,
          width: 1,
        ),
        Expanded(
          child: _PromoBox(
            icon: Icons.timer,
            text: 'On Time Assured Delivery',
          ),
        ),
        VerticalDivider(
          color: Colors.grey,
          thickness: 1,
          width: 1,
        ),
        Expanded(
          child: _PromoBox(
            icon: Icons.emoji_emotions,
            text: '7+ Million Smiles Delivered',
          ),
        ),
      ],
    );
  }
}

class _PromoBox extends StatelessWidget {
  final IconData icon;
  final String text;

  const _PromoBox({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: Color(0xfff4ab3c),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
