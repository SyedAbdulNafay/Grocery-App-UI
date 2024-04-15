import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier{
  List<Map<String, dynamic>> favourite = [];

  void addToFavourite(Map<String, dynamic> item){
    favourite.add(item);
    notifyListeners();
  }

  void removeFromFavourite(Map<String, dynamic> item){
    favourite.removeWhere((element) => element['title'] == item['title']);
    notifyListeners();
  }

  bool isFavourite(Map<String, dynamic> item){
    return favourite.any((element) => element['title'] == item['title']);
  }
}