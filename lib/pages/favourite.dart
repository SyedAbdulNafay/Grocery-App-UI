import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  final List<Map<String, dynamic>> favourite;
  final Function(Map<String, dynamic>) onAddItemToFavourite;
  const Favourite(
      {super.key, required this.onAddItemToFavourite, required this.favourite});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: widget.favourite.isEmpty
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
                    itemCount: widget.favourite.length,
                    itemBuilder: ((context, index) {
                      Map<String, dynamic> item = widget.favourite[index];
                      return ExpansionTile(
                        title: Text(
                          "${item['title']}",
                          style: const TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: Image.asset(
                          item['image'],
                          width: 65,
                          height: 70,
                        ),
                        // trailing: Text(
                        //   "${item['price']}",
                        //   style: const TextStyle(
                        //       fontFamily: "Gilroy",
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        subtitle: Text(
                          "${item['quantity']}",
                          style: const TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                        children: [
                          ListTile(
                            title: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  widget.favourite.remove(item);
                                });
                              },
                              color: Colors.red,
                              child: const Text(
                                "Remove",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Gilroy",
                                    fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      );
                    })),
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
                        "Add All To Basket",
                        style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ))
            ]),
    );
  }
}
