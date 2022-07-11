import 'package:flutter/cupertino.dart';

class CartViewModel with ChangeNotifier {
  int _cartCount = 0;

  int get getCartCount => _cartCount;

  void addCartCount() {
    _cartCount = ++_cartCount;
    notifyListeners();
  }

  void minusCartCount() {
    _cartCount = --_cartCount;
    notifyListeners();
  }
}
