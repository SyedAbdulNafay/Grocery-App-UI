import 'package:flutter/material.dart';

import 'package:grocery_app_ui/models/local_storage.dart';
import 'package:grocery_app_ui/services/item.dart';

class CartProvider extends ChangeNotifier {
  List<Item> cart = LocalStorage.getList('cart');

  void addToCart(Item item) async {
    cart.add(item);
    await LocalStorage.setList('cart', cart);
    notifyListeners();
  }

  void removeFromCart(Item item) async {
    cart.removeWhere((element) => element.title == item.title);
    await LocalStorage.setList('cart', cart);
    notifyListeners();
  }

  bool isAdded(Item item) {
    return cart.any((element) => element.title == item.title);
  }
}
