import 'package:flutter/material.dart';

class ButtonViewModel {
  final String buttonText;
  final Color fillColor;
  final bool hasBorder;
  final Color borderColor;
  final VoidCallback? onPressed;
  final Color textColor;



  ButtonViewModel({
    required this.buttonText,
    required this.fillColor,
    this.hasBorder = false, // Sem borda por padrão
    this.borderColor = Colors.grey,  // Cor da borda se houver
    required this.onPressed,
    this.textColor = Colors.white, // Cor do texto padrão (branco)
  });
}