import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class BtnBigScreen extends StatelessWidget {
  const BtnBigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white70,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(EvaIcons.bookOpen, color: Colors.grey),
          onPressed: () {},
        ),
      ),
    );
  }
}
