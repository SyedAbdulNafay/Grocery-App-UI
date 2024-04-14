import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  const Cart({Key? key, required this.cart}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: widget.cart.isEmpty
          ? const Center(
              child: Text(
              "Cart is empty",
              style: TextStyle(
                  fontFamily: "Gilroy", fontSize: 30, color: Colors.grey),
            ))
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.cart.length,
              itemBuilder: ((context, index) {
                Map<String, dynamic> item = widget.cart[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  height: 150,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Color.fromRGBO(226, 226, 226, 1), width: 1),
                          top: BorderSide(color: Color.fromRGBO(226, 226, 226, 1), width: 0.5))),
                  child: Row(
                    children: [
                      Image.asset(
                        item['image'],
                        height: 64.69,
                        width: 70.43,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['title'],
                              style: const TextStyle(
                                  fontFamily: "Gilroy",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item['quantity'],
                              style: const TextStyle(
                                  fontFamily: "Gilroy",
                                  fontSize: 16,
                                  color: Colors.grey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        if (item['count'] > 0) {
                                          item['count']--;
                                        }
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/Images/minus_button.png',
                                      height: 45.67,
                                      width: 45.67,
                                    )),
                                Text(
                                  item['count'].toString(),
                                  style: const TextStyle(
                                      fontFamily: "Gilroy",
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        item['count']++;
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/Images/add_button_2.png',
                                      height: 45.67,
                                      width: 45.67,
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.cart.removeWhere((element) => element['title'] == item['title']);
                                  });
                                },
                                icon: const Icon(Icons.close)),
                            Text(
                              item['price'].toString(),
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
                );
              })),
    );
  }
}
