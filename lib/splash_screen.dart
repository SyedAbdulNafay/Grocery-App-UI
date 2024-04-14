import 'package:flutter/material.dart';
import 'package:grocery_app_ui/homepage.dart';
import 'package:grocery_app_ui/onboarding.dart';
import 'dart:async';

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
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Positioned(
                    top: -50, // Adjust the top value to overlap the image with the text
                    child: Image.asset(
                      'assets/Images/nectarLogo.png',
                      width: 267.42,
                      height: 63.61,
                    ),
                  ),
                  const Positioned(
                    top: -30, // Adjust the top value to overlap the text with the image
                    child: Text(
                      "online groceriet",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 25, fontFamily: 'Gilroy'),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}