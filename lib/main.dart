import 'package:flutter/material.dart';
import 'package:rasabali1/res/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasabali1/splah/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter App',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
