import 'package:flutter/material.dart';
import 'package:grocery_app_ui/foodcard.dart';

class Shop extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final Function(Map<String, dynamic>) onAddItemToCart;

  const Shop(
      {Key? key,
      required this.cart,
      required this.onAddItemToCart,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                'assets/Images/logo_color.png',
                height: 40,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16)),
                  hintText: "Search Store",
                  hintStyle:
                      TextStyle(color: Colors.grey[700], fontFamily: 'Gilroy'),
                  prefixIcon: const Icon(Icons.search)),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 114.99,
              width: 368.2,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: PageView(
                children: [
                  Image.asset(
                    'assets/Images/banner.jpeg',
                    width: size.width,
                    height: size.height,
                  ),
                  Image.asset(
                    'assets/Images/banner.jpeg',
                    width: size.width,
                    height: size.height,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Exclusive Offer",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(
                          color: Color.fromRGBO(83, 177, 117, 1),
                          fontSize: 16,
                          fontFamily: 'Gilroy'),
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: FoodCard(
                          onAddItemToCart: onAddItemToCart,
                          cart: cart,
                          image: 'assets/Images/banana.png',
                          title: "Organic bananas",
                          quantity: "7 pcs",
                          price: 4.99),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Best Selling",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(
                          color: Color.fromRGBO(83, 177, 117, 1),
                          fontSize: 16,
                          fontFamily: 'Gilroy'),
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: FoodCard(
                          onAddItemToCart: onAddItemToCart,
                          cart: cart,
                          image: 'assets/Images/apple.png',
                          title: "Red Apples",
                          quantity: "1kg",
                          price: 4.99),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Groceries",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(
                          color: Color.fromRGBO(83, 177, 117, 1),
                          fontSize: 16,
                          fontFamily: 'Gilroy'),
                    ))
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: Colors.pink[200]),
                        width: 200,
                        height: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/Images/pulses.png',
                              width: 71.9,
                              height: 71.9,
                            ),
                            const Text(
                              "Pulses",
                              style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: FoodCard(
                          onAddItemToCart: onAddItemToCart,
                          cart: cart,
                          image: 'assets/Images/apple.png',
                          title: "Red Apples",
                          quantity: "1kg",
                          price: 4.99),
                    );
                  }),
            ),
          ],
        ),
      )),
    ));
  }
}
