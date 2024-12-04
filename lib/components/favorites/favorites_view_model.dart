import 'package:flutter/material.dart';
import '../coin_bar/coin_bar_view_model.dart';

class FavoritesViewModel extends ChangeNotifier {
  final List<CoinBarViewModel> _favorites = [];

  List<CoinBarViewModel> get favorites => _favorites;

  void toggleFavorite(CoinBarViewModel coin) {
    if (_favorites.any((favorite) => favorite.coinSymbol == coin.coinSymbol)) {
      _favorites.removeWhere((favorite) => favorite.coinSymbol == coin.coinSymbol);
    } else {
      _favorites.add(coin);
    }
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }
}
