import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/bottom_bar/bottom_bar.dart';
import 'components/bottom_bar/bottom_bar_view_model.dart';
import 'components/coin_bar/coin_bar.dart';
import 'components/coin_bar/coin_bar_view_model.dart';
import 'crypto_service.dart';
import 'components/top_bar/top_bar.dart';
import 'components/top_bar/top_bar_view_model.dart';
import 'components/input_field/input_field.dart';
import 'components/input_field/input_field_view_model.dart';
import 'components/favorites/favorites_view_model.dart';


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
                backgroundColor: viewModel.currentIndex == 0
                    ? Colors.purple
                    : Colors.grey,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: viewModel.currentIndex == 1
                    ? Colors.purple
                    : Colors.grey,
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
              print("Configurações pressionadas!");
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
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        margin: const EdgeInsets.only(left: 30),
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


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesViewModel>(context).favorites;

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
                  backgroundImage: NetworkImage('https://www.example.com/your-profile-image.jpg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'João da Silva',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
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
                ? Text('Nenhuma moeda favoritada.', style: TextStyle(color: Colors.grey))
                : Column(
                    children: favorites.map((coin) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 30),
                          child: CoinBar(viewModel: coin),
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