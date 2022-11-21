import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_ui/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80, right: 80, bottom: 40, top: 160),
            child: Image.asset('lib/images/avocado.png'),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('We deliver groceries at your doorstep',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 35),
            child: Text(
              'Fresh items everyday',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  )),
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
