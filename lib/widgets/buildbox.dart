import 'package:flutter/material.dart';

Widget buildBox(String imagePath, String label, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: 70, // ✅ fixed width for ~4 per line
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
