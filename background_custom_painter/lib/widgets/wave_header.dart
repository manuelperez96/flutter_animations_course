import 'package:flutter/material.dart';

class WaveHeader extends StatelessWidget {
  const WaveHeader({
    super.key,
    required int waves,
  }) : _waves = waves;

  final int _waves;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: WavesPainter(
          waves: _waves,
        ),
      ),
    );
  }
}

class WavesPainter extends CustomPainter {
  WavesPainter({
    required int waves,
  }) : _waves = waves;

  final int _waves;

  @override
  void paint(Canvas canvas, Size size) {
    const gradient = LinearGradient(colors: <Color>[
      Colors.pink,
      Colors.purple,
      Colors.indigo,
    ]);

    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, 0),
      radius: size.width / 2,
    );

    final paint = Paint();
    paint.shader = gradient.createShader(rect);

    final path = Path();
    final heightUnit = size.height / 8;

    path.lineTo(0, heightUnit * 2);
    _makeWaves(path, size);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  /// Given a path, create [_waves] waves.
  void _makeWaves(Path path, Size size) {
    final widthUnit = size.width / _waves;
    final heightUnit = size.height / 8;

    final oddHeight = heightUnit * 2.5;
    final evenHeight = heightUnit * 1.5;

    for (var i = 0; i < _waves; i++) {
      // print('entra');
      // print(i.toDouble() % 2 == 0 ? oddHeight : evenHeight);

      path.quadraticBezierTo(
        widthUnit * (i + .5),
        i % 2 == 0 ? oddHeight : evenHeight,
        // End point of curve
        widthUnit * (i + 1),
        heightUnit * 2,
      );
    }
  }
}
