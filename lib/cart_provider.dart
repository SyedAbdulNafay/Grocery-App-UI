import 'package:flutter/material.dart';
import 'package:grocery_app_ui/item.dart';

class CartProvider extends ChangeNotifier {
  List<Item> cart = [];

  void addToCart(Item item) {
    cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Item item) {
    cart.removeWhere((element) => element.title == item.title);
    notifyListeners();
  }

  bool isAdded(Item item) {
    return cart.any((element) => element.title == item.title);
  }
}
