import 'dart:convert';

import 'package:deliveryfood/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({
    required this.sharedPreferences,
  });

  List<String> cart = [];

  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    sharedPreferences.containsKey(AppConstants.cartList);
    sharedPreferences.containsKey(AppConstants.cartHistoryList);
    cart = [];

    cartList.forEach((element) {
      return cart.add(
        jsonEncode(element),
      );
    });

    sharedPreferences.setStringList(AppConstants.cartList, cart);

    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.cartList)) {
      carts = sharedPreferences.getStringList(AppConstants.cartList)!;
    }
    List<CartModel> cartList = [];
    carts.forEach((element) {
      cartList.add(
        CartModel.fromJson(
          jsonDecode(element),
        ),
      );
    });

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.cartHistoryList)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.cartHistoryList)!;
    }
    List<CartModel> cartListHistory = [];

    cartHistory.forEach((element) {
      cartListHistory.add(
        CartModel.fromJson(
          jsonDecode(element),
        ),
      );
    });
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.cartHistoryList)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.cartHistoryList)!;
    }
    for (var i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.cartHistoryList, cartHistory);
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.cartList);
  }
}
