import 'package:flutter/material.dart';
import 'package:grocery_app_ui/custom_grid.dart';
import 'package:grocery_app_ui/grocery_provider.dart';
import 'package:grocery_app_ui/item.dart';

class CustomGroceryCategoryPage extends StatefulWidget {
  final String appBarTitle;
  final List<Item> list;
  const CustomGroceryCategoryPage(
      {super.key, required this.appBarTitle, required this.list});

  @override
  State<CustomGroceryCategoryPage> createState() =>
      _CustomGroceryCategoryPageState();
}

class _CustomGroceryCategoryPageState extends State<CustomGroceryCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.appBarTitle,
                style: const TextStyle(
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: const Color(0xFFF2F3F2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                        context: context,
                        builder: (context) {
                          return Stack(
                            children: [
                              SingleChildScrollView(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  width: double.infinity,
                                  height: 791,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Categories",
                                        style: TextStyle(
                                            fontFamily: "Gilroy",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      StatefulBuilder(
                                          builder: (context, setstate) {
                                        return SizedBox(
                                          height: 200,
                                          child: Expanded(
                                            child: ListView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: options1.length,
                                              itemBuilder: (context, index) {
                                                return CheckboxListTile(
                                                    activeColor: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    title: Text(
                                                        options1[index]['title']),
                                                    value: options1[index]
                                                        ['isTicked'],
                                                    onChanged: (newBool) {
                                                      setstate(() {
                                                        options1[index]['isTicked'] =
                                                            newBool;
                                                      });
                                                    });
                                              },
                                            ),
                                          ),
                                        );
                                      }),
                                      const Text(
                                        "Brands",
                                        style: TextStyle(
                                            fontFamily: "Gilroy",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      StatefulBuilder(
                                          builder: (context, setstate) {
                                        return SizedBox(
                                          height: 200,
                                          child: Expanded(
                                            child: ListView.builder(
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: options2.length,
                                              itemBuilder: (context, index) {
                                                return CheckboxListTile(
                                                    activeColor: Theme.of(context)
                                                        .colorScheme
                                                        .primary,
                                                    title: Text(
                                                        options2[index]['title']),
                                                    value: options2[index]
                                                        ['isTicked'],
                                                    onChanged: (newBool) {
                                                      setstate(() {
                                                        options2[index]['isTicked'] =
                                                            newBool;
                                                      });
                                                    });
                                              },
                                            ),
                                          ),
                                        );
                                      })
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0, 0.75),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 364,
                                      height: 67,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Center(
                                        child: Text(
                                          "Apply Filters",
                                          style: TextStyle(
                                              fontFamily: "Gilroy",
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.tune_outlined))
            ],
          ),
        ),
      ),
      body: CustomGrid(list: widget.list, crossAxisCount: 2),
    );
  }
}
