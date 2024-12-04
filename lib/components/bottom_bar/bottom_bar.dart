// bottom_bar.dart
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChange;
  final List<BottomNavigationBarItem> items;

  BottomBar({
    required this.currentIndex,
    required this.onTabChange,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabChange,
      items: items,
      type: BottomNavigationBarType.fixed, // para manter a quantidade de itens fixa
    );
  }
}
