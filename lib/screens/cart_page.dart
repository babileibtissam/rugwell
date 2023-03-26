import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rugwell/models/cart.dart';
import 'package:rugwell/models/rugs.dart';
import 'package:rugwell/screens/login_or_register.dart';
import 'package:rugwell/widgets/app_button.dart';
import 'package:rugwell/widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: ((context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: value.getUserCart().length,
                      itemBuilder: (context, index) {
                        // get individual rug
                        Rug individualRug = value.getUserCart()[index];
                        // return the cart item
                        return CartItem(
                          rug: individualRug,
                        );
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23.0),
                    child: AppButton(
                      text: 'Buy Now',
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginOrRegister()),
                        );
                      },
                    )),
              ],
            ),
          )),
    );
  }
}
