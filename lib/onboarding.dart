import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app_ui/sign_in.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        Image.asset(
          width: size.width,
          height: size.height,
          'assets/Images/onboard.jpg',
          fit: BoxFit.cover,
        ),
        Container(alignment: const Alignment(0.1, 0.122), child: Image.asset('assets/Images/carrot_head_vector-removebg-preview.png', width: 23.41, height: 20.92,)),
        Container(alignment: const Alignment(0, 0.2), child: Image.asset('assets/Images/carrot_body_vector-removebg-preview.png', width: 38.21, height: 43.53,)),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Welcome", style: TextStyle(color: Colors.white, fontFamily: 'Gilroy', fontSize: 40),),
            const Text("to our store", style: TextStyle(color: Colors.white, fontFamily: 'Gilroy', fontSize: 40),),
            const Text("Get your groceries in as fast as one hour", style: TextStyle(color: Colors.grey, fontFamily: 'Gilroy'), ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0, top: 30),
              child: Container(
                alignment: const Alignment(0, 0.5), // Adjust the y value to position the button vertically
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const SignIn()));
                  },
                  color: Colors.green,
                  height: 65,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
                  minWidth: 353,
                  child: const Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}