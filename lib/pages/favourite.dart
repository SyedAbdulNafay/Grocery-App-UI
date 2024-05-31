import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app_ui/models/cart_provider.dart';
import 'package:grocery_app_ui/models/favourite_provider.dart';
import 'package:grocery_app_ui/models/item_provider.dart';
import 'package:grocery_app_ui/services/item.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, favouriteProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Favourite",
              style: TextStyle(
                  fontFamily: "Gilroy",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: favouriteProvider.favourite.isEmpty
            ? const Center(
                child: Text(
                  "No Favourites",
                  style: TextStyle(
                      fontFamily: "Gilroy", fontSize: 30, color: Colors.grey),
                ),
              )
            : Stack(children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: favouriteProvider.favourite.length,
                      itemBuilder: ((context, index) {
                        Item item = favouriteProvider.favourite[index];
                        return Container(
                          height: 110,
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xFFE2E2E2)),
                                top: BorderSide(color: Color(0xFFE2E2E2))),
                          ),
                          child: Center(
                            child: ListTile(
                              title: Text(
                                item.title,
                                style: const TextStyle(
                                    fontFamily: "Gilroy",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: Image.asset(
                                item.image,
                                width: 65,
                                height: 70,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "\$${item.price}",
                                    style: const TextStyle(
                                        fontFamily: "Gilroy",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        favouriteProvider
                                            .removeFromFavourite(item);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        weight: 20,
                                      ))
                                ],
                              ),
                              subtitle: Text(
                                item.quantity,
                                style: const TextStyle(
                                    fontFamily: "Gilroy",
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        );
                      })),
                ),
                Consumer<ItemProvider>(
                  builder: (context, itemProvider, child) =>
                      Consumer<CartProvider>(
                    builder: (context, cartProvider, child) => Align(
                        alignment: const Alignment(0, 0.9),
                        child: GestureDetector(
                          onTap: () {
                            bool check = false;
                            for (var favitem in favouriteProvider.favourite) {
                              for (var cartitem in cartProvider.cart) {
                                if (cartitem.title == favitem.title) {
                                  itemProvider.incrementCount(cartitem);
                                  check = true;
                                }
                              }
                              if (check == false) {
                                favitem.count++;
                                cartProvider.addToCart(favitem);
                              }
                            }
                            Fluttertoast.showToast(msg: "Added To Cart", backgroundColor: Colors.grey);
                          },
                          child: Container(
                            width: 300,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(18)),
                            child: const Center(
                              child: Text(
                                "Add All To Cart",
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
      ),
    );
  }
}
