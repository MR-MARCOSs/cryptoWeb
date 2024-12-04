import 'package:flutter/material.dart';
import '../input_field/input_field.dart';
import '../input_field/input_field_view_model.dart'; // Importe seu componente input_field aqui
import 'top_bar_view_model.dart';

class TopBar extends StatelessWidget {
  final TopBarViewModel viewModel;

  const TopBar({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: viewModel.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Ajuste o padding conforme necessário
      child: Row(
        children: [
          if (viewModel.leftImage != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0), // Espaçamento entre a imagem e o título/input
              child: Image.asset(
                viewModel.leftImage!,
                height: 24, // Ajuste a altura conforme necessário
                width: 24,   // Ajuste a largura conforme necessário
              ),
            ),
          Expanded(
            child: viewModel.title != null
                ? Text(
                    viewModel.title!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Estilo do título
                    textAlign: TextAlign.center, // Centralizar o título
                  )
                : viewModel.inputField ?? const SizedBox.shrink(), // Seu componente input_field
          ),
          if (viewModel.rightIcon != null)
            IconButton(
              onPressed: viewModel.onRightIconPressed,
              icon: Icon(viewModel.rightIcon),
            ),
        ],
      ),
    );
  }
}