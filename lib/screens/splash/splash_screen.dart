import 'package:flutter/material.dart';
import 'package:mini_library_tracker/core/utils/shared_prefs.dart';
import '../auth/login_screen.dart';
import '../home/home_screen.dart';
import '../onboarding/get_started_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

 Future<void> _checkLoginStatus() async {
  print('>> [Splash] Checking first open...');
  final firstOpen = await SessionManager.isFirstOpen();
  print('>> [Splash] isFirstOpen: $firstOpen');

  if (firstOpen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const GetStartedScreen()),
    );
    return;
  }

  final loggedIn = await SessionManager.isLoggedIn();
  print('>> [Splash] isLoggedIn: $loggedIn');

  await Future.delayed(const Duration(seconds: 2));

  if (loggedIn) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
