import 'package:flutter/material.dart';
import 'package:grocery_app_ui/foodcard.dart';
import 'package:grocery_app_ui/grocery_provider.dart';
import 'package:grocery_app_ui/pages/grocery_categories_page.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: FoodCard(
                          image: 'assets/Images/banana.png',
                          title: "Organic bananas",
                          quantity: "7 pcs",
                          price: 4.99),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: FoodCard(
                          image: 'assets/Images/apple.png',
                          title: "Red Apples",
                          quantity: "1kg",
                          price: 4.99),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: groceryCategories.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> item = groceryCategories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      CustomGroceryCategoryPage(
                                          appBarTitle: groceryCategories[index]
                                              ['title'],
                                          list: groceryCategories[index]
                                              ['items']))));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: item['color']),
                          width: 248.19,
                          height: 105,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: meat.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: FoodCard(
                          image: meat[index].image,
                          title: meat[index].title,
                          quantity: meat[index].quantity,
                          price: meat[index].price),
                    );
                  }),
            ),
          ],
        )),
      ),
    ));
  }
}
