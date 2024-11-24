import 'package:flutter/material.dart';
import 'components/coin_bar/coin_bar.dart';
import 'components/coin_bar/coin_bar_view_model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CoinBarScreen(),
    );
  }
}

class CoinBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Criando o CoinBarViewModel com valores fictícios
    final viewModel = CoinBarViewModel(
      coinImage: Image.asset('assets/bitcoin.png'), // Exemplo de imagem de moeda
      value: '\$15,000', // Valor da moeda
      icon1: Icons.arrow_upward, // Ícone de aumento
      icon2: Icons.arrow_downward, // Ícone de queda
      fillColor: Colors.blueAccent, // Cor de fundo personalizada
      borderColor: Colors.white, // Cor da borda
      borderWidth: 2.0, // Largura da borda
    );

    return Scaffold(
      appBar: AppBar(title: Text('Coin Bar Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CoinBar(viewModel: viewModel),
      ),
    );
  }
}
