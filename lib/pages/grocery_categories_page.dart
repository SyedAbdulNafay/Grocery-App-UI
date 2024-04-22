import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app_ui/grocery_provider.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/widgets/custom_grid.dart';

class CustomGroceryCategoryPage extends StatefulWidget {
  final String appBarTitle;
  final List<Item> list;
  int? selectedOption;
  CustomGroceryCategoryPage(
      {super.key,
      required this.appBarTitle,
      required this.list,
      required this.selectedOption});

  @override
  State<CustomGroceryCategoryPage> createState() =>
      _CustomGroceryCategoryPageState();
}

class _CustomGroceryCategoryPageState extends State<CustomGroceryCategoryPage> {

  @override
  void dispose(){
    FocusScope.of(context).unfocus();
    super.dispose();
  }

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
                                        return Expanded(
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: options1.length,
                                            itemBuilder: (context, index) {
                                              return RadioListTile(
                                                  groupValue:
                                                      widget.selectedOption,
                                                  activeColor: Theme.of(context)
                                                      .primaryColor,
                                                  title: Text(
                                                      options1[index]['title']),
                                                  value: index,
                                                  onChanged: (value) {
                                                    setstate(() {
                                                      widget.selectedOption =
                                                          value;
                                                    });
                                                  });
                                            },
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
                                          if (widget.selectedOption == 0) {
                                            setState(() {
                                              widget.list.sort((a, b) =>
                                                  a.price.compareTo(b.price));
                                            });
                                          } else if (widget.selectedOption ==
                                              1) {
                                            setState(() {
                                              widget.list.sort((a, b) =>
                                                  b.price.compareTo(a.price));
                                            });
                                          } else if (widget.selectedOption ==
                                              2) {
                                            setState(() {
                                              widget.list.sort((a, b) =>
                                                  a.title.compareTo(b.title));
                                            });
                                          }
                                          Fluttertoast.showToast(
                                              msg: "Filter applied");
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
