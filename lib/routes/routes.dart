import 'package:adv_flutter_exam1/view/screens/home_screen.dart';
import 'package:adv_flutter_exam1/view/screens/like_screen.dart';
import 'package:adv_flutter_exam1/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyRoutes{
  static Map<String, Widget Function(BuildContext)> myRoutes = {
    '/' : (context) => const SplashScreen(),
    '/home' : (context) => const HomeScreen(),
    '/like' : (context) => const LikeScreen(),
  };
}