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
  List<Map<String, dynamic>> favourite = [];

  void addItemToCart(Map<String, dynamic> item) {
    setState(() {
      cart.add(item);
    });
  }

  void addItemToFavourite(Map<String, dynamic> item) {
    setState(() {
      favourite.add(item);
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
        onAddItemToFavourite: addItemToFavourite,
        favourite: favourite,
        cart: cart,
        onAddItemToCart: addItemToCart,
      ),
      Explore(
          favourtie: favourite,
          cart: cart,
          onAddItemToCart: addItemToCart,
          onAddItemToFavourite: addItemToFavourite),
      Cart(
        cart: cart,
      ),
      Favourite(onAddItemToFavourite: addItemToFavourite, favourite: favourite),
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
