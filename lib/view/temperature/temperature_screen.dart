import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:temperature_monitor/controller/sensor_controller.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SensorController(),
      child: const Center(child: SmartWidgetBox()),
    );
  }
}

class SmartWidgetBox extends StatelessWidget {
  const SmartWidgetBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularArc(),
            Text(context
                    .watch<SensorController>()
                    .averageTempSensor
                    .temperature
                    .toStringAsFixed(2) ??
                ''),
          ],
        ),
      ),
    );
  }
}

class CircularArc extends StatefulWidget {
  const CircularArc({super.key});

  @override
  State<CircularArc> createState() => _CircularArcState();
}

class _CircularArcState extends State<CircularArc>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);

    animation = Tween<double>(begin: 0, end: 3.14).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 300),
      painter: ProgressArc(
          arc: animation.value,
          progressColor: Colors.red,
          isBackground: true),
    );
  }
}

class ProgressArc extends CustomPainter {
  ProgressArc(
      {required this.arc,
      required this.progressColor,
      required this.isBackground});

  bool isBackground;
  double arc;
  Color progressColor;

  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(0, 0, 300, 300);
    const startAngle = -math.pi;
    final sweepAngle = arc ?? math.pi;
    final useCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    if (isBackground) {
      canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}
