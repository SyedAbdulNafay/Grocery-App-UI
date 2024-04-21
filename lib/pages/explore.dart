import 'package:flutter/material.dart';
import 'package:grocery_app_ui/grocery_provider.dart';
import 'package:grocery_app_ui/item.dart';
import 'package:grocery_app_ui/pages/grocery_categories_page.dart';
import 'package:grocery_app_ui/widgets/foodcard.dart';

class Explore extends StatefulWidget {
  const Explore({
    super.key,
  });

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final exploreSearchController = TextEditingController();
  List<Item> searchItems = [];
  @override
  Widget build(BuildContext context) {
    void searchItem(String query) {
      searchItems.clear();
      for (var category in groceryCategories) {
        for (Item item in category['items']) {
          if (item.title.toLowerCase().contains(query.toLowerCase())) {
            searchItems.add(item);
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Find Products",
            style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (query) {
                    searchItem(query);
                    setState(() {});
                  },
                  controller: exploreSearchController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16)),
                      hintText: "Search Store",
                      hintStyle: TextStyle(
                          color: Colors.grey[700], fontFamily: 'Gilroy'),
                      prefixIcon: const Icon(Icons.search),
                      suffix: exploreSearchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.cancel_sharp,
                                size: 18,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                exploreSearchController.clear();
                                searchItems.clear();
                                setState(() {});
                              },
                            )
                          : null),
                ),
              ),
              Expanded(
                child: exploreSearchController.text.isNotEmpty
                    ? (searchItems.isEmpty
                        ? const Center(
                            child: Text(
                              "No Item Found",
                              style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontSize: 30,
                                  color: Colors.grey),
                            ),
                          )
                        : GridView.builder(
                            itemCount: searchItems.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.75, crossAxisCount: 2),
                            itemBuilder: ((context, index) {
                              return FoodCard(
                                  detail: searchItems[index].detail,
                                  image: searchItems[index].image,
                                  title: searchItems[index].title,
                                  quantity: searchItems[index].quantity,
                                  price: searchItems[index].price);
                            })))
                    : GridView.builder(
                        itemCount: groceryCategories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.9, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 7.5, left: 12.5, bottom: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CustomGroceryCategoryPage(
                                              appBarTitle:
                                                  groceryCategories[index]
                                                      ['title'],
                                              list: groceryCategories[index]
                                                  ['items'],
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                        color: groceryCategories[index]
                                            ['borderColor']),
                                    color: groceryCategories[index]['color']),
                                width: 174.5,
                                height: 189.11,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        groceryCategories[index]['image'],
                                        width: 111.38,
                                        height: 74.9,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Center(
                                          child: Text(
                                            groceryCategories[index]['title'],
                                            style: const TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
