import 'package:flutter/material.dart';
import 'package:grocery_app_ui/foodcard.dart';
import 'package:grocery_app_ui/item.dart';

class CustomGrid extends StatefulWidget {
  final List<Item> list;
  final int crossAxisCount;
  const CustomGrid(
      {super.key, required this.list, required this.crossAxisCount});

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount, childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: FoodCard(
                image: widget.list[index].image,
                title: widget.list[index].title,
                quantity: widget.list[index].quantity,
                price: widget.list[index].price),
          );
        });
  }
}
