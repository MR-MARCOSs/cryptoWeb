import 'package:flutter/material.dart';

class CoinBarViewModel {
  final Image coinImage;
  final String value;
  final String coinSymbol;  // Novo campo para armazenar o anagrama da moeda
  final IconData icon1;
  final IconData icon2;
  final Color? icon1Color;
  final Color? icon2Color;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidth;

  CoinBarViewModel({
    required this.coinImage,
    required this.value,
    required this.coinSymbol, // Inicializando o novo campo
    required this.icon1,
    required this.icon2,
    this.icon1Color,
    this.icon2Color,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
  });
}
