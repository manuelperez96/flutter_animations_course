import 'package:flutter/material.dart';

import 'dart:math' as math;

/// Given a Widget rotate it once.
class SingleRotator extends StatefulWidget {
  const SingleRotator({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<SingleRotator> createState() => _SingleRotatorState();
}

class _SingleRotatorState extends State<SingleRotator>
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
      _controller.forward();
    });
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
