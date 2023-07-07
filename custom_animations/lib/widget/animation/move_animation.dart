import 'package:flutter/material.dart';

class MoveAnimation extends StatefulWidget {
  const MoveAnimation({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<MoveAnimation> createState() => _MoveAnimationState();
}

class _MoveAnimationState extends State<MoveAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rightAnimation;
  late final Animation<double> _centerFromRightAnimation;
  late final Animation<double> _leftAnimation;
  late final Animation<double> _centerFromleftAnimation;
  late final Animation<double> _topAnimation;
  late final Animation<double> _centerFromTopAnimation;
  late final Animation<double> _bottomAnimation;
  late final Animation<double> _centerFromBottomAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    _rightAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, .125),
      ),
    );

    _centerFromRightAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.125, .25),
      ),
    );

    _leftAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.25, .375),
      ),
    );

    _centerFromleftAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.375, .5),
      ),
    );

    _topAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.5, .625),
      ),
    );

    _centerFromTopAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.625, .75),
      ),
    );

    _bottomAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.75, .875),
      ),
    );

    _centerFromBottomAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(.875, 1),
      ),
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

  Widget _buildAnimation(
    BuildContext context,
    Widget? child,
  ) {
    final screenSize = MediaQuery.of(context).size;
    // We know the height of child widget, but we should calculate it.
    final widthSize = screenSize.width - 70;
    final heightSize = screenSize.height - 70;

    // go right and comeback
    double dx = _rightAnimation.value * (widthSize / 2);
    dx -= _centerFromRightAnimation.value * (widthSize / 2);
    // go left and comeback
    dx -= _leftAnimation.value * (widthSize / 2);
    dx += _centerFromleftAnimation.value * (widthSize / 2);
    // go up and comeback
    double dy = -_topAnimation.value * (heightSize / 2);
    dy += _centerFromTopAnimation.value * (heightSize / 2);
    //go bottom and comeback
    dy += _bottomAnimation.value * (heightSize / 2);
    dy -= _centerFromBottomAnimation.value * (heightSize / 2);

    return Transform.translate(
      offset: Offset(
        dx,
        dy,
      ),
      child: child,
    );
  }
}
