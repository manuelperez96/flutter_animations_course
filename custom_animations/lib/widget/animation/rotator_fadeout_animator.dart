import 'package:flutter/material.dart';
import 'dart:math' as math;

class SingleRotatorFadeoutAnimator extends StatefulWidget {
  const SingleRotatorFadeoutAnimator({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<SingleRotatorFadeoutAnimator> createState() =>
      _SingleRotatorFadeoutAnimatorState();
}

class _SingleRotatorFadeoutAnimatorState
    extends State<SingleRotatorFadeoutAnimator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _angle;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 3000,
      ),
    );

    _opacity = Tween(begin: 0.0, end: 1.0).animate(
      // Curves modify the progress of an animation.
      CurvedAnimation(
        parent: _controller,
        // Here you can specify a just curve or a Interval.
        // Intervals specify when start and end an animation
        // whitin controller duration.
        curve: const Interval(0, .4),
      ),
    );
    _angle = Tween(begin: 0.0, end: 2 * math.pi).animate(_controller);

    _startAnimation();
  }

  void _startAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: _buildAnimation,
      child: widget._child,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Transform.rotate(
      angle: _angle.value,
      child: Opacity(
        opacity: _opacity.value,
        child: child!,
      ),
    );
  }
}
