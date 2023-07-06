import 'package:flutter/material.dart';

class TriangularHeader extends StatelessWidget {
  const TriangularHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: TriangularHeaderPainter.topHalfInvertedRounded(),
      ),
    );
  }
}

class TriangularHeaderPainter extends CustomPainter {
  TriangularHeaderPainter._({
    required _TrianglePathPainter painter,
  }) : _painter = painter;

  TriangularHeaderPainter.fullLeft()
      : this._(
          painter: _FullLeftTrianglePathPainter(),
        );

  TriangularHeaderPainter.fullRight()
      : this._(
          painter: _FullRightTrianglePathPainter(),
        );

  TriangularHeaderPainter.topHalfDiamond()
      : this._(
          painter: _TopHalfDiamondTrianglePathPainter(),
        );

  TriangularHeaderPainter.topHalfRounded()
      : this._(
          painter: _TopHalfRoundedTrianglePathPainter(),
        );

  TriangularHeaderPainter.topHalfInvertedRounded()
      : this._(
          painter: _TopHalfInvertedRoundedTrianglePathPainter(),
        );

  final _TrianglePathPainter _painter;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.purple;

    final path = _painter.paint(size);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

abstract class _TrianglePathPainter {
  Path paint(Size size);
}

class _FullLeftTrianglePathPainter extends _TrianglePathPainter {
  @override
  Path paint(Size size) {
    final path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }
}

class _FullRightTrianglePathPainter extends _TrianglePathPainter {
  @override
  Path paint(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    return path;
  }
}

class _TopHalfDiamondTrianglePathPainter extends _TrianglePathPainter {
  @override
  Path paint(Size size) {
    final path = Path();
    final heightUnit = size.height / 8;

    path.lineTo(0, heightUnit * 2);
    path.lineTo(size.width / 2, heightUnit * 2.5);
    path.lineTo(size.width, heightUnit * 2);
    path.lineTo(size.width, 0);

    return path;
  }
}

class _TopHalfRoundedTrianglePathPainter extends _TrianglePathPainter {
  @override
  Path paint(Size size) {
    final path = Path();
    final heightUnit = size.height / 8;

    path.lineTo(0, heightUnit * 2);
    // Mid point of curve, where the curve is make
    path.quadraticBezierTo(
      size.width / 2,
      heightUnit * 2.5,
      // End point of curve
      size.width,
      heightUnit * 2,
    );
    path.lineTo(size.width, 0);

    return path;
  }
}

class _TopHalfInvertedRoundedTrianglePathPainter extends _TrianglePathPainter {
  @override
  Path paint(Size size) {
    final path = Path();
    final heightUnit = size.height / 8;

    path.lineTo(0, heightUnit * 2);
    // Mid point of curve, where the curve is make
    path.quadraticBezierTo(
      size.width / 2,
      heightUnit * 1.5,
      // End point of curve
      size.width,
      heightUnit * 2,
    );
    path.lineTo(size.width, 0);

    return path;
  }
}
