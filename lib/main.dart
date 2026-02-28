import 'package:figma_fitapp/screens/favorites.dart';
import 'package:figma_fitapp/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:figma_fitapp/screens/splash.dart';
import 'package:figma_fitapp/screens/signup.dart';
import 'package:figma_fitapp/screens/login.dart';
import 'package:figma_fitapp/screens/home.dart';
import 'package:figma_fitapp/screens/help.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        "/signup": (context) => const SignUp(),
        "/login": (context) => const LoginScreen(),
        "/home": (context) => const Home(),
        "/profile": (context) => const Profile(),
        "/favorites": (context) => const Favorites(),
        "/help": (context) => const Help(),
      },
    );
  }
}
