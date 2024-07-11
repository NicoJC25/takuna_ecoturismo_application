import 'package:flutter/material.dart';

class BigScreen extends StatelessWidget {
  const BigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hola',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
