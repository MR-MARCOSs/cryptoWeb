// bottom_bar_view_model.dart
import 'package:flutter/material.dart';

class BottomBarViewModel with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<String> _favoriteCoins = []; // Lista de moedas favoritas
  List<String> get favoriteCoins => _favoriteCoins;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void toggleFavorite(String coinSymbol) {
    if (_favoriteCoins.contains(coinSymbol)) {
      _favoriteCoins.remove(coinSymbol);
    } else {
      _favoriteCoins.add(coinSymbol);
    }
    notifyListeners();
  }
}
