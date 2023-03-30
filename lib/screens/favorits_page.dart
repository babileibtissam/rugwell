import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rugwell/models/cart.dart';
import 'package:rugwell/models/rugs.dart';

import 'package:rugwell/widgets/cart_item.dart';
import 'package:rugwell/widgets/favorite_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: ((context, value, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Favorits',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: value.getUserFavorite().length,
                      itemBuilder: (context, index) {
                        // get individual rug
                        Rug individualRug = value.getUserFavorite()[index];
                        // return the cart item
                        return FavoriteItem(
                          rug: individualRug,
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
