import 'package:flutter/material.dart';

class SharedBottomNavigationBar extends StatefulWidget {
  const SharedBottomNavigationBar({super.key});

  @override
  State<SharedBottomNavigationBar> createState() =>
      _SharedBottomNavigationBarState();
}

class _SharedBottomNavigationBarState extends State<SharedBottomNavigationBar> {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Temperatures'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];

  int currentIndex = 0;

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
