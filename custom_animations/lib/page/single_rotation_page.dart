import 'package:custom_animations/widget/animation/single_rotator.dart';
import 'package:custom_animations/widget/squared.dart';
import 'package:flutter/material.dart';

class SingleRotationPage extends StatelessWidget {
  const SingleRotationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleRotator(
          child: Squared(),
        ),
      ),
    );
  }
}
