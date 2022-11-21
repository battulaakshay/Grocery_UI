import 'package:flutter/material.dart';
import 'package:grocery_shop_ui/IntroPage.dart';
import 'package:grocery_shop_ui/model/cart_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: IntroPage(),
        ));
  }
}
