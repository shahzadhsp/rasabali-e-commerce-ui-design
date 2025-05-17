import 'package:flutter/material.dart';

class CategoryDrawer extends StatefulWidget {
  const CategoryDrawer({Key? key}) : super(key: key);

  @override
  State<CategoryDrawer> createState() => _CategoryDrawerState();
}

class _CategoryDrawerState extends State<CategoryDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, top: 40, bottom: 16),
            child: Text(
              'Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.book,
            text: 'Books',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.movie,
            text: 'Movies & Games',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.computer,
            text: 'Computers & Electronics',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.sports_soccer,
            text: 'Hobbies & Sports',
            onTap: () {},
          ),
          _buildDrawerItem(
            icon: Icons.fastfood,
            text: 'Food & Drink',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Color(0xfff4ab3c)),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
