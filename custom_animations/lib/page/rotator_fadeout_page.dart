import 'package:custom_animations/widget/animation/rotator_fadeout_animator.dart';
import 'package:custom_animations/widget/squared.dart';
import 'package:flutter/material.dart';

class SingleRotatorFadeoutPage extends StatelessWidget {
  const SingleRotatorFadeoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleRotatorFadeoutAnimator(
          child: Squared(),
        ),
      ),
    );
  }
}
