import 'package:flutter/material.dart';

class InputFieldViewModel {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final Color fillColor;
  final Color borderColor;
  final bool hasBorder;
  final IconData? icon;
  final Function(String)? onChanged;

  InputFieldViewModel({
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.fillColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.hasBorder = true,
    this.icon,
    this.onChanged,
  });
}
