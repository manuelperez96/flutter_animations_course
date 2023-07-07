import 'package:custom_animations/widget/animation/forward_reversed_rotator.dart';
import 'package:custom_animations/widget/squared.dart';
import 'package:flutter/material.dart';

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
