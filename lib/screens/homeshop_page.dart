import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rugwell/models/cart.dart';
import 'package:rugwell/models/rugs.dart';
import 'package:rugwell/widgets/rug_tile.dart';

import '../widgets/home_rugtile.dart';

class HomeShopPage extends StatefulWidget {
  const HomeShopPage({Key? key}) : super(key: key);

  @override
  State<HomeShopPage> createState() => _HomeShopPageState();
}

class _HomeShopPageState extends State<HomeShopPage> {
  String search = '';
  // add rug to cart

  void addRugToCart(Rug rug) {
    Provider.of<Cart>(context, listen: false).addItemToCart(rug);

    // show message successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('successfully added'),
              content: Text('check your cart'),
            ));
  }

  void addRugToFavorite(Rug rug) {
    Provider.of<Cart>(context, listen: false).addItemToFavorite(rug);

    // show message successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('successfully added'),
              content: Text('check your favorites'),
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
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
                fontSize: 12,
              ),
            ),
          ),

          SizedBox(
            height: 8,
          ),

          // search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 45,
              child: TextField(
                onChanged: (v) {
                  setState(() {
                    search = v;
                  });
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 209, 209, 209)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 114, 114, 114)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                  fillColor: Color.fromARGB(255, 228, 228, 228),
                  filled: true,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Carpets',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 16,
          ),

          Expanded(
            child: ListView.builder(
              itemCount: value.getRugList(search).length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Rug rug = value.getRugList(search)[index];
                //return rug
                return HomeRugTile(
                  rug: rug,
                  onTap: () => addRugToCart(rug),
                  onTap2: () => addRugToFavorite(rug),
                );
              },
            ),
          ),
          const Padding(
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
