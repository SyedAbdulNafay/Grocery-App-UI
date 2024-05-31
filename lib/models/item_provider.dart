import 'package:flutter/material.dart';
import 'package:grocery_app_ui/services/item.dart';

class ItemProvider extends ChangeNotifier{
  Item _item;

  ItemProvider(this._item);

  Item get item => _item;

  set item (Item newItem){
    _item = newItem;
    notifyListeners();
  }

  void incrementCount(Item item){
    item.count++;
    notifyListeners();
  }

  void decrementCount(Item item){
    if (item.count > 0) {
      item.count--;
    }
    notifyListeners();
  }
}