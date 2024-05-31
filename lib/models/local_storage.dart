import 'dart:convert';

import 'package:grocery_app_ui/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  static int getInt(String key) {
    return prefs.getInt(key) ?? 0;
  }

  static Future setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return prefs.getBool(key) ?? false;
  }

  static Future setDouble(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  static double getDouble(String key) {
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  static String getString(String key) {
    return prefs.getString(key) ?? "null";
  }

  static Future setList(String key, List<Item> value) async {
    List<Map<String, dynamic>> itemList =
        value.map((item) => item.toMap()).toList();
    final json = jsonEncode(itemList);
    await prefs.setString(key, json);
  }

  static List<Item> getList(String key) {
    final json = prefs.getString(key);
    print("step 1");
    if (json == null) {
      print("step 2");
      return [];
    }
    print("step 3");
    List<Map<String, dynamic>> itemList = jsonDecode(json).cast<Map<String, dynamic>>();
    print("step 4");
    return itemList.map((map) => Item.fromMap(map)).toList();
  }

  static Future remove(String key) async {
    await prefs.remove(key);
  }

  static Future clear() async {
    await prefs.clear();
  }
}
