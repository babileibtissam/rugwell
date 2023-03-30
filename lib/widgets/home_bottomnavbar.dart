import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  HomeBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        color: Colors.grey,
        activeColor: Colors.black,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Color.fromARGB(255, 190, 189, 189),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 17,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.favorite,
            text: ' Favorite',
          ),
        ],
      ),
    );
  }
}
