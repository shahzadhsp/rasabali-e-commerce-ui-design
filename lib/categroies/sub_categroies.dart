import 'package:flutter/material.dart';
import 'package:rasabali1/food_screens/bulk_food.dart';
import 'package:rasabali1/food_screens/dessert_store.dart';
import 'package:rasabali1/food_screens/healthy_bakes.dart';
import 'package:rasabali1/food_screens/odia_mitha.dart';

class SubcategoriesScreen extends StatelessWidget {
  final String categoryName;

  const SubcategoriesScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final List<String> subcategories =
        _getSubcategoriesForCategory(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          final subcategory = subcategories[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.arrow_right, color: Color(0xfff4ab3c)),
              title: Text(subcategory),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                if (categoryName == 'Dessert Store') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DessertStore(flavor: subcategory),
                    ),
                  );
                } else if (categoryName == 'Healthy Bakes') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HealthyBakesStore(flavor: subcategory),
                    ),
                  );
                } else if (categoryName == 'Odia Mitha') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OdiaMithaStore(category: subcategory),
                    ),
                  );
                } else if (categoryName == 'Odia Meals & Bulk Food') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BulkFoodsStore(category: subcategory),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('No screen available for $subcategory'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  List<String> _getSubcategoriesForCategory(String category) {
    switch (category) {
      case 'Dessert Store':
        return [
          "Cakes",
          "Donuts",
          "Puddings",
          "Ice Cream",
          "Cookies",
        ];
      case 'Healthy Bakes':
        return [
          'Gluten-Free',
          'Vegan',
          'Low-Sugar',
          'Protein-Rich',
          'Keto-Friendly'
        ];
      case 'Odia Mitha':
        return ['Chhena Poda', 'Rasagola', 'Chhena Jhili', 'Khurma', 'Pitha'];
      case 'Odia Meals & Bulk Food':
        return ['Rice', 'Daal', 'Curd', 'Fried Snacks', 'Curries'];
      default:
        return [];
    }
  }
}
