import 'package:flutter/material.dart';
import 'screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Library Tracker',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
