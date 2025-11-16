library;

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_direction.dart';
import 'package:shimmer_animation/src/shimmer_gradient_animator.dart';

/// Creates simple yet beautiful shimmer animations
///
/// Shimmer is very widely used as the default animation for skeleton loaders or placeholder widgets throughout the development community.
/// Therefore, having an easy to use, yet customizable widget ready to use for Android, iOS and Web, gives developers an advantage to focus on their actual functionality, let shimmer make the loading experience smoother.
///
/// By default, the widget will select the preset config but it can be easily customized as shown below:
///
/// - @required [child] : accepts a child [Widget] over which the animation is to be displayed
/// - [color] : accepts a [Color] and sets the color of the animation overlay. Default value is [Colors.white]
/// - [colorOpacity] : accepts a [double] and sets the Opacity of the color of the animation overlay. Default value is [0.3]
/// - [enabled] : accepts a [bool] which toggles the animation on/off. Default value is [true]
/// - [duration] : accepts a [Duration] that would be the time period of animation. Default value is [Duration(seconds: 3)]
/// - [interval] : accepts a [Duration] that would be the interval between the repeating animation. Default value is [Duration(seconds: 0)]
/// - [direction] : accepts a [ShimmerDirection] and aligns the animation accordingly. Default value is [ShimmerDirection.fromLBRT()]
class Shimmer extends StatelessWidget {
  /// Accepts a child [Widget] over which the animation is to be displayed
  final Widget child;

  /// Accepts a [bool] which toggles the animation on/off. Default value is [true]
  final bool enabled;

  /// Accepts a parameter of type [Color] and sets the color of the animation overlay. Default value is [Colors.white]
  final Color color;

  /// Accepts a parameter of type [double] and sets the Opacity of the color of the animation overlay. Default value is [0.3]
  final double colorOpacity;

  /// Accepts a [Duration] that would be the time period of animation. Default value is [Duration(seconds: 3)]
  final Duration duration;

  /// Accepts a [Duration] that would be the interval between the repeating animation. Default value is [Duration(seconds: 0)] i.e. no interval
  final Duration interval;

  /// Accepts a [ShimmerDirection] and aligns the animation accordingly. Default value is [ShimmerDirection.fromLBRT()]
  final ShimmerDirection direction;

  Shimmer({
    required this.child,
    this.enabled = true,
    this.color = Colors.white,
    this.colorOpacity = 0.3,
    this.duration = const Duration(seconds: 3),
    this.interval = const Duration(seconds: 0),
    this.direction =  ShimmerDirection.leftToRight,
  });

  @override
  Widget build(BuildContext context) {
    if (enabled) {
      return ShimmerGradientAnimator(
        child: child,
        color: color,
        opacity: colorOpacity,
        duration: duration,
        interval: interval,
        direction: direction,
      );
    } else {
      return child;
    }
  }
}