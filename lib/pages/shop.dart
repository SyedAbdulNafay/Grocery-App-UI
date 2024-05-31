import 'package:flutter/material.dart';
import 'package:grocery_app_ui/models/grocery_provider.dart';
import 'package:grocery_app_ui/pages/explore.dart';
import 'package:grocery_app_ui/pages/grocery_categories_page.dart';
import 'package:grocery_app_ui/services/item.dart';
import 'package:grocery_app_ui/widgets/custom_grid.dart';
import 'package:grocery_app_ui/widgets/focus.dart';
import 'package:grocery_app_ui/widgets/foodcard.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final focusNode = FocusNode();
  final shopSearchController = TextEditingController();
  List<Item> searchItems = [];
  bool _shouldFocus = true;

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    if(_shouldFocus){
      _shouldFocus = false;
      FocusScope.of(context).requestFocus(focusNode);
    }
  }

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

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                'assets/Images/logo_color.png',
                height: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  AutomaticFocus(
                    child: TextField(
                      focusNode: focusNode,
                      controller: shopSearchController,
                      onChanged: (query) {
                        searchItem(query);
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          suffixIcon: shopSearchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.cancel_sharp,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    shopSearchController.clear();
                                    searchItems.clear();
                                    setState(() {});
                                  },
                                )
                              : null,
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(16)),
                          hintText: "Search Store",
                          hintStyle: TextStyle(
                              color: Colors.grey[700], fontFamily: 'Gilroy'),
                          prefixIcon: const Icon(Icons.search)),
                    ),
                  ),
                  shopSearchController.text.isEmpty
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 114.99,
                              width: 368.2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)),
                              child: PageView(
                                children: [
                                  Image.asset(
                                    'assets/Images/banner.png',
                                    width: size.width,
                                    height: size.height,
                                  ),
                                  Image.asset(
                                    'assets/Images/banner.png',
                                    width: size.width,
                                    height: size.height,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
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
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomGroceryCategoryPage(
                                                      selectedOption:
                                                          shopCategory[0][
                                                              'selectedOption'],
                                                      appBarTitle: "Exclusive",
                                                      list: exclusive)));
                                    },
                                    child: Text(
                                      "See all",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16,
                                          fontFamily: 'Gilroy'),
                                    ))
                              ],
                            )
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            shopSearchController.text.isEmpty
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                        child: SizedBox(
                          height: 250,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: exclusive.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 24 : 15,
                                      right: index == exclusive.length - 1
                                          ? 24
                                          : 0),
                                  child: FoodCard(
                                      item: exclusive[index],),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
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
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomGroceryCategoryPage(
                                                  selectedOption:
                                                      shopCategory[1]
                                                          ['selectedOption'],
                                                  appBarTitle: "Best Selling",
                                                  list: bestSelling)));
                                },
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontFamily: 'Gilroy'),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                        child: SizedBox(
                          height: 250,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: bestSelling.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 24 : 15,
                                      right: index == bestSelling.length - 1
                                          ? 24
                                          : 0),
                                  child: FoodCard(
                                      item: bestSelling[index],),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
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
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const Explore())));
                                },
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontFamily: 'Gilroy'),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: groceryCategories.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> item =
                                    groceryCategories[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 24 : 15,
                                      right:
                                          index == groceryCategories.length - 1
                                              ? 24
                                              : 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  CustomGroceryCategoryPage(
                                                      selectedOption: null,
                                                      appBarTitle:
                                                          groceryCategories[
                                                              index]['title'],
                                                      list: groceryCategories[
                                                          index]['items']))));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(19),
                                          color: item['color']),
                                      width: 248.19,
                                      height: 105,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            item['image'],
                                            width: 71.9,
                                            height: 71.9,
                                          ),
                                          SizedBox(
                                            width: 145,
                                            child: Text(
                                              item['title'],
                                              style: const TextStyle(
                                                  fontFamily: "Gilroy",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          height: 250,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: meat.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 24 : 15,
                                      right: index == meat.length - 1 ? 24 : 0),
                                  child: FoodCard(
                                      item: meat[index],),
                                );
                              }),
                        ),
                      )
                    ],
                  )
                : (searchItems.isEmpty
                    ? const Center(
                        child: Text(
                          'No Item Found',
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 30,
                              color: Colors.grey),
                        ),
                      )
                    : SizedBox(
                        height: 500,
                        child: CustomGrid(list: searchItems, crossAxisCount: 2),
                      )),
          ],
        )),
      )),
    );
  }
}
