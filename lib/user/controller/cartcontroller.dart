import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends ChangeNotifier {
  int _count = 0;

  double _totalprice = 0;

  void setPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _count);
    prefs.setDouble('total_price', _totalprice);
    notifyListeners();
  }

  void getPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt('cart_item') ?? 0;
    prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addCount() {
    _count++;
    setPreference();
    notifyListeners();
  }

  void removeCount() {
    _count--;
    setPreference();
    notifyListeners();
  }

  void addTotalPrice(double product_price) {
    _totalprice = _totalprice + product_price;
    setPreference();
    notifyListeners();
  }

  void removeTotalPrice(double product_price) {
    _totalprice = _totalprice - product_price;
    setPreference();
    notifyListeners();
  }

  double getTotalPrice() {
    getPreference();
    return _totalprice;
  }

  int getCount() {
    getPreference();
    return _count;
  }
}
