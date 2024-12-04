import 'package:flutter/material.dart';
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