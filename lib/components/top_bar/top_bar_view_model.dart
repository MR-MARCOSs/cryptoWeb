import 'package:flutter/material.dart';
import '../input_field/input_field.dart';
import '../input_field/input_field_view_model.dart';

class TopBarViewModel {
  final Color backgroundColor;
  final String? leftImage;
  final String? title;
  final IconData? rightIcon;
  final void Function()? onRightIconPressed;
  final Widget? inputField;
  final Color iconColor; // Cor dos ícones adicionada

  TopBarViewModel({
    required this.backgroundColor,
    this.leftImage,
    this.title,
    this.rightIcon,
    this.onRightIconPressed,
    this.inputField,
    this.iconColor = Colors.white, // Cor padrão branca
  });
}
