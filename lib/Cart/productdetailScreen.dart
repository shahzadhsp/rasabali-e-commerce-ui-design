import 'package:flutter/material.dart';

class PRoductDetailScreen extends StatefulWidget {
  const PRoductDetailScreen({super.key});

  @override
  State<PRoductDetailScreen> createState() => _PRoductDetailScreenState();
}

class _PRoductDetailScreenState extends State<PRoductDetailScreen>
    with SingleTickerProviderStateMixin {
  int quantity = 1;
  String selectedPlace = 'Choose an option';
  final List<String> places = [
    'Choose an option',
    'Bhubaneswar',
    'Cuttack',
    'Puri',
  ];
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  void updateQuantity(bool increase) {
    setState(() {
      if (increase) {
        quantity++;
      } else if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and thumbnails
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/1.jpg',
                        width: 60, height: 60, fit: BoxFit.cover),
                    const SizedBox(height: 8),
                    Image.asset('assets/images/1.jpg',
                        width: 60, height: 60, fit: BoxFit.cover),
                    const SizedBox(height: 8),
                    Image.asset('assets/images/1.jpg',
                        width: 60, height: 60, fit: BoxFit.cover),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Image.asset('assets/images/1.jpg',
                      height: 200, fit: BoxFit.cover),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Title and subtitle
            const Text(
              "Puran Poli",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Puran Poli has sweet lentil stuffing. On holidays and special events...",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 12),

            // Price
            const Text(
              "₹159.00 – ₹239.00",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            const SizedBox(height: 12),

            // Quantity selector

            const SizedBox(height: 20),

            TabBar(
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                color: Color(0xfff4ab3c),
                borderRadius: BorderRadius.circular(4),
              ),
              tabs: const [
                Tab(text: "Description"),
                Tab(text: "Additional Information"),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: TabBarView(
                controller: tabController,
                children: [
                  // Description tab
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Healthy flat bread Puran Poli made with whole wheat flour and sweetened chana dal stuffing.\n",
                        ),
                        Text(
                            "Ingredients: Whole Wheat Flour, Cow Ghee, Jaggery, etc."),
                        SizedBox(height: 10),
                        Text("Storage Instructions: Store in chiller at 0-4°C"),
                      ],
                    ),
                  ),

                  const Center(
                    child:
                        Text("Shelf life: 4-7 days\nCountry of Origin: India"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
