import 'package:flutter/material.dart';
import 'package:rugwell/models/rugs.dart';

class Cart extends ChangeNotifier {
  List<Rug> rugShop = [
    Rug(
      name: 'moroccan rug',
      price: '2500',
      imagePath: 'assets/images/rug3.png',
      description:
          'Fabulous Taznakht rug, Home Decor, Area Rug, Beautiful Moroccan Berber Rug ( 254 x 265 CM )',
    ),
    Rug(
      name: 'moroccan rug',
      price: '2500',
      imagePath: 'assets/images/rug4.png',
      description:
          'handmade Moroccan rug moroccan traditional carpets personalized rug wool (254 x 250 CM)',
    ),
    Rug(
      name: 'moroccan rug',
      price: '1000',
      imagePath: 'assets/images/rug2.png',
      description:
          'moroccan rug, hand made rug, taznakht rugs, Berber natural wool rug, New rug, woven rug, moroccan traditional carpets (150 x 250 CM)',
    ),
    Rug(
      name: 'moroccan rug',
      price: '1200',
      imagePath: 'assets/images/rug7.png',
      description:
          'Handmade Berber Rug Moroccan Taznakht Wool Carpet Women Weavers (250 x 300 CM)',
    ),
    Rug(
      name: 'moroccan rug',
      price: '2700',
      imagePath: 'assets/images/rug1.png',
      description:
          'Unique Taznakht rug, Moroccan Berber Rug, home decor ( 152 x 220 CM )',
    ),
    Rug(
      name: 'moroccan rug',
      price: '1200',
      imagePath: 'assets/images/rug5.png',
      description:
          'Fabulous Taznakht rug, Home Decor, Area Rug, Beautiful Moroccan Berber Rug ( 254 x 345 CM )',
    ),
  ];

  // list of rugs in user cart
  List<Rug> userCart = [];
  // list of rugs for sales
  List<Rug> getRugList() {
    return rugShop;
  }

  // get cart
  List<Rug> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Rug rug) {
    userCart.add(rug);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Rug rug) {
    userCart.remove(rug);
    notifyListeners();
  }

  // String calculateTotal() {
  //   double totalPrice = 0;
  //   for (int i = 0; i < userCart.length; i++) {
  //     totalPrice += double.parse(userCart[i][1]);
  //   }
  //   return totalPrice.toStringAsFixed(2);
  // }
}
