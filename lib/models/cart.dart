import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rugwell/models/rugs.dart';

class Cart extends ChangeNotifier {
  List<Rug> rugShop = [
    Rug(
      name: 'Asati Rug',
      price: '2500',
      imagePath: 'assets/images/rug3.png',
      description:
          'Fabulous Taznakht rug, Home Decor, Area Rug, Beautiful Moroccan Berber Rug ( 254 x 265 CM )',
    ),
    Rug(
      name: 'Abran Rug',
      price: '2500',
      imagePath: 'assets/images/rug4.png',
      description:
          'handmade Moroccan rug moroccan traditional carpets personalized rug wool (254 x 250 CM)',
    ),
    Rug(
      name: 'Amyanaw Rug',
      price: '1000',
      imagePath: 'assets/images/rug2.png',
      description:
          'moroccan rug, hand made rug, taznakht rugs,moroccan traditional carpets (150 x 250 CM)',
    ),
    Rug(
      name: 'Takhlalt Rug',
      price: '1200',
      imagePath: 'assets/images/rug7.png',
      description:
          'Handmade Berber Rug Moroccan Taznakht Wool Carpet Women Weavers (250 x 300 CM)',
    ),
    Rug(
      name: 'Amdrar Rug',
      price: '2700',
      imagePath: 'assets/images/rug1.png',
      description:
          'Unique Taznakht rug, Moroccan Berber Rug, home decor ( 152 x 220 CM )',
    ),
    Rug(
      name: 'Asati Rug',
      price: '1200',
      imagePath: 'assets/images/rug5.png',
      description:
          'Fabulous Taznakht rug, Home Decor, Area Rug, Beautiful Moroccan Berber Rug ( 254 x 345 CM )',
    ),
  ];

  // list of rugs in user cart
  List<Rug> userCart = [];

  // list of rugs in user favorite
  List<Rug> userFavorite = [];

  // list of rugs for sales
  List<Rug> getRugList(String search) {
    if (search.length == 0) {
      return rugShop;
    } else {
      // log(search);
      // log(rugShop
      //     .where((rug) => rug.name.contains(search))
      //     .toList()
      //     .toString());
      return rugShop.where((rug) => rug.name.contains(search)).toList();
    }
  }

  // get cart
  List<Rug> getUserCart() {
    return userCart;
  }

  // get favorite
  List<Rug> getUserFavorite() {
    return userFavorite;
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

  // add item to Favorite
  void addItemToFavorite(Rug rug) {
    userFavorite.add(rug);
    notifyListeners();
  }

  // remove item from Favorite
  void removeItemFromFavorite(Rug rug) {
    userFavorite.remove(rug);
    notifyListeners();
  }
}
