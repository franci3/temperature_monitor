import 'package:flutter/material.dart';
import 'package:temperature_monitor/view/shared/shared_bottomNavigationBar.dart';

class SharedScaffold extends StatelessWidget {
  const SharedScaffold({required this.body, super.key});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: const SharedBottomNavigationBar(),
    );
  }

}