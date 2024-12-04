import 'package:flutter/material.dart';

class CoinBarViewModel {
  final Image coinImage;
  final String value;
  final String coinSymbol;
  final IconData icon1;
  final IconData icon2;
  final Color? icon1Color;
  final Color? icon2Color;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onIcon1Pressed; // Callback adicionado


  CoinBarViewModel({
    required this.coinImage,
    required this.value,
    required this.coinSymbol,
    required this.icon1,
    required this.icon2,
    this.icon1Color,
    this.icon2Color,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
    this.onIcon1Pressed, //  Parâmetro adicionado
  });
}