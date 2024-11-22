import 'package:flutter/material.dart';
import 'button_view_model.dart';

class Button extends StatelessWidget {
  final ButtonViewModel viewModel;

  const Button({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: viewModel.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: viewModel.fillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Cantos arredondados
        ),
        side: viewModel.hasBorder
            ? BorderSide(color: viewModel.borderColor)
            : BorderSide.none, // Sem borda se hasBorder for false
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Padding interno
      ),
      child: Text(
        viewModel.buttonText,
        style: TextStyle(
          color: viewModel.textColor, // Cor do texto, contraste com fillColor
        ),
      ),
    );
  }
}