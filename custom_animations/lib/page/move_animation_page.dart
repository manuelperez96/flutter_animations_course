import 'package:custom_animations/widget/animation/move_animation.dart';
import 'package:custom_animations/widget/squared.dart';
import 'package:flutter/material.dart';

class MoveAnimationPage extends StatelessWidget {
  const MoveAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MoveAnimation(
          child: Squared(),
        ),
      ),
    );
  }
}
