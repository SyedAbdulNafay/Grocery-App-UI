import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app_ui/cart_provider.dart';
import 'package:grocery_app_ui/favourite_provider.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/item_provider.dart';
import 'package:grocery_app_ui/pages/product_detail.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String quantity;
  final double price;
  final String detail;
  const FoodCard(
      {super.key,
      required this.image,
      required this.title,
      required this.quantity,
      required this.price,
      required this.detail});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, favouriteProvider, child) => Center(
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) => GestureDetector(
            onTap: () {
              Item item = Item(
                  detail: detail,
                  image: image,
                  title: title,
                  quantity: quantity,
                  price: price);
              for (var element in cartProvider.cart) {
                if (element.title == title) {
                  item = element;
                }
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ProductDetail(
                            item: item,
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
                        image,
                        width: 99.89,
                        height: 79.43,
                      ),
                    ),
                    Align(
                        alignment: const Alignment(-1, 0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            title,
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
                          "$quantity, Price",
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
                            "\$$price",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                fontFamily: 'Gilroy'),
                          ),
                          Consumer<ItemProvider>(
                            builder: (context, itemProvider, child) => Consumer<
                                    CartProvider>(
                                builder: (context, cartProvider, child) =>
                                    GestureDetector(
                                      onTap: () {
                                        for (var item in cartProvider.cart) {
                                          if (item.title == title) {
                                            itemProvider.incrementCount(item);
                                            Fluttertoast.showToast(
                                                msg: "Added To Cart", backgroundColor: Colors.grey);
                                            return;
                                          }
                                        }
                                        Item newItem = Item(
                                            detail: detail,
                                            image: image,
                                            title: title,
                                            quantity: quantity,
                                            price: price,
                                            count: 1);
                                        cartProvider.addToCart(newItem);
                                        Fluttertoast.showToast(
                                            msg: "Added To Cart", backgroundColor: Colors.grey);
                                      },
                                      child: Container(
                                        height: 45.67,
                                        width: 45.67,
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(17)),
                                        child: const Center(
                                            child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        )),
                                      ),
                                    )),
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
      ),
    );
  }
}
