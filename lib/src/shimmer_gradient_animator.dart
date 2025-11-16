import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer_x/src/gradient%20_sweep_painter.dart';
import 'package:shimmer_x/shimmer_direction.dart';

import '/shimmer_x.dart';


class ShimmerGradientAnimator extends StatefulWidget {
  final Color color;
  final double opacity;
  final double bandWidth;
  final Duration duration;
  final Duration interval;
  final ShimmerDirection direction;
  final BoxShape shape;
  final TileMode tileMode;
  final bool autoReverse;

  final Widget child;

  const ShimmerGradientAnimator({
    super.key,
    required this.child,
    required this.color,
    this.opacity = 0.4,
    this.bandWidth = 0.2,
    this.duration = const Duration(seconds: 2),
    this.interval = const Duration(milliseconds: 350),
    this.direction = ShimmerDirection.leftToRight,
    this.shape = BoxShape.rectangle,
    this.tileMode = TileMode.clamp,
    this.autoReverse = false,
  });

  @override
  State<ShimmerGradientAnimator> createState() =>
      _ShimmerGradientAnimatorState();
}

class _ShimmerGradientAnimatorState extends State<ShimmerGradientAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _intervalTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.7, curve: Curves.easeOut),
      ),
    )..addListener(() {
      if (mounted) setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.autoReverse) {
          _controller.reverse();
        } else {
          _intervalTimer = Timer(widget.interval, () {
            if (mounted) _controller.forward(from: 0);
          });
        }
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _intervalTimer?.cancel();
    _intervalTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final (begin, end) = widget.direction.resolve(context);
    return CustomPaint(
      foregroundPainter: GradientSweepPainter(
        position: _animation.value,
        color: widget.color,
        opacity: widget.opacity,
        bandWidth: widget.bandWidth,
        begin: begin,
        end: end,
        shape: widget.shape,
        tileMode: widget.tileMode,
      ),
      child: widget.child,
    );
  }
}
