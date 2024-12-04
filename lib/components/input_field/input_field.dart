import 'package:flutter/material.dart';
import 'input_field_view_model.dart';

class InputField extends StatelessWidget {
  final InputFieldViewModel viewModel;

  const InputField({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: viewModel.controller,
      obscureText: viewModel.obscureText,  // Para senhas
      decoration: InputDecoration(
        filled: true,
        fillColor: viewModel.fillColor,  // Cor de preenchimento
        border: viewModel.hasBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0), // Cantos arredondados
                borderSide: BorderSide(color: viewModel.borderColor),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none, // Sem borda
            ),
        prefixIcon: viewModel.icon != null
            ? Icon(viewModel.icon)
            : null,  // Ícone de pesquisa
        hintText: viewModel.hintText,  // Texto de dica
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0)
      ),
      onChanged: viewModel.onChanged,
    );
  }
}
