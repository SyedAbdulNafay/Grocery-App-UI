import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<Map<String, dynamic>> list = [
    {"icon": const Icon(Icons.shopping_bag_rounded), "title": "Orders"},
    {
      "icon": const Icon(Icons.perm_device_information_rounded),
      "title": "My Details"
    },
    {"icon": const Icon(Icons.location_on_sharp), "title": "Delivery Address"},
    {"icon": const Icon(Icons.credit_card), "title": "Payment Methods"},
    {"icon": const Icon(Icons.airplane_ticket_outlined), "title": "Promo Code"},
    {"icon": const Icon(Icons.notifications_none), "title": "Notifications"},
    {"icon": const Icon(Icons.help_outline_sharp), "title": "Help"},
    {"icon": const Icon(Icons.info_outline), "title": "About"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset('assets/Images/profile_pic.png'),
            title: Row(
              children: [
                const Text(
                  "Abdul Nafay",
                  style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () {},
                    color: Theme.of(context).colorScheme.primary)
              ],
            ),
            subtitle: const Text(
              "sabdulnafay6@gmail.com",
              style: TextStyle(
                  fontFamily: "Gilroy", fontSize: 14, color: Colors.grey),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: list[index]['icon'],
                    title: Text(
                      "${list[index]['title']}",
                      style: const TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right)),
                  );
                })),
          ),
          Align(
              alignment: const Alignment(0, 0.9),
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 243, 242, 1),
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 70,),
                        Text(
                          "Log Out",
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
