import 'package:flutter/material.dart';


class InputFieldViewModel {
  final TextEditingController controller;
  final String hintText;
  final Color fillColor;
  final bool hasBorder;
  final Color borderColor; // Cor da borda, se houver
  final IconData? icon; // Ícone, se houver
  final bool obscureText; // Para campos de senha
   final ValueChanged<String>? onChanged;

  InputFieldViewModel({
    required this.controller,
    required this.hintText,
    required this.fillColor,
    this.hasBorder = true,
    this.borderColor = Colors.grey, // Cor padrão da borda
    this.icon,
    this.obscureText = false,
    this.onChanged,
  });
}
