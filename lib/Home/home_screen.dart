import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rasabali1/Home/wishlist.dart';
import 'package:rasabali1/food_screens/dessert_store.dart';
import 'package:rasabali1/promo/promo_bar.dart';
import 'package:rasabali1/res/app_colors.dart';
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
      backgroundColor: AppColors.whiTEColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                '17\nMins',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: AppColors.whiTEColor,
                                    ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Delivery to Ghansoli',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                      size: 28.sp,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Power kidz,Power kids,kijamata nagar..',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(height: 2.6),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: Icon(
                            Icons.person,
                            color: AppColors.whiTEColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h),
                    _buildSearchBar(),

                    // _buildLocationAndIconsRow(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              _buildCategoryList(),
              Container(
                height: 200.h,
                color: Colors.yellow.shade300,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 34.h),
                    child: ListView.builder(
                      itemCount: categories.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item = categories[index];
                        return Container(
                          width: 100.w,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/flowers2.png',
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                    Image.asset(
                                      'assets/images/flowers2.png',
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10.r),
                                            topRight: Radius.circular(10.r),
                                          )),
                                      child: Image(
                                        fit: BoxFit.contain,
                                        image:
                                            AssetImage(categories[index].image),
                                      ),
                                    ),
                                    Container(
                                      height: 30.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10.r),
                                            bottomRight: Radius.circular(10.r),
                                          )),
                                      child: Center(
                                          child: Text('price ${index + 10}')),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text('Fresh'),
                              Text('Fruits'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // _buildCarousel(),
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
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "Search for 'Cooker'",
        filled: true,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 20.h,
                width: 2,
                color: Colors.grey.shade500,
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.mic,
                color: Colors.deepOrangeAccent,
              ),
            ],
          ),
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        prefixIcon: Icon(Icons.search, color: Colors.grey),
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
