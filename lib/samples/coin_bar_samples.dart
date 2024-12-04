/*import 'package:flutter/material.dart';
import 'components/coin_bar/coin_bar.dart';
import 'components/coin_bar/coin_bar_view_model.dart';
import 'crypto_service.dart';

// Função principal que inicia a aplicação Flutter
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Coin Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoinBarList(), // Configurando a tela principal
    );
  }
}

class CoinBarList extends StatefulWidget {
  @override
  _CoinBarListState createState() => _CoinBarListState();
}

class _CoinBarListState extends State<CoinBarList> {
  final CryptoService _cryptoService = CryptoService();
  List<CoinBarViewModel> _coinBars = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCryptoPrices();
  }

  // Função que carrega os preços das criptomoedas
  Future<void> _loadCryptoPrices() async {
    try {
      final cryptoData = await _cryptoService.fetchCryptoPrices();
      setState(() {
        _coinBars = cryptoData.map((coin) {
          // Para cada moeda, criamos o CoinBarViewModel
          return CoinBarViewModel(
            coinImage: Image.network(coin['image']),
            value: 'R\$ ${coin['current_price']}',
            coinSymbol: coin['symbol'].toUpperCase(),  // Adicionando o símbolo da moeda
            icon1: Icons.favorite_sharp, // Exemplo de ícone
            icon2: Icons.arrow_downward, // Exemplo de ícone
            icon1Color: Color(0xFF878787),
            icon2Color: Colors.red,
            fillColor: Color(0xFFE9E9E9),
            borderColor: Color(0xFF7F24CE),
            borderWidth: 2.0,
          );
        }).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Erro ao carregar dados: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crypto Coin Bar')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _coinBars.map((viewModel) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        margin: const EdgeInsets.only(left: 30), // Espaço extra à esquerda
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
*/