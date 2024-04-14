import 'package:flutter/material.dart';
import 'package:grocery_app_ui/foodcard.dart';

class Beverages extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final List<Map<String, dynamic>> favourite;
  final Function(Map<String, dynamic>) onAddItemToCart;
  final Function(Map<String, dynamic>) onAddItemToFavourite;

  const Beverages({Key? key, required this.cart, required this.favourite, required this.onAddItemToCart, required this.onAddItemToFavourite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        "title": "Diet Coke",
        "image": "assets/Images/dietcoke_can.png",
        "quantity": "355ml",
        "price": 1.99
      },
      {
        "title": "Sprite Can",
        "image": "assets/Images/sprite_can.png",
        "quantity": "325ml",
        "price": 1.50
      },
      {
        "title": "Apple & Grape Juice",
        "image": "assets/Images/apple_juice.png",
        "quantity": "2L",
        "price": 15.99
      },
      {
        "title": "Orange Juice",
        "image": "assets/Images/orange_juice.png",
        "quantity": "2L",
        "price": 15.99
      },
      {
        "title": "Coca Cola Can",
        "image": "assets/Images/coke_can.png",
        "quantity": "325ml",
        "price": 4.99
      },
      {
        "title": "Pepsi Can",
        "image": "assets/Images/pepsi_can.png",
        "quantity": "330ml",
        "price": 4.99
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: const Alignment(-0.5, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Beverages",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Icon(Icons.tune),
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Expanded(
              child: ListView.builder(
                  itemCount: (list.length + 1) ~/ 2,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FoodCard(
                            onAddItemToFavourite: onAddItemToFavourite,
                            favourite: favourite,
                            onAddItemToCart: onAddItemToCart,
                            cart: cart,
                              image: list[index * 2]['image'],
                              title: list[index * 2]['title'],
                              quantity: list[index * 2]['quantity'],
                              price: list[index * 2]['price']),
                        ),
                        if (index * 2 + 1 < list.length)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FoodCard(
                              onAddItemToFavourite: onAddItemToFavourite,
                              favourite: favourite,
                              onAddItemToCart: onAddItemToCart,
                              cart: cart,
                                image: list[index * 2 + 1]['image'],
                                title: list[index * 2 + 1]['title'],
                                quantity: list[index * 2 + 1]['quantity'],
                                price: list[index * 2 + 1]['price']),
                          ),
                      ],
                    );
                  }))),
        ),
      ),
    );
  }
}
