import 'package:flutter/material.dart';
import 'package:rasabali1/Cart/cart.dart';
import 'package:rasabali1/Home/home_screen.dart';
import 'package:rasabali1/Profile/profile.dart';
import 'package:rasabali1/categroies/categories.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Color(0xfff4ab3c),
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 12,
        selectedFontSize: 14,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: Color(0xfff4ab3c)),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories', // Corrected typo here
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
