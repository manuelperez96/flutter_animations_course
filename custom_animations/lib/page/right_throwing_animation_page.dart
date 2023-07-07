import 'package:custom_animations/widget/animation/right_throwing_animation.dart';
import 'package:custom_animations/widget/squared.dart';
import 'package:flutter/material.dart';

class RightThrowingAnimationPage extends StatelessWidget {
  const RightThrowingAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RightThrowingAnimation(
          child: Squared(),
        ),
      ),
    );
  }
}
