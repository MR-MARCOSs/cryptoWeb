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
    final coinBars = [
      CoinBarViewModel(
        coinImage: Image.asset('assets/Dogecoin_Logo.png'),
        value: '\$15,000',
        icon1: Icons.favorite_sharp,
        icon2: Icons.arrow_upward,
        icon1Color: Color(0xFF7F24CE), // Coração roxo
        icon2Color: Colors.green, // Seta vermelha
        fillColor: Color(0xFFE9E9E9),
        borderColor: Color(0xFF7F24CE),
        borderWidth: 2.0,
      ),
      CoinBarViewModel(
        coinImage: Image.asset('assets/bitcoin_icon.png'),
        value: '\$25,000',
        icon1: Icons.favorite_sharp,
        icon2: Icons.arrow_downward,
        icon1Color: Color(0xFF878787), // Coração cinza
        icon2Color: Colors.red,
        fillColor: Color(0xFFE9E9E9),
        borderColor: Color(0xFF7F24CE),
        borderWidth: 2.0,
      ),
      CoinBarViewModel(
        coinImage: Image.asset('assets/eth_icon.png'),
        value: '\$10,000',
        icon1: Icons.favorite_sharp,
        icon2: Icons.arrow_downward,
        icon1Color: Color(0xFF878787), // Coração cinza
        icon2Color: Colors.red,
        fillColor: Color(0xFFE9E9E9),
        borderColor: Color(0xFF7F24CE),
        borderWidth: 2.0,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Coin Bar List')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: coinBars.map((viewModel) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 30), // Espaço extra à esquerda
                  child: CoinBar(viewModel: viewModel),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
