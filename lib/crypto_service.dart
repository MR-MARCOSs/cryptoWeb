import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoService {
  // URL da API CoinGecko para pegar os preços das 5 principais criptos
  final String _url = 'https://api.coingecko.com/api/v3/coins/markets';
  
  Future<List<Map<String, dynamic>>> fetchCryptoPrices() async {
    final response = await http.get(Uri.parse('$_url?vs_currency=brl&order=market_cap_desc&per_page=10&page=1'));
    
    if (response.statusCode == 200) {
      // Se a resposta for bem-sucedida, retornamos os dados
      final List<dynamic> data = json.decode(response.body);
      return data.map((coin) => coin as Map<String, dynamic>).toList();
    } else {
      // Caso contrário, lançamos um erro
      throw Exception('Failed to load crypto prices');
    }
  }
}
