import 'package:flutter/material.dart';
import 'package:rasabali1/splah/splashscreennn.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        isLastPage = _controller.page?.round() == 3;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            children: [
              buildPage(
                image: 'assets/images/logo.png',
                title: 'Dishover',
                subtitle: '',
                size: size,
              ),
              buildPage(
                image: 'assets/images/pizza.png',
                title: 'Fresh Meals',
                subtitle:
                    'Discover fresh, healthy meals delivered straight to your door.',
                size: size,
              ),
              buildPage(
                image: 'assets/images/burger.png',
                title: 'Quick Delivery',
                subtitle: 'Get your meals delivered quickly and conveniently.',
                size: size,
              ),
              buildPage(
                image: 'assets/images/1.jpg',
                title: 'Start Today!',
                subtitle: 'Start your culinary journey with us today!',
                size: size,
              ),
            ],
          ),
          Positioned(
            bottom: 300,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xfff4ab3c),
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                  ),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    if (isLastPage) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    } else {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    isLastPage ? 'Get Started' : 'Next',
                    style: TextStyle(fontSize: 16, color: Color(0xfff4ab3c)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage({
    required String image,
    required String title,
    required String subtitle,
    required Size size,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 122),
          Image.asset(
            image,
            height: size.height * 0.2, // ~30% of screen height
            fit: BoxFit.contain,
          ),
          SizedBox(height: 30),
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.4,
              ),
            ),
          ),
          Spacer(), // pushes everything up, keeps bottom area clear
        ],
      ),
    );
  }
}
