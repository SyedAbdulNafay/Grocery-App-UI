import 'package:flutter/material.dart';
import 'package:grocery_app_ui/cart_provider.dart';
import 'package:grocery_app_ui/favourite_provider.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/item_provider.dart';
import 'package:grocery_app_ui/product_detail.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String quantity;
  final double price;
  const FoodCard({
    Key? key,
    required this.image,
    required this.title,
    required this.quantity,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, favouriteProvider, child) => Center(
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, child) => GestureDetector(
            onTap: () {
              Item item = Item(image: image, title: title, quantity: quantity, price: price);
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
                            image: image,
                            title: title,
                            quantity: quantity,
                            price: price,
                          ))));
            },
            child: Container(
              width: 155,
              height: 225.51,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border:
                      Border.all(color: const Color.fromARGB(239, 212, 224, 224))
                  ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.asset(
                        image,
                        width: 103.43,
                        height: 62.56,
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
                            builder: (context, itemProvider, child) =>
                                Consumer<CartProvider>(
                              builder: (context, cartProvider, child) =>
                                  TextButton(
                                onPressed: () {
                                  for (var item in cartProvider.cart) {
                                    if (item.title == title) {
                                      itemProvider.incrementCount(item);
                                      return;
                                    }
                                  }
                                  Item newItem = Item(
                                      image: image,
                                      title: title,
                                      quantity: quantity,
                                      price: price,
                                      count: 1);
                                  cartProvider.addToCart(newItem);
                                },
                                child: Image.asset(
                                  'assets/Images/add_button.png',
                                  width: 45.67,
                                  height: 45.67,
                                ),
                              ),
                            ),
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
