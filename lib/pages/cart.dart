import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app_ui/cart_provider.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/item_provider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "My Cart",
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: cartProvider.cart.isEmpty
            ? const Center(
                child: Text(
                "Cart is empty",
                style: TextStyle(
                    fontFamily: "Gilroy", fontSize: 30, color: Colors.grey),
              ))
            : Stack(children: [
                ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: cartProvider.cart.length,
                    itemBuilder: ((context, index) {
                      Item item = cartProvider.cart[index];
                      return Consumer<ItemProvider>(
                        builder: (context, itemProvider, child) => Container(
                          padding: const EdgeInsets.all(16),
                          height: 150,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(226, 226, 226, 1),
                                      width: 1),
                                  top: BorderSide(
                                      color: Color.fromRGBO(226, 226, 226, 1),
                                      width: 0.5))),
                          child: Row(
                            children: [
                              Image.asset(
                                item.image,
                                height: 64.69,
                                width: 70.43,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                width: 190,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.title,
                                      style: const TextStyle(
                                          fontFamily: "Gilroy",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      item.quantity,
                                      style: const TextStyle(
                                          fontFamily: "Gilroy",
                                          fontSize: 16,
                                          color: Colors.grey),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                if (item.count > 0) {
                                                    itemProvider.decrementCount(item);
                                                  if (item.count == 0) {
                                                    cartProvider.removeFromCart(item);
                                                  }
                                                }
                                              });
                                            },
                                            child: Container(
                                              height: 45.67,
                                              width: 45.67,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(17),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFFE2E2E2))),
                                              child: const Icon(Icons.remove,
                                                  color: Color(0xFFB3B3B3)),
                                            )),
                                        Text(
                                          cartProvider.cart[index].count
                                              .toString(),
                                          style: const TextStyle(
                                              fontFamily: "Gilroy",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              if (cartProvider.isAdded(item)) {
                                                itemProvider
                                                    .incrementCount(item);
                                              } else {
                                                itemProvider
                                                    .incrementCount(item);
                                                cartProvider.addToCart(item);
                                              }
                                            },
                                            child: Container(
                                              height: 45.67,
                                              width: 45.67,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(17),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFFE2E2E2))),
                                              child: Icon(Icons.add,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cartProvider.cart[index].count = 0;
                                            cartProvider.removeFromCart(item);
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Color(0xFFB3B3B3),
                                        )),
                                    Text(
                                      "\$${item.price}",
                                      style: const TextStyle(
                                          fontFamily: "Gilroy",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
                Align(
                  alignment: const Alignment(0, 0.9),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(18)),
                    child: const Center(
                      child: Text(
                        "Go To Checkout",
                        style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ]),
      ),
    );
  }
}
