import 'package:flutter/material.dart';

class Squared extends StatelessWidget {
  const Squared({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 70,
      width: 70,
      child: ColoredBox(
        color: Colors.blue,
      ),
    );
  }
}
