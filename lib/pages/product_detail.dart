import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app_ui/cart_provider.dart';
import 'package:grocery_app_ui/favourite_provider.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/item_provider.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final Item item;
  const ProductDetail({
    super.key,
    required this.item,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
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
                widget.item.image,
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
                        widget.item.title,
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
                                  Fluttertoast.showToast(
                                      msg: favouriteProvider
                                              .isFavourite(widget.item)
                                          ? "Favourited"
                                          : "Unfavourited",
                                      backgroundColor: Colors.grey);
                                },
                                icon: Icon(
                                  favouriteProvider.isFavourite(widget.item)
                                      ? Icons.favorite_outlined
                                      : Icons.favorite_outline_outlined,
                                  color:
                                      favouriteProvider.isFavourite(widget.item)
                                          ? Colors.red
                                          : const Color(0xFF7C7C7C),
                                  fill: 0.1,
                                )),
                      )
                    ],
                  ),
                  Text(
                    widget.item.quantity,
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
                              IconButton(
                                  onPressed: () {
                                    if (widget.item.count > 0) {
                                      if (widget.item.count == 1) {
                                        itemProvider
                                            .decrementCount(widget.item);
                                        cartProvider
                                            .removeFromCart(widget.item);
                                      } else {
                                        itemProvider
                                            .decrementCount(widget.item);
                                      }
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Color(0xFFB3B3B3),
                                  )),
                              Container(
                                height: 45.67,
                                width: 45.67,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFE2E2E2)),
                                    borderRadius: BorderRadius.circular(17)),
                                child: Center(
                                  child: Text(
                                    widget.item.count.toString(),
                                    style: const TextStyle(
                                        fontFamily: "Gilroy",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (cartProvider.isAdded(widget.item)) {
                                      itemProvider.incrementCount(widget.item);
                                    } else {
                                      itemProvider.incrementCount(widget.item);
                                      cartProvider.addToCart(widget.item);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Theme.of(context).primaryColor,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "\$${widget.item.price.toString()}",
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
                ExpansionTile(
                  title: const Text(
                    "Product Detail",
                    style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      subtitle: Text(widget.item.detail,
                          style: const TextStyle(
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
                          onRatingUpdate: (rating) {})
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
        Consumer<ItemProvider>(
          builder: (context, itemProvider, child) => Consumer<CartProvider>(
            builder: (context, cartProvider, child) => Align(
                alignment: const Alignment(0, 0.9),
                child: GestureDetector(
                  onTap: () {
                    for (var item in cartProvider.cart) {
                      if (item.title == widget.item.title) {
                        itemProvider.incrementCount(item);
                        Fluttertoast.showToast(msg: "Added To Cart");
                        return;
                      }
                    }
                    itemProvider.incrementCount(widget.item);
                    cartProvider.addToCart(widget.item);
                    Fluttertoast.showToast(
                        msg: "Added To Cart", backgroundColor: Colors.grey);
                  },
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(18)),
                    child: const Center(
                      child: Text(
                        "Add To Basket",
                        style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )),
          ),
        )
      ]),
    );
  }
}
