import 'package:flutter/material.dart';
import 'package:grocery_app_ui/cart_provider.dart';
import 'package:grocery_app_ui/favourite_provider.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/item_provider.dart';
import 'package:grocery_app_ui/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => FavouriteProvider())),
        ChangeNotifierProvider(create: ((context) => CartProvider())),
        ChangeNotifierProvider(
            create: ((context) => ItemProvider(
                Item(image: '', title: '', quantity: '', price: 0, detail: '')))),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color(0xFF53B175)),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
