import 'package:flutter/material.dart';
import 'package:grocery_app_ui/product_detail.dart';

class FoodCard extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final String image;
  final String title;
  final String quantity;
  final double price;
  final Function(Map<String, dynamic>) onAddItemToCart;
  const FoodCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.quantity,
      required this.price,
      required this.cart,
      required this.onAddItemToCart,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Map<String, dynamic> item = {};
          bool isInCart = false;
          for (var element in cart) {
            if (element["title"] == title) {
              isInCart = true;
              item = element;
              break;
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
                        cart: cart,
                        onAddItemToCart: onAddItemToCart,
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
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.grey.withOpacity(0.5),
              //       spreadRadius: 3,
              //       blurRadius: 10,
              //       offset: const Offset(0, 3))
              // ])
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
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
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
                        "$price",
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            fontFamily: 'Gilroy'),
                      ),
                      TextButton(
                        onPressed: () {
                          for (var item in cart) {
                            if (item['title'] == title) {
                              item['count']++;
                              return;
                            }
                          }
                          Map<String, dynamic> newItem = {
                            "image": image,
                            "title": title,
                            "quantity": quantity,
                            "price": price,
                            "count": 1
                          };
                          onAddItemToCart(newItem);
                        },
                        child: Image.asset(
                          'assets/Images/add_button.png',
                          width: 45.67,
                          height: 45.67,
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
    );
  }
}
