import 'package:flutter/material.dart';
import 'package:grocery_app_ui/pages/account.dart';
import 'package:grocery_app_ui/pages/cart.dart';
import 'package:grocery_app_ui/pages/explore.dart';
import 'package:grocery_app_ui/pages/favourite.dart';
import 'package:grocery_app_ui/pages/shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> cart = [];

  void addItemToCart(Map<String, dynamic> item) {
    setState(() {
      cart.add(item);
    });
  }

  navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Shop(
        cart: cart,
        onAddItemToCart: addItemToCart,
      ),
      Explore(
          cart: cart,
          onAddItemToCart: addItemToCart),
      Cart(
        cart: cart,
      ),
      const Favourite(),
      const Account()
    ];
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.storefront_outlined), label: "Shop"),
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
