import 'package:flutter/material.dart';
import 'package:rasabali1/categroies/sub_categroies.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth * 0.05;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Align(
                alignment: Alignment.topLeft,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: padding),
                children: [
                  _buildCategoryTile(
                    icon: Icons.local_pizza,
                    title: 'Dessert Store',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubcategoriesScreen(
                              categoryName: 'Dessert Store'),
                        ),
                      );
                    },
                  ),
                  _buildCategoryTile(
                    icon: Icons.cake, // changed icon for variety
                    title: 'Healthy Bakes',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubcategoriesScreen(
                              categoryName: 'Healthy Bakes'),
                        ),
                      );
                    },
                  ),
                  _buildCategoryTile(
                    icon: Icons.fastfood,
                    title: 'Odia Mitha',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubcategoriesScreen(
                              categoryName: 'Odia Mitha'),
                        ),
                      );
                    },
                  ),
                  _buildCategoryTile(
                    icon: Icons.lunch_dining,
                    title: 'Odia Meals & Bulk Food',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SubcategoriesScreen(
                              categoryName: 'Odia Meals & Bulk Food'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Color(0xfff4ab3c)),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
