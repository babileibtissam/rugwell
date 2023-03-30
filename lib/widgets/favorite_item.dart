import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rugwell/models/cart.dart';
import 'package:rugwell/models/rugs.dart';

class FavoriteItem extends StatefulWidget {
  Rug rug;
  FavoriteItem({Key? key, required this.rug}) : super(key: key);

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  //remove Item From Favorite
  void removeItemFromFavorite() {
    Provider.of<Cart>(context, listen: false)
        .removeItemFromFavorite(widget.rug);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 219, 219, 219),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.rug.imagePath),
        title: Text(widget.rug.name),
        subtitle: Text(widget.rug.price + 'DH'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromFavorite,
        ),
      ),
    );
  }
}
