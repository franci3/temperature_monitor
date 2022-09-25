import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/util/config.dart';
import 'package:smart_home_dashboard/view/home/home_screen.dart';
import 'package:smart_home_dashboard/view/shared/shared_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: SmartHomeDashboardConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: SmartHomeDashboardConfig.customThemeData,
      home: const SharedScaffold(body: HomeScreen()),
    );
  }
}
