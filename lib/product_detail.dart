import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grocery_app_ui/cart_provider.dart';
import 'package:grocery_app_ui/favourite_provider.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/item_provider.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final String image;
  final String title;
  final String quantity;
  final double price;
  final Item item;
  const ProductDetail({
    super.key,
    required this.image,
    required this.title,
    required this.quantity,
    required this.price,
    required this.item,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    var count = widget.item.count;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 243, 242, 1),
      ),
      body: Stack(children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(242, 243, 242, 1),
              ),
              width: 413.6,
              height: 300,
              child: Center(
                  child: Image.asset(
                widget.image,
                height: 199.18,
                width: 329.34,
              )),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Consumer<FavouriteProvider>(
                        builder: (context, favouriteProvider, child) =>
                            IconButton(
                                onPressed: () {
                                  if (favouriteProvider
                                      .isFavourite(widget.item)) {
                                    favouriteProvider
                                        .removeFromFavourite(widget.item);
                                  } else {
                                    favouriteProvider
                                        .addToFavourite(widget.item);
                                  }
                                },
                                icon: Icon(
                                  Icons.favorite_outlined,
                                  color:
                                      favouriteProvider.isFavourite(widget.item)
                                          ? Colors.red
                                          : Colors.grey,
                                  fill: 0.1,
                                )),
                      )
                    ],
                  ),
                  Text(
                    widget.quantity,
                    style: const TextStyle(
                        fontFamily: "Gilroy", color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<CartProvider>(
                        builder: (context, cartProvider, child) =>
                            Consumer<ItemProvider>(
                          builder: (context, itemProvider, child) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    itemProvider.decrementCount(widget.item);
                                  },
                                  child: Image.asset(
                                    'assets/Images/minus_button.png',
                                    height: 45.67,
                                    width: 45.67,
                                  )),
                              Text(
                                widget.item.count.toString(),
                                style: const TextStyle(
                                    fontFamily: "Gilroy",
                                    fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (cartProvider.isAdded(widget.item)) {
                                      itemProvider.incrementCount(widget.item);
                                    } else {
                                      itemProvider.incrementCount(widget.item);
                                      cartProvider.addToCart(widget.item);
                                    }
                                  },
                                  child: Image.asset(
                                    'assets/Images/add_button_2.png',
                                    height: 45.67,
                                    width: 45.67,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Text(
                        widget.price.toString(),
                        style: const TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(children: [
                const ExpansionTile(
                  title: Text(
                    "Product Detail",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      subtitle: Text(
                          "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 14,
                          )),
                    )
                  ],
                ),
                const ExpansionTile(
                  title: Text(
                    "Nutritions",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      subtitle: Text("100 gram Vitamin A",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 14,
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Review",
                        style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      RatingBar.builder(
                          itemSize: 20,
                          allowHalfRating: true,
                          itemBuilder: ((context, _) => const Icon(Icons.star,
                              color: Color.fromRGBO(243, 96, 63, 1))),
                          onRatingUpdate: (rating) {
                            print(rating);
                          })
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
        Align(
            alignment: const Alignment(0, 0.9),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(83, 177, 117, 1),
                  borderRadius: BorderRadius.circular(18)),
              child: const Center(
                child: Text(
                  "Add To Basket",
                  style: TextStyle(
                      fontFamily: "Gilroy", fontSize: 18, color: Colors.white),
                ),
              ),
            ))
      ]),
    );
  }
}
