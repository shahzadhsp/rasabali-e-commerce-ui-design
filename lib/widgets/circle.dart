import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCircleList extends StatelessWidget {
  final List<CategoryItem> categories = [
    CategoryItem(name: 'All', image: 'assets/images/1.png'),
    CategoryItem(name: 'Odia Mitha', image: 'assets/images/5.png'),
    CategoryItem(name: 'Low Guilt bakes', image: 'assets/images/1.png'),
    CategoryItem(name: 'Snacks', image: 'assets/images/5.png'),
    CategoryItem(name: 'Drinks & Detox', image: 'assets/images/1.png'),
    CategoryItem(name: 'Veg khana by kilo', image: 'assets/images/5.png'),
    CategoryItem(name: 'Non Veg khana by kilo', image: 'assets/images/1.png'),
  ];

  CategoryCircleList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          final item = categories[index];
          return Container(
            decoration: BoxDecoration(
                color: index == 0 ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                )),
            child: GestureDetector(
              onTap: () {
                switch (item.name) {
                  case 'All':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All category tapped')),
                    );
                    break;
                  case 'Odia Mitha':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Odia Mitha tapped')),
                    );
                    break;
                  case 'Low Guilt bakes':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Low Guilt bakes tapped')),
                    );
                    break;
                  case 'Snacks':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Snacks tapped')),
                    );
                    break;
                  case 'Drinks & Detox':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Drinks & Detox tapped')),
                    );
                    break;
                  case 'Veg khana by kilo':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Veg khana tapped')),
                    );
                    break;
                  case 'Non Veg khana by kilo':
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Non Veg khana tapped')),
                    );
                    break;
                  default:
                    print('${item.name} tapped');
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Column(
                  children: [
                    Container(
                      width: 61,
                      height: 80.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(item.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: 70,
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final String image;
  CategoryItem({
    required this.name,
    required this.image,
  });
}

final List<CategoryItem> categories = [
  CategoryItem(name: 'All', image: 'assets/images/1.png'),
  // CategoryItem(name: 'Odia Mitha', image: 'assets/images/5.png'),
  CategoryItem(name: 'Low Guilt bakes', image: 'assets/images/1.png'),
  CategoryItem(name: 'Low Guilt bakes', image: 'assets/images/1.png'),

  // CategoryItem(name: 'Snacks', image: 'assets/images/5.png'),
  CategoryItem(name: 'Drinks & Detox', image: 'assets/images/1.png'),
  // CategoryItem(name: 'Veg khana by kilo', image: 'assets/images/5.png'),
  CategoryItem(name: 'Non Veg khana by kilo', image: 'assets/images/1.png'),
];
