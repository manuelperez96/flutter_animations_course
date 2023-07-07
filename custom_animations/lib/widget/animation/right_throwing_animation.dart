import 'package:flutter/material.dart';
import 'dart:math' as math;

class RightThrowingAnimation extends StatefulWidget {
  const RightThrowingAnimation({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<RightThrowingAnimation> createState() => _RightThrowingAnimationState();
}

class _RightThrowingAnimationState extends State<RightThrowingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rightMove;
  late final Animation<double> _scale;
  late final Animation<double> _rotation;
  late final Animation<double> _fadeIn;
  late final Animation<double> _fadeOut;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _rightMove = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _scale = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _rotation = Tween<double>(begin: 0, end: math.pi * 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _fadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, .35),
      ),
    );
    _fadeOut = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.65, 1),
      ),
    );

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
      builder: _buildAnimation,
      child: widget._child,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    final maxScreenDx = (MediaQuery.of(context).size.width / 2);
    final dx = _rightMove.value * maxScreenDx;

    return Transform.translate(
      offset: Offset(dx, 0),
      child: Transform.scale(
        scale: _scale.value,
        child: Transform.rotate(
          angle: _rotation.value,
          child: Opacity(
            opacity: _fadeIn.value - _fadeOut.value,
            child: child,
          ),
        ),
      ),
    );
  }
}
