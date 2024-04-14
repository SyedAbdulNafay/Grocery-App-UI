import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class GlassBox extends StatelessWidget {
  const GlassBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: Container(),
          ),
          const Column(
            children: [
              Text("Enter your mobile number", style: TextStyle(fontFamily: 'Gilroy', fontWeight: FontWeight.w600, fontSize: 30),),
              Form(
                child: IntlPhoneField(
                  
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
