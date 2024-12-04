/*import 'package:flutter/material.dart';
import 'components/top_bar/top_bar.dart';
import 'components/top_bar/top_bar_view_model.dart';
import 'components/input_field/input_field.dart';
import 'components/input_field/input_field_view_model.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80), // Ajuste a altura da top bar
          child: TopBar(
            viewModel: TopBarViewModel(
              backgroundColor: Colors.blue,
              leftImage: 'assets/main_icon.png', // Sua imagem aqui
              title: "Título da TopBar", // Título da TopBar
              rightIcon: Icons.notifications, // Ícone à direita
              onRightIconPressed: () {
                print("Ícone pressionado!");
              },
            ),
          ),
        ),
        body: Column(
          children: [
            // Outros widgets abaixo da top bar
            Expanded(child: Center(child: Text('Conteúdo principal'))),
          ],
        ),
      ),
    );
  }
}
===
class TopBar extends StatelessWidget {
  final TopBarViewModel viewModel;

  const TopBar({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: viewModel.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          if (viewModel.leftImage != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                viewModel.leftImage!,
                height: 40,  // Aumentando o tamanho da imagem
                width: 40,   // Aumentando o tamanho da imagem
              ),
            ),
          Expanded(
            child: viewModel.title != null
                ? Text(
                    viewModel.title!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                : viewModel.inputField ?? const SizedBox.shrink(),
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

*/