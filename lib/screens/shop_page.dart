import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rugwell/models/cart.dart';
import 'package:rugwell/models/rugs.dart';
import 'package:rugwell/widgets/rug_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add rug to cart

  void addRugToCart(Rug rug) {
    Provider.of<Cart>(context, listen: false).addItemToCart(rug);

    // show message successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('successfully added'),
              content: Text('chek your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //saying welcome
          const Text(
            "Welcome",
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          const Text(
            "To RugWell Shop",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'where you can find a 100% handmade rugs',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          //hot picks

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Carpets',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                // Text(
                //   'See All',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: Colors.blue,
                //   ),
                // ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Rug rug = value.getRugList()[index];
                //return rug
                return RugTile(
                  rug: rug,
                  onTap: () => addRugToCart(rug),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 80,
              left: 25,
              right: 25,
            ),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
