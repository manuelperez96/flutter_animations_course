import 'package:flutter/material.dart';
import 'package:theme_customization/animations/forward_reversed_rotator.dart';
import 'package:theme_customization/widgets/squared.dart';

class ForwardReverseRotatorPage extends StatelessWidget {
  const ForwardReverseRotatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ForwardReversedRotator(
          child: Squared(),
        ),
      ),
    );
  }
}
