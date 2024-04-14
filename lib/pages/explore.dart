// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocery_app_ui/beverages.dart';

class Explore extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final List<Map<String, dynamic>> favourtie;
  final Function(Map<String, dynamic>) onAddItemToCart;
  final Function(Map<String, dynamic>) onAddItemToFavourite;
  const Explore(
      {Key? key,
      required this.cart,
      required this.favourtie,
      required this.onAddItemToCart, required this.onAddItemToFavourite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        "title": "Fresh Fruits & Vegetable",
        "image": "assets/Images/fruit_basket.png",
        "color": Color.fromRGBO(83, 177, 117, 0.1)
      },
      {
        "title": "Cooking Oil & Ghee",
        "image": "assets/Images/oils.png",
        "color": Color.fromRGBO(248, 164, 176, 0.1)
      },
      {
        "title": "Meat & Fish",
        "image": "assets/Images/meat.png",
        "color": Color.fromRGBO(247, 165, 147, 0.25)
      },
      {
        "title": "Bakery & Snacks",
        "image": "assets/Images/bakery.png",
        "color": Color.fromRGBO(211, 176, 224, 0.25)
      },
      {
        "title": "Dairy & Eggs",
        "image": "assets/Images/dairy.png",
        "color": Color.fromRGBO(253, 229, 152, 0.25)
      },
      {
        "title": "Beverages",
        "image": "assets/Images/beverages.png",
        "color": Color.fromRGBO(183, 223, 245, 0.25)
      },
    ];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              const Text(
                "Find Products",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16)),
                      hintText: "Search Store",
                      hintStyle: TextStyle(
                          color: Colors.grey[700], fontFamily: 'Gilroy'),
                      prefixIcon: const Icon(Icons.search)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: (list.length + 1) ~/ 2,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Beverages(
                                          onAddItemToFavourite: onAddItemToFavourite,
                                              cart: cart,
                                              onAddItemToCart: onAddItemToCart,
                                              favourite: favourtie,
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(19),
                                    color: list[index * 2]['color']),
                                width: 150,
                                height: 189.11,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        list[index * 2]['image'],
                                        width: 111.38,
                                        height: 74.9,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          list[index * 2]['title'],
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (index * 2 + 1 < list.length)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => Beverages(
                                            onAddItemToFavourite: onAddItemToFavourite,
                                                cart: cart,
                                                onAddItemToCart:
                                                    onAddItemToCart,
                                                favourite: favourtie,
                                              ))));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(19),
                                      color: list[index * 2 + 1]['color']),
                                  width: 150,
                                  height: 189.11,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset(
                                          list[index * 2 + 1]['image'],
                                          width: 111.38,
                                          height: 74.9,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            list[index * 2 + 1]['title'],
                                            style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
