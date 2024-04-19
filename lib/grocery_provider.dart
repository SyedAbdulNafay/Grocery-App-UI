import 'dart:ui';
import 'package:grocery_app_ui/item.dart';

List<Map<String, dynamic>> groceryCategories = [
  {
    "title": "Pulses",
    "image": "assets/Images/pulses.png",
    "color": const Color.fromRGBO(83, 177, 117, 0.1),
    "items": pulses
  },
  {
    "title": "Rice",
    "image": "assets/Images/sack-of-rice.png",
    "color": const Color.fromRGBO(83, 177, 117, 1),
    "items": rice
  },
  {
    "title": "Fresh Fruits & Vegetable",
    "image": "assets/Images/fruit_basket.png",
    "color": const Color.fromRGBO(83, 177, 117, 0.1),
    "items": fruitsAndVeg
  },
  {
    "title": "Cooking Oil & Ghee",
    "image": "assets/Images/oils.png",
    "color": const Color.fromRGBO(248, 164, 176, 0.1),
    "items": oils
  },
  {
    "title": "Meat & Fish",
    "image": "assets/Images/meat.png",
    "color": const Color.fromRGBO(247, 165, 147, 0.25),
    "items": meat
  },
  {
    "title": "Bakery & Snacks",
    "image": "assets/Images/bakery.png",
    "color": const Color.fromRGBO(211, 176, 224, 0.25),
    "items": bakery
  },
  {
    "title": "Dairy & Eggs",
    "image": "assets/Images/dairy.png",
    "color": const Color.fromRGBO(253, 229, 152, 0.25),
    "items": dairy
  },
  {
    "title": "Beverages",
    "image": "assets/Images/beverages.png",
    "color": const Color.fromRGBO(183, 223, 245, 0.25),
    "items": beverages
  },
];

List<Item> beverages = [
  Item(image: "assets/Images/dietcoke_can.png", title: "Diet Coke", quantity: "355ml", price: 1.99),
  Item(image: "assets/Images/sprite_can.png", title: "Sprite Can", quantity: "325ml", price: 1.50),
  Item(image: "assets/Images/apple_juice.png", title: "Apple & Grape Juice", quantity: "2L", price: 15.99),
  Item(image: "assets/Images/orange_juice.png", title: "Orange Juice", quantity: "2L", price: 15.99),
  Item(image: "assets/Images/coke_can.png", title: "Coca Cola Can", quantity: "325ml", price: 4.99),
  Item(image: "assets/Images/pepsi_can.png", title: "Pepsi Can", quantity: "330ml", price: 4.99),
];

List<Item> pulses = [
  Item(image: 'assets/Images/black_beans.png', title: "Black Beans", quantity: "500g", price: 220),
  Item(image: 'assets/Images/chanay.png', title: "Chanay Dal", quantity: "500g", price: 220),
  Item(image: 'assets/Images/chickpeas.png', title: "Chickpeas", quantity: "500g", price: 220),
  Item(image: 'assets/Images/kidney_beans.png', title: "Kidney Beans", quantity: "500g", price: 220),
  Item(image: 'assets/Images/lobia.png', title: "Black Eyed Peas", quantity: "500g", price: 220),
  Item(image: 'assets/Images/masoor_daal.png', title: "Masoor Dal", quantity: "500g", price: 220),
  Item(image: 'assets/Images/soybean.png', title: "Soy Beans", quantity: "500g", price: 220),
];

List<Item> rice = [
  Item(image: 'assets/Images/arborio_rice.png', title: "Arborio Rice", quantity: "1kg", price: 500),
  Item(image: 'assets/Images/basmati_rice.png', title: "Basmati Rice", quantity: "1kg", price: 500),
  Item(image: 'assets/Images/brown_rice.png', title: "Brown Rice", quantity: "1kg", price: 500),
  Item(image: 'assets/Images/brown_rice.png', title: "Brown Rice", quantity: "1kg", price: 500),
];

List<Item> fruitsAndVeg = [
  Item(image: 'assets/Images/apple.png', title: "Apples", quantity: '1kg', price: 100),
  Item(image: 'assets/Images/banana.png', title: "Banana", quantity: '6 pieces', price: 100),
  Item(image: 'assets/Images/bellpepper.png', title: "Bell Pepper", quantity: '250g', price: 100),
  Item(image: 'assets/Images/blueberries.png', title: "Blue Berries", quantity: '500g', price: 100),
  Item(image: 'assets/Images/brocolli.png', title: "Brocolli", quantity: '500g', price: 100),
  Item(image: 'assets/Images/carrots.png', title: "Carrots", quantity: '500g', price: 100),
  Item(image: 'assets/Images/grapes.png', title: "Grapes", quantity: '500g', price: 100),
  Item(image: 'assets/Images/potatos.png', title: "Potatos", quantity: '1kg', price: 100),
  Item(image: 'assets/Images/spinach.png', title: "Spinach", quantity: '1kg', price: 100),
  Item(image: 'assets/Images/tomatoes.png', title: "Tomatoes", quantity: '1kg', price: 100),
];

List<Item> oils = [
  Item(image: 'assets/Images/canola_oil.png', title: "Canola Oil", quantity: "1 bottle", price: 520),
  Item(image: 'assets/Images/olive_oil.png', title: "Olive Oil", quantity: "1 bottle", price: 520),
  Item(image: 'assets/Images/sunflower_oil.png', title: "Sunflower Oil", quantity: "1 bottle", price: 520),
  Item(image: 'assets/Images/vegetable_oil.png', title: "Vegetable Oil", quantity: "1 bottle", price: 520),
];

List<Item> meat = [
  Item(image: 'assets/Images/beef.png', title: "Beef", quantity: "1kg", price: 650),
  Item(image: 'assets/Images/chicken_chest.png', title: "Chicken Chest", quantity: "1kg", price: 650),
  Item(image: 'assets/Images/chicken_thighs.png', title: "Chicken Thighs", quantity: "1kg", price: 650),
  Item(image: 'assets/Images/salmon.png', title: "Salmon", quantity: "1kg", price: 650),
  Item(image: 'assets/Images/shrimp.png', title: "Shrimp", quantity: "1kg", price: 650),
  Item(image: 'assets/Images/tilapia.png', title: "Tilapia", quantity: "1kg", price: 650),
  Item(image: 'assets/Images/tuna.png', title: "Tuna", quantity: "1kg", price: 650),
];

List<Item> bakery = [
  Item(image: 'assets/Images/bagel.png', title: "Bagel", quantity: "6 pieces", price: 200),
  Item(image: 'assets/Images/bread.png', title: "Bread", quantity: "6 pieces", price: 200),
  Item(image: 'assets/Images/butter.png', title: "Butter", quantity: "6 pieces", price: 200),
  Item(image: 'assets/Images/cookies.png', title: "Cookies", quantity: "6 pieces", price: 200),
  Item(image: 'assets/Images/croissant.png', title: "Croissant", quantity: "6 pieces", price: 200),
  Item(image: 'assets/Images/egg_noodles.png', title: "Egg Noodles", quantity: "1 packet", price: 200),
  Item(image: 'assets/Images/lays.png', title: "Lays", quantity: "1 packet", price: 200),
  Item(image: 'assets/Images/mayonaise.png', title: "Mayonaise", quantity: "1 packet", price: 200),
  Item(image: 'assets/Images/muffin.png', title: "Muffin", quantity: "6 pieces", price: 200),
  Item(image: 'assets/Images/noodles.png', title: "Noodles", quantity: "1 packet", price: 200),
  Item(image: 'assets/Images/pasta.png', title: "Pasta", quantity: "1 packet", price: 200),
  Item(image: 'assets/Images/popcorn.png', title: "Popcorn", quantity: "1 packet", price: 200),
];

List<Item> dairy = [
  Item(image: 'assets/Images/butter.png', title: "Butter", quantity: "1 packet", price: 100),
  Item(image: 'assets/Images/cheddar_cheese.png', title: "Cheddar Cheese", quantity: "1 packet", price: 100),
  Item(image: 'assets/Images/eggs_white.png', title: "Eggs White", quantity: "12", price: 100),
  Item(image: 'assets/Images/eggs_red.png', title: "Eggs Red", quantity: "12", price: 100),
  Item(image: 'assets/Images/milk.png', title: "Milk", quantity: "1kg", price: 100),
  Item(image: 'assets/Images/mozzarella_cheese.png', title: "Mozzarella Cheese", quantity: "1 packet", price: 100),
  Item(image: 'assets/Images/yogurt.png', title: "Yogurt", quantity: "1 packet", price: 200),
];

List<Map<String, dynamic>> options1 = [
      {"title": "Eggs", "isTicked": false},
      {"title": "Noodle Pasta", "isTicked": false},
      {"title": "Chips", "isTicked": false},
      {"title": "Fast Food", "isTicked": false}
];

List<Map<String, dynamic>> options2 = [
      {"title": "Individual Callection", "isTicked": false},
      {"title": "Cocola", "isTicked": false},
      {"title": "Ifad", "isTicked": false},
      {"title": "Kazi Farmas", "isTicked": false}
];