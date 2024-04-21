import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset('assets/Images/sign_in_bg-removebg-preview.png'),
          const Align(
            alignment: Alignment(-0.6, 0),
            child: SizedBox(
              width: 222,
              height: 63,
              child: Text(
                "Get your groceries with nectar",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700,
                    fontSize: 22),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: IntlPhoneField(
                  onTap: () {},
                )),
          ),
          const Center(
            child: Text(
              "Or connect with social media",
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Color.fromRGBO(130, 130, 130, 1)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19)),
              height: 67,
              onPressed: () {},
              color: const Color.fromRGBO(83, 131, 236, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/Images/google_vector.png',
                    width: 22.95,
                    height: 24.06,
                  ),
                  const Text(
                    "Continue with Google",
                    style: TextStyle(
                      color: Color.fromRGBO(252, 252, 252, 1),
                      fontFamily: 'Gilroy',
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19)),
              height: 67,
              onPressed: () {},
              color: const Color.fromRGBO(74, 102, 172, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/Images/fb_vector.png',
                    width: 22.95,
                    height: 24.06,
                  ),
                  const Text(
                    "Continue with Google",
                    style: TextStyle(
                      color: Color.fromRGBO(252, 252, 252, 1),
                      fontFamily: 'Gilroy',
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
