import 'package:flutter/material.dart';
import 'package:grocery_app_ui/item.dart';

class FavouriteProvider extends ChangeNotifier{
  List<Item> favourite = [];

  void addToFavourite(Item item){
    favourite.add(item);
    notifyListeners();
  }

  void removeFromFavourite(Item item){
    favourite.removeWhere((element) => element.title == item.title);
    notifyListeners();
  }

  bool isFavourite(Item item){
    return favourite.any((element) => element.title == item.title);
  }
}