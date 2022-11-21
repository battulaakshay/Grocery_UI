import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_ui/components/grocery_tile.dart';
import 'package:grocery_shop_ui/model/CartPage.dart';
import 'package:grocery_shop_ui/model/cart_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.shopping_bag,
        ),
        backgroundColor: Colors.black,
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartPage();
        })),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Good morning,',
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 120, 119, 119)),
              ),
              Text(
                'Let s order fresh items for you',
                style: GoogleFonts.notoSerif(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(),
              ),
              const Text(
                'Fresh Items',
                style: TextStyle(fontSize: 16),
              ),
              Expanded(child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: ((context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemToCart(index);
                        },
                      );
                    }),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
