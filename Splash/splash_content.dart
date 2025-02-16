import 'dart:async';
import 'package:flutter/material.dart';

import '../variable.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), _navigateToHome);
  }

  void _navigateToHome() {
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Prevents memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkest,
      body: Center(
        child: Image.asset(
          'assets/images/Splash_logo.jpg', 
          height: MediaQuery.of(context).size.height * 0.3, // Responsive height
        ),
      ),
    );
  }
}
