import 'package:flutter/material.dart';
import 'coin_bar_view_model.dart';


class CoinBar extends StatelessWidget {
  final CoinBarViewModel viewModel;

  const CoinBar({Key? key, required this.viewModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Add padding for better spacing
      decoration: BoxDecoration(
        color: viewModel.fillColor ?? Colors.grey[200],
        border: viewModel.borderColor != null && viewModel.borderWidth != null
            ? Border.all(color: viewModel.borderColor!, width: viewModel.borderWidth!)
            : null,
        borderRadius: BorderRadius.circular(20), // Rounded corners for the pill shape
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40, // Set a fixed size for the coin image
            height: 40,
            child: ClipOval(child: viewModel.coinImage), // Clip the coin image to a circle
          ),

          Expanded( // Expand to occupy remaining space for the value
            child: Text(
              viewModel.value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16, // Adjust font size as needed
              ),
            ),
          ),

          Icon(viewModel.icon1, color: Colors.grey),
          const SizedBox(width: 8), // Add spacing between icons
          Icon(viewModel.icon2, color: Colors.green),

        ],
      ),
    );
  }
}


// Example usage:

// ... in another widget's build method ...

