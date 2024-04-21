import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app_ui/grocery_provider.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/widgets/custom_grid.dart';

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Sort By",
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
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: options1.length,
                                              itemBuilder: (context, index) {
                                                return CheckboxListTile(
                                                    activeColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                    title: Text(options1[index]
                                                        ['title']),
                                                    value: options1[index]
                                                        ['isTicked'],
                                                    onChanged: (newBool) {
                                                      setstate(() {
                                                        options1[index]
                                                                ['isTicked'] =
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: SizedBox(
                                    height: 67,
                                    width: 364,
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Theme.of(context)
                                                        .primaryColor)),
                                        onPressed: () {
                                          if (options1[0]['isTicked'] == true) {
                                            setState(() {
                                              widget.list.sort((a, b) =>
                                                  a.price.compareTo(b.price));
                                            });
                                          } else if (options1[1]['isTicked'] ==
                                              true) {
                                            setState(() {
                                              widget.list.sort((a, b) =>
                                                  b.price.compareTo(a.price));
                                            });
                                          } else if (options1[2]['isTicked'] ==
                                              true) {
                                            setState(() {
                                              widget.list.sort((a, b) =>
                                                  a.title.compareTo(b.title));
                                            });
                                          }
                                          Fluttertoast.showToast(msg: "Filter applied");
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Apply Filter",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        )),
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
