import 'package:flutter/material.dart';
import 'package:takuna_ecoturismo_application/presentation/markers/markers.dart';

class TestWidgetsScreen extends StatelessWidget {
  const TestWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 125,
          height: 100,
          child: CustomPaint(
            painter: EndMarkerPainter(kilometers: '4'),
          ),
        ),
      ),
    );
  }
}
