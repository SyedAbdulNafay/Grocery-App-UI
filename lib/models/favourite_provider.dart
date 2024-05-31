import 'package:flutter/material.dart';
import 'package:grocery_app_ui/models/local_storage.dart';
import 'package:grocery_app_ui/services/item.dart';

class FavouriteProvider extends ChangeNotifier {
  List<Item> favourite = LocalStorage.getList('favourite');

  void addToFavourite(Item item) async {
    favourite.add(item);
    await LocalStorage.setList('favourite', favourite);
    notifyListeners();
  }

  void removeFromFavourite(Item item) async {
    favourite.removeWhere((element) => element.title == item.title);
    await LocalStorage.setList('favourite', favourite);
    notifyListeners();
  }

  bool isFavourite(Item item) {
    return favourite.any((element) => element.title == item.title);
  }
}
