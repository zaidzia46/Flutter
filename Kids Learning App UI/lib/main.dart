import 'package:flutter/material.dart';
import 'package:kids_app/splash/splash_screen.dart';

import 'main/home_screen.dart';
import 'main/tutor_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids learning app',
      home: SplashScreen(),
    );
  }
}
