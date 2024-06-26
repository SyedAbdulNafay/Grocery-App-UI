import 'package:flutter/material.dart';
import 'package:grocery_app_ui/pages/account.dart';
import 'package:grocery_app_ui/pages/cart.dart';
import 'package:grocery_app_ui/pages/explore.dart';
import 'package:grocery_app_ui/pages/favourite.dart';
import 'package:grocery_app_ui/pages/shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const Shop(),
      const Explore(),
      const Cart(),
      const Favourite(),
      const Account()
    ];
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: selectedIndex,
        onTap: navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined,), label: "Shop"),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_search_rounded), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_rounded), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
