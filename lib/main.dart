import 'package:flutter/material.dart';
import 'package:temperature_monitor/util/config.dart';
import 'package:temperature_monitor/view/home/home_screen.dart';
import 'package:temperature_monitor/view/shared/shared_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TemperatureMonitorConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: TemperatureMonitorConfig.customLightThemeData,
      home: const SharedScaffold(body: HomeScreen()),
    );
  }
}
