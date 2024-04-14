import 'package:flutter/material.dart';
import 'package:grocery_app_ui/splash_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromRGBO(83, 177, 117, 1)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}