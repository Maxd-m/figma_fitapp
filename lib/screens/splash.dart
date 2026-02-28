import 'dart:async';
import 'package:flutter/material.dart';
import 'package:figma_fitapp/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: const [
            Image(image: AssetImage('assets/welcome.png')),
            Image(image: AssetImage('assets/Logo.png')),
            Image(image: AssetImage('assets/fitbody.png')),
            SizedBox(height: 20),
            Image(
              image: AssetImage('assets/loading1.gif'),
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
