import 'package:flutter/material.dart';

class SharedBottomNavigationBar extends StatefulWidget {
  const SharedBottomNavigationBar({super.key});

  @override
  State<SharedBottomNavigationBar> createState() =>
      _SharedBottomNavigationBarState();
}

class _SharedBottomNavigationBarState extends State<SharedBottomNavigationBar> {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Temp'),
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.energy_savings_leaf), label: 'Energy'),
  ];

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: (itemIndex) {
        setState(() {
          currentIndex = itemIndex;
        });
      },
    );
  }
}
