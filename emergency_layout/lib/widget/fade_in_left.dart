import 'package:flutter/material.dart';

class FadeInLeft extends StatefulWidget {
  const FadeInLeft({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<FadeInLeft> createState() => _FadeInLeftState();
}

class _FadeInLeftState extends State<FadeInLeft>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rightMovementAnimation;
  late final Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _rightMovementAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
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
    return Transform.translate(
      offset: Offset(-100 * _rightMovementAnimation.value, 0),
      child: Opacity(
        opacity: _fadeInAnimation.value,
        child: child,
      ),
    );
  }
}
