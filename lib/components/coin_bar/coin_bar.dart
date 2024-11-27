import 'package:flutter/material.dart';
import 'coin_bar_view_model.dart';

class CoinBar extends StatelessWidget {
  final CoinBarViewModel viewModel;

  const CoinBar({Key? key, required this.viewModel}) : super(key: key);

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
            color: viewModel.fillColor ?? Colors.grey[200],
            border:
                viewModel.borderColor != null && viewModel.borderWidth != null
                    ? Border.all(
                        color: viewModel.borderColor!,
                        width: viewModel.borderWidth!)
                    : null,
          ),
          child: Row(
            children: [
              SizedBox(width: coinDiameter / 2),
              Expanded(
                child: Text(
                  viewModel.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(viewModel.icon1, color: viewModel.icon1Color ?? Colors.grey),
              const SizedBox(width: 8),
              Icon(viewModel.icon2,
                  color: viewModel.icon2Color ?? Colors.green),
            ],
          ),
        ),

        // Imagem da moeda
        Positioned(
          left: -coinDiameter / 2,
          top: (barHeight - coinDiameter) / 2,
          child: ClipOval(
            child: SizedBox(
              width: coinDiameter,
              height: coinDiameter,
              child: viewModel.coinImage,
            ),
          ),
        ),
      ],
    );
  }
}
