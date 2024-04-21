import 'package:flutter/material.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/widgets/foodcard.dart';

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
            crossAxisCount: widget.crossAxisCount, childAspectRatio: 0.75),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.52),
            child: FoodCard(
                detail: widget.list[index].detail,
                image: widget.list[index].image,
                title: widget.list[index].title,
                quantity: widget.list[index].quantity,
                price: widget.list[index].price),
          );
        });
  }
}
