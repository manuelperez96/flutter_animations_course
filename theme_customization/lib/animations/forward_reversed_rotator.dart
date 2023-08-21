import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Given a widget rotate it once forward and once reversed
class ForwardReversedRotator extends StatefulWidget {
  const ForwardReversedRotator({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<ForwardReversedRotator> createState() => _ForwardReversedRotatorState();
}

class _ForwardReversedRotatorState extends State<ForwardReversedRotator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(_controller);
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.addStatusListener(_reverseAnimationOnCompleted);
      _controller.forward();
    });
  }

  void _reverseAnimationOnCompleted(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: _buildRotation,
      child: widget._child,
    );
  }

  Widget _buildRotation(BuildContext context, Widget? child) {
    return Transform.rotate(
      angle: _animation.value,
      child: child!,
    );
  }
}
