/*import 'package:flutter/material.dart';
import 'components/button/button.dart'; // Certifique-se de que o arquivo Button.dart está no mesmo diretório ou ajustando o caminho
import 'components/button/button_view_model.dart'; // Certifique-se de que o arquivo ButtonViewModel.dart está no mesmo diretório ou ajustando o caminho

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ButtonExamplesPage(),
    );
  }
}

class ButtonExamplesPage extends StatelessWidget {
  const ButtonExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplos de Button')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Exemplo de Button com texto e cor de fundo personalizada
            Button(
              viewModel: ButtonViewModel(
                buttonText: 'Botão sem borda',
                fillColor: Colors.blue,
                onPressed: () => print('Botão 1 pressionado'),
              ),
            ),
            const SizedBox(height: 20),

            // Exemplo de Button com borda e cor personalizada
            Button(
              viewModel: ButtonViewModel(
                buttonText: 'Botão com borda',
                fillColor: Colors.green,
                hasBorder: true,
                borderColor: Colors.red,
                onPressed: () => print('Botão 2 pressionado'),
              ),
            ),
            const SizedBox(height: 20),

            // Exemplo de Button com cor de texto personalizada
            Button(
              viewModel: ButtonViewModel(
                buttonText: 'Botão com texto personalizado',
                fillColor: Colors.orange,
                textColor: Colors.black,
                onPressed: () => print('Botão 3 pressionado'),
              ),
            ),
            const SizedBox(height: 20),

            // Exemplo de Button com borda e cor de fundo mais clara
            Button(
              viewModel: ButtonViewModel(
                buttonText: 'Botão claro com borda',
                fillColor: Colors.purple,
                hasBorder: true,
                borderColor: Colors.white,
                onPressed: () => print('Botão 4 pressionado'),
              ),
            ),

            Button(
              viewModel: ButtonViewModel(
                buttonText: 'Botão com borda personalizada',
                fillColor: Colors.blue,
                hasBorder: true,
                borderColor: Colors.red,
                borderWidth: 4.0,  // Definindo a espessura da borda
                onPressed: () => print('Botão com borda personalizada pressionado'),
              ),
            ),

                Center( // Ou Align
      child:      Button(
        viewModel: ButtonViewModel(
          buttonText: 'Botão Grande',
          fillColor: Colors.blue,
          onPressed: () {
            // Ação ao pressionar o botão
            print('Botão Grande pressionado!');
          },
          width: 150, // Largura de 250 pixels
          height: 50, // Altura de 60 pixels
        ),
      )
      )

          ],
        ),
      ),
    );
  }
}
*/