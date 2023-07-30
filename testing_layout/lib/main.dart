import 'package:flutter/material.dart';
import 'package:layout_test/about_us_page.dart';
import 'package:layout_test/signin_page.dart';
import 'package:layout_test/home_page.dart';
import 'package:layout_test/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: ThemeController.instance,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeController.instance.isDarkTheme
                ? ThemeData.dark()
                : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            initialRoute: '/home',
            routes: {
              '/home': (context) => HomePage(),
              '/sign-in': (context) => SigninPage(),
              '/about-us': (context) => AboutUs()
            },
          );
        });
  }
}
