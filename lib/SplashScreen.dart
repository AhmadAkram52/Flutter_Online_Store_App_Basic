import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_store/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Image(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/images/Splash.png',
        ),
        // width: size.width,
      ),
    );
  }
}
