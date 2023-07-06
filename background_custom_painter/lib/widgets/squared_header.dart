import 'package:flutter/material.dart';

class SquaredHeader extends StatelessWidget {
  const SquaredHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.purple,
      child: SizedBox(
        height: 300,
        width: double.infinity,
      ),
    );
  }
}
