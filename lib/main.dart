import 'package:flutter/material.dart';
import 'package:grocery_app_ui/models/cart_provider.dart';
import 'package:grocery_app_ui/models/favourite_provider.dart';
import 'package:grocery_app_ui/models/item_provider.dart';
import 'package:grocery_app_ui/models/local_storage.dart';
import 'package:grocery_app_ui/pages/splash_screen.dart';
import 'package:grocery_app_ui/services/item.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initialize();
  runApp(FutureBuilder(
      future: LocalStorage.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const MyApp();
        } else {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => FavouriteProvider())),
        ChangeNotifierProvider(create: ((context) => CartProvider())),
        ChangeNotifierProvider(
            create: ((context) => ItemProvider(Item(
                image: '', title: '', quantity: '', price: 0, detail: '')))),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color(0xFF53B175)),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
