import 'package:flutter/material.dart';
import 'package:shopping_app/splash/splash_page.dart';

import 'dashboard/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorBrightness: Brightness.dark,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
