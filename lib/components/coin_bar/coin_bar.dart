// coin_bar.dart
import 'package:flutter/material.dart';
import 'coin_bar_view_model.dart';

class CoinBar extends StatelessWidget {
  final CoinBarViewModel viewModel;

  const CoinBar({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: viewModel.hasBorder
            ? Border.all(color: Colors.grey, width: 1.0)
            : null,
        borderRadius: BorderRadius.circular(8.0), // Optional: Add rounded corners
      ),
      padding: const EdgeInsets.all(16.0), // Adjust padding as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Coin Image
          Image.network(
            viewModel.coinImage,
            height: 24, // Adjust size as needed
            width: 24,
          ),
          // Coin Value (Bold)
          Expanded( // Use Expanded to center the text
            child: Center(
              child: Text(
                viewModel.coinValue,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),



          // Icons
          Row(
            children: [
              Icon(viewModel.icon1),
              const SizedBox(width: 8.0), // Add some spacing between icons
              Icon(viewModel.icon2),
            ],
          ),
        ],
      ),
    );
  }
}