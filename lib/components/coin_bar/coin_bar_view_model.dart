import 'package:flutter/material.dart';

class CoinBarViewModel {
  final Image coinImage;
  final String value;
  final IconData icon1;
  final IconData icon2;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidth;

  CoinBarViewModel({
    required this.coinImage,
    required this.value,
    required this.icon1,
    required this.icon2,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
  });
}
