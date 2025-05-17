import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rasabali1/Home/wishlist.dart';
import 'package:rasabali1/food_screens/dessert_store.dart';
import 'package:rasabali1/promo/promo_bar.dart';
import 'package:rasabali1/widgets/buildbox.dart';
import 'package:rasabali1/widgets/circle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCity = 'Delhi';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLocationAndIconsRow(),
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              _buildCategoryList(),
              const SizedBox(height: 16),
              _buildCarousel(),
              const SizedBox(height: 16),
              _buildSpotlightSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationAndIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.location_on, color: Color(0xfff4ab3c)),
            const Text("India,", style: TextStyle(fontSize: 16)),
            const SizedBox(width: 5),
            DropdownButton<String>(
              value: selectedCity,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              style: const TextStyle(color: Colors.black),
              underline: const SizedBox(),
              dropdownColor: Colors.white,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue!;
                });
              },
              items: [
                'Delhi',
                'Mumbai',
                'Bangalore',
                'Kolkata',
                'Chennai',
                'Hyderabad',
              ].map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            )
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border,
                  color: Colors.black, size: 30),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WishlistScreen(),
                    ));
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.whatsapp,
                  color: Colors.green, size: 28),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none,
                  color: Colors.black, size: 30),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Explore Now',
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CategoryCircleList(),
    );
  }

  Widget _buildCarousel() {
    final imageList = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ];

    return CarouselSlider(
      items: imageList
          .map((image) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ))
          .toList(),
      options: CarouselOptions(
        height: 200.0,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
    );
  }

  Widget _buildSpotlightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 7),
          child: Text(
            "In the Spotlight",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Wrap(
            spacing: 15,
            runSpacing: 10,
            children: [
              buildBox('assets/images/1.png', 'Dairy free', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DessertStore()),
                );
              }),
              buildBox('assets/images/2.png', 'Millets', () {}),
              buildBox('assets/images/1.png', 'Parasad by kilo', () {}),
              buildBox('assets/images/5.png', 'Occasion', () {}),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.only(left: 7),
          child: Text(
            "Best Sellers",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        _buildBestSellersSection(),
        const SizedBox(height: 20),
        const PromoBanner(),
      ],
    );
  }

  Widget _buildBestSellersSection() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/images/5.png',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
