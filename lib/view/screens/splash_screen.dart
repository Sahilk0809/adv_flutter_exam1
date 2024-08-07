import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushNamed('/home');
      },
    );
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.network(
        'https://s3.envato.com/files/253780705/PNG%20394%20x%20700/1-Splash.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
