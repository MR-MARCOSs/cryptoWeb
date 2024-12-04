import 'package:flutter/material.dart';
import 'coin_bar_view_model.dart';
import 'package:provider/provider.dart';
import '../favorites/favorites_view_model.dart';
class CoinBar extends StatefulWidget {
  final CoinBarViewModel viewModel;

  const CoinBar({Key? key, required this.viewModel}) : super(key: key);

  @override
  _CoinBarState createState() => _CoinBarState();
}

class _CoinBarState extends State<CoinBar> {
  bool _isFavorite = false;  // Controla se o ícone foi clicado (favorito)

  @override
  Widget build(BuildContext context) {
    const double barHeight = 60.0;
    const double coinDiameter = barHeight;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Barra com o texto e os ícones
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          height: barHeight,
          decoration: BoxDecoration(
            color: widget.viewModel.fillColor ?? Colors.grey[200],
            border: widget.viewModel.borderColor != null && widget.viewModel.borderWidth != null
                ? Border.all(
                    color: widget.viewModel.borderColor!,
                    width: widget.viewModel.borderWidth!,
                  )
                : null,
          ),
          child: Row(
            children: [
              // Espaço para a imagem da moeda e o símbolo
              SizedBox(width: coinDiameter), // Garantindo que a imagem ocupe o espaço necessário

              // Anagrama (símbolo da moeda) ao lado da imagem
              Text(
                widget.viewModel.coinSymbol, // Exibe o símbolo da moeda
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              // Valor da moeda
              Expanded(
                child: Text(
                  widget.viewModel.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
GestureDetector(
  onTap: () {
    final favoritesViewModel = Provider.of<FavoritesViewModel>(context, listen: false);
    favoritesViewModel.toggleFavorite(widget.viewModel);
  },
  child: Icon(
    widget.viewModel.icon1,
    color: Provider.of<FavoritesViewModel>(context)
            .favorites
            .any((favorite) => favorite.coinSymbol == widget.viewModel.coinSymbol)
        ? Colors.purple
        : (widget.viewModel.icon1Color ?? Colors.grey),
  ),
),

              const SizedBox(width: 8),
              Icon(
                widget.viewModel.icon2,
                color: widget.viewModel.icon2Color ?? Colors.green,
              ),
            ],
          ),
        ),

        // Imagem da moeda (alinhada à esquerda, com metade fora e metade dentro do retângulo)
        Positioned(
          left: -coinDiameter / 2, // Colocando a imagem com metade fora
          top: (barHeight - coinDiameter) / 2, // Centralizando a imagem verticalmente
          child: ClipOval(
            child: SizedBox(
              width: coinDiameter,
              height: coinDiameter,
              child: widget.viewModel.coinImage,
            ),
          ),
        ),
      ],
    );
  }
}
