import 'package:flutter/material.dart';

class RoundedBottomBorderHeader extends StatelessWidget {
  const RoundedBottomBorderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 300,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
    );
  }
}
