import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/bottom_bar/bottom_bar.dart';
import '../../components/bottom_bar/bottom_bar_view_model.dart';
import '../../components/coin_bar/coin_bar.dart';
import '../../components/coin_bar/coin_bar_view_model.dart';
import '../service/crypto_service.dart';
import '../../components/top_bar/top_bar.dart';
import '../../components/top_bar/top_bar_view_model.dart';
import '../../components/input_field/input_field.dart';
import '../../components/input_field/input_field_view_model.dart';
import '../../components/favorites/favorites_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomBarViewModel()),
        ChangeNotifierProvider(create: (_) => FavoritesViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomBarViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomBarViewModel>(
        builder: (context, viewModel, child) {
          final currentPage = [
            CoinBarList(),
            ProfilePage(),
          ][viewModel.currentIndex];

          return currentPage;
        },
      ),
      bottomNavigationBar: Consumer<BottomBarViewModel>(
        builder: (context, viewModel, child) {
          return BottomBar(
            currentIndex: viewModel.currentIndex,
            onTabChange: (index) {
              viewModel.setIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.currency_bitcoin),
                label: 'Crypto',
                backgroundColor:
                    viewModel.currentIndex == 0 ? Colors.purple : Colors.grey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor:
                    viewModel.currentIndex == 1 ? Colors.purple : Colors.grey,
              ),
            ],
          );
        },
      ),
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
  List<CoinBarViewModel> _filteredCoinBars = [];
  bool _isLoading = true;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _currencySymbol = 'R\$';
  double _currencyMultiplier = 1.0;

  @override
  void initState() {
    super.initState();
    _loadCryptoPrices();
    _searchController.addListener(_onSearchChanged);
  }

  Future<void> _loadCryptoPrices() async {
    try {
      final cryptoData = await _cryptoService.fetchCryptoPrices();
      setState(() {
        _coinBars = cryptoData.map((coin) {
          return CoinBarViewModel(
            coinImage: Image.network(coin['image']),
            value: 'R\$ ${coin['current_price']}',
            coinSymbol: coin['symbol'].toUpperCase(),
            icon1: Icons.favorite_sharp,
            icon2: Icons.arrow_downward,
            icon1Color: Color(0xFF878787),
            icon2Color: Colors.red,
            fillColor: Color(0xFFE9E9E9),
            borderColor: Color(0xFF7F24CE),
            borderWidth: 2.0,
          );
        }).toList();
        _filteredCoinBars = List.from(_coinBars);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Erro ao carregar dados: $e');
    }
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
      _filteredCoinBars = _coinBars.where((coin) {
        final coinName = coin.coinSymbol.toLowerCase();
        return coinName.contains(_searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: TopBar(
          viewModel: TopBarViewModel(
            backgroundColor: Color(0xFF7F24CE),
            leftImage: 'assets/main_icon.png',
            rightIcon: Icons.settings,
            iconColor: Colors.white,
            onRightIconPressed: () {
              _showCurrencyDialog(context);
            },
            inputField: InputField(
              viewModel: InputFieldViewModel(
                controller: _searchController,
                hintText: 'Search',
                fillColor: Color(0xFFAE53FE),
                borderColor: Colors.white,
                hasBorder: true,
                icon: Icons.search,
                onChanged: (text) {
                  _onSearchChanged();
                },
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _filteredCoinBars.map((viewModel) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CoinDetailsScreen(viewModel: viewModel),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: CoinBar(
                            viewModel: viewModel.copyWith(
                              value:
                                  '$_currencySymbol ${(double.parse(viewModel.value.split(' ')[1].replaceAll(',', '.')) * _currencyMultiplier).toStringAsFixed(2)}',
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
    );
  }

  void _showCurrencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione a moeda'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Real (R\$)'),
                onTap: () {
                  setState(() {
                    _currencySymbol = 'R\$';
                    _currencyMultiplier = 1.0;
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Dólar (U\$\$)'),
                onTap: () {
                  setState(() {
                    _currencySymbol = 'U\$\$';
                    _currencyMultiplier = 1 / 6;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class CoinDetailsScreen extends StatefulWidget {
  final CoinBarViewModel viewModel;

  CoinDetailsScreen({required this.viewModel});

  @override
  _CoinDetailsScreenState createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends State<CoinDetailsScreen> {
  TextEditingController _notificationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewModel.coinSymbol),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: widget.viewModel.coinImage.image),
            SizedBox(height: 16),
            Text('Valor atual: ${widget.viewModel.value}'),
            SizedBox(height: 32),
            Text('Notificação de preço:'),
            TextField(
              controller: _notificationController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Digite o valor desejado',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                double notificationValue;

                try {
                  notificationValue =
                      double.parse(_notificationController.text);

                  print(
                      'Notificação configurada para ${widget.viewModel.coinSymbol} a ${notificationValue}');
                } catch (e) {
                  print('Entrada inválida. Insira um número.');
                }
                Navigator.pop(context);
              },
              child: Text('Configurar Notificação'),
            ),
          ],
        ),
      ),
    );
  }
}

extension CoinBarViewModelExtension on CoinBarViewModel {
  CoinBarViewModel copyWith({
    Image? coinImage,
    String? value,
    String? coinSymbol,
    IconData? icon1,
    IconData? icon2,
    Color? icon1Color,
    Color? icon2Color,
    Color? fillColor,
    Color? borderColor,
    double? borderWidth,
  }) {
    return CoinBarViewModel(
      coinImage: coinImage ?? this.coinImage,
      value: value ?? this.value,
      coinSymbol: coinSymbol ?? this.coinSymbol,
      icon1: icon1 ?? this.icon1,
      icon2: icon2 ?? this.icon2,
      icon1Color: icon1Color ?? this.icon1Color,
      icon2Color: icon2Color ?? this.icon2Color,
      fillColor: fillColor ?? this.fillColor,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesViewModel>(context).favorites;
    final String _currencySymbol = 'R\$';
    final double _currencyMultiplier = 1.0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: TopBar(
          viewModel: TopBarViewModel(
            leftImage: 'assets/main_icon.png',
            backgroundColor: Color(0xFF7F24CE),
            title: "Profile",
            rightIcon: Icons.settings,
            iconColor: Colors.white,
            onRightIconPressed: () {
              print("Configurações pressionadas!");
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://www.example.com/your-profile-image.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'João da Silva',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'joao.silva@example.com',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Favoritas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            favorites.isEmpty
                ? Text('Nenhuma moeda favoritada.',
                    style: TextStyle(color: Colors.grey))
                : Column(
                    children: favorites.map((coin) {
                      // Apply the same currency conversion logic here
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: CoinBar(
                            viewModel: coin.copyWith(
                              value:
                                  '$_currencySymbol ${(double.parse(coin.value.split(' ')[1].replaceAll(',', '.')) * _currencyMultiplier).toStringAsFixed(2)}',
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
