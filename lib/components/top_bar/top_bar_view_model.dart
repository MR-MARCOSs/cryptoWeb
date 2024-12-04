import 'package:flutter/material.dart';
import '../input_field/input_field.dart';
import '../input_field/input_field_view_model.dart';

class TopBarViewModel {
  final Color backgroundColor;
  final String? leftImage;
  final String? title;
  final IconData? rightIcon;
  final VoidCallback? onRightIconPressed;
    final InputField? inputField; // Adiciona o inputField

  TopBarViewModel({
    required this.backgroundColor,
    this.leftImage,
    this.title,
    this.rightIcon,
    this.onRightIconPressed,
        this.inputField, // Não precisa de valor padrão
  }) : assert(title != null || inputField != null, "Forneça um título ou um inputField."); // Garante que pelo menos um dos dois seja fornecido

}