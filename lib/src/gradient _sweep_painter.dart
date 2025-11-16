import 'package:flutter/material.dart';

class GradientSweepPainter extends CustomPainter {
  /// Position of highlight in gradient (0.0 to 1.0)
  final double position;

  /// Base color of highlight area
  final Color color;

  /// Opacity (0.0 to 1.0)
  final double opacity;

  /// Width of the highlight band (0.0 to 1.0)
  final double bandWidth;

  /// Gradient direction
  final Alignment begin;
  final Alignment end;

  /// Tile behavior
  final TileMode tileMode;

  /// Shape support: rectangle or circle
  final BoxShape shape;

  GradientSweepPainter({
    required this.position,
    required this.color,
    required this.opacity,
    this.bandWidth = 0.2,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    this.tileMode = TileMode.clamp,
    this.shape = BoxShape.rectangle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Safe gradient range
    final p1 = position.clamp(0.0, 1.0);
    final w = bandWidth.clamp(0.0, 1.0);

    final stops = [
      0.0,
      p1,
      (p1 + w).clamp(0.0, 1.0),
      (p1 + w * 2).clamp(0.0, 1.0),
      1.0,
    ];

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: begin,
        end: end,
        tileMode: tileMode,
        stops: stops,
        colors: [
          Colors.transparent,
          color.withOpacity(0.05),
          color.withOpacity(opacity),
          color.withOpacity(0.05),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    if (shape == BoxShape.circle) {
      final radius = (size.shortestSide / 2);
      canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
    } else {
      canvas.drawRect(Offset.zero & size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant GradientSweepPainter old) {
    return old.position != position ||
        old.opacity != opacity ||
        old.color != color ||
        old.bandWidth != bandWidth ||
        old.begin != begin ||
        old.end != end ||
        old.shape != shape ||
        old.tileMode != tileMode;
  }
}