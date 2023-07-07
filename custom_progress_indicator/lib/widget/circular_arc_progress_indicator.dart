import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularArcProgressIndicator extends StatefulWidget {
  const CircularArcProgressIndicator({
    super.key,
    required double progress,
    bool animatedReverse = true,
    Color? insideStrokeColor,
    Color? outsideStrokeColor,
  })  : _progress = progress,
        _insideStrokeColor = insideStrokeColor,
        _outsideStrokeColor = outsideStrokeColor,
        _animatedReverse = animatedReverse;

  final double _progress;
  final Color? _insideStrokeColor;
  final Color? _outsideStrokeColor;
  final bool _animatedReverse;

  @override
  State<CircularArcProgressIndicator> createState() =>
      _CircularArcProgressIndicatorState();
}

class _CircularArcProgressIndicatorState
    extends State<CircularArcProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animationProgress;
  late double _currentProgress;
  late double _oldProgress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationProgress = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _currentProgress = widget._progress;
    _oldProgress = 0;
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CircularArcProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._progress != widget._progress) {
      _oldProgress = _currentProgress;
      _currentProgress = widget._progress;
      if (widget._progress == 0 && !widget._animatedReverse) {
        _controller.animateTo(1);
        return;
      }
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _CircularArcProgressIndicatorPainter(
        progress: lerpDouble(
          _oldProgress,
          _currentProgress,
          _animationProgress.value,
        )!,
        strokeColor: widget._outsideStrokeColor,
      ),
      painter: _CircularProgressIndicatorPainter(
        strokeColor: widget._insideStrokeColor,
      ),
    );
  }
}

class _CircularProgressIndicatorPainter extends CustomPainter {
  _CircularProgressIndicatorPainter({
    Color? strokeColor,
  }) : _strokeColor = strokeColor;

  final Color? _strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final innerBrush = Paint();
    innerBrush
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..color = _strokeColor ?? Colors.grey;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2);
    // Draw a circle.
    canvas.drawCircle(
      // The center point of the circle whitin given bounded.
      center,
      // The size of the circle. Radius is always the half of the
      // total size.
      radius,
      innerBrush,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _CircularArcProgressIndicatorPainter extends CustomPainter {
  _CircularArcProgressIndicatorPainter({
    required double progress,
    Color? strokeColor,
  })  : assert(
          progress >= 0 && progress <= 1,
          'progress can not be outside range 0 to 1',
        ),
        _progress = progress,
        _strokeColor = strokeColor;

  final double _progress;
  final Color? _strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2);

    final outsideBrush = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = _strokeColor ?? Colors.blueAccent;

    // Draw an arc.
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * _progress,
      false,
      outsideBrush,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
