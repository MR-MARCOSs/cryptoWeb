// coin_bar_view_model.dart

import 'package:flutter/material.dart';

class CoinBarViewModel {
  final String coinImage;
  final String coinValue;
  final IconData icon1;
  final IconData icon2;
  final bool hasBorder;

  CoinBarViewModel({
    required this.coinImage,
    required this.coinValue,
    required this.icon1,
    required this.icon2,
    this.hasBorder = false, // Default is no border
  });
}