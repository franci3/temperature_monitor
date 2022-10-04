import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SmartWidgetBox(),
          ],
        )
      ],
    );
  }
}

class SmartWidgetBox extends StatelessWidget {
  const SmartWidgetBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Text('test'),
    );
  }

}