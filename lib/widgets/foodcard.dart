import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app_ui/models/cart_provider.dart';
import 'package:grocery_app_ui/models/favourite_provider.dart';
import 'package:grocery_app_ui/models/item_provider.dart';
import 'package:grocery_app_ui/pages/product_detail.dart';
import 'package:grocery_app_ui/services/item.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatefulWidget {
  final Item item;
  // final String title;
  // final String quantity;
  // final double price;
  // final String detail;
  const FoodCard({
    super.key,
    required this.item,
    // required this.title,
    // required this.quantity,
    // required this.price,
    // required this.detail
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<FavouriteProvider, CartProvider>(
      builder: (context, favouriteProvider, cartProvider, child) => Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => ProductDetail(
                          item: widget.item,
                        ))));
          },
          child: Container(
            width: 173,
            height: 249,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(
                    color: const Color.fromARGB(239, 212, 224, 224))),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset(
                      widget.item.image,
                      width: 99.89,
                      height: 79.43,
                    ),
                  ),
                  Align(
                      alignment: const Alignment(-1, 0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.item.title,
                          style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      )),
                  Align(
                      alignment: const Alignment(-1, 0),
                      child: Text(
                        "${widget.item.quantity}, Price",
                        style: const TextStyle(
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.grey),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${widget.item.price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: 'Gilroy'),
                        ),
                        Consumer<ItemProvider>(
                          builder: (context, itemProvider, child) =>
                              Consumer<CartProvider>(
                                  builder: (context, cartProvider, child) {
                            return GestureDetector(
                              onTap: () {
                                for (var item in cartProvider.cart) {
                                  if (item.title == widget.item.title) {
                                    itemProvider.incrementCount(item);
                                    Fluttertoast.showToast(
                                        msg: "Added To Cart",
                                        backgroundColor: Colors.grey);
                                    return;
                                  }
                                }
                                itemProvider.incrementCount(widget.item);
                                cartProvider.addToCart(widget.item);
                                Fluttertoast.showToast(
                                    msg: "Added To Cart",
                                    backgroundColor: Colors.grey);
                              },
                              child: Container(
                                height: 45.67,
                                width: 45.67,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(17)),
                                child: Center(
                                    child: cartProvider.cart.any((element) =>
                                            element.title == widget.item.title)
                                        ? Text(
                                            cartProvider.cart
                                                .firstWhere((element) =>
                                                    element.title ==
                                                    widget.item.title)
                                                .count
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Gilroy",
                                                color: Colors.white),
                                          )
                                        : const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          )),
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
