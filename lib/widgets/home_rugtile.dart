import 'package:flutter/material.dart';
import 'package:rugwell/models/rugs.dart';

class HomeRugTile extends StatelessWidget {
  Rug rug;
  void Function()? onTap;
  void Function()? onTap2;
  HomeRugTile(
      {Key? key, required this.rug, required this.onTap, required this.onTap2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Rug image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              rug.imagePath,
              height: 300,
              width: 300,
            ),
          ),
          // rug description
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(rug.description),
          ),
          // rug price and name
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rug.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(rug.price + 'DH'),
                  ],
                ),
                GestureDetector(
                  onTap: onTap2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
