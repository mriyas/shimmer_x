import 'package:flutter/material.dart';
enum ShimmerDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

extension ShimmerDirectionAlignment on ShimmerDirection {
  /// Resolves shimmer begin/end alignment based on TextDirection
  (Alignment begin, Alignment end) resolve(BuildContext context) {
    final TextDirection dir = Directionality.of(context);

    switch (this) {
      case ShimmerDirection.leftToRight:
        return dir == TextDirection.rtl
            ? (Alignment.centerRight, Alignment.centerLeft)
            : (Alignment.centerLeft, Alignment.centerRight);

      case ShimmerDirection.rightToLeft:
        return dir == TextDirection.rtl
            ? (Alignment.centerLeft, Alignment.centerRight)
            : (Alignment.centerRight, Alignment.centerLeft);

      case ShimmerDirection.topToBottom:
        return (Alignment.topCenter, Alignment.bottomCenter);

      case ShimmerDirection.bottomToTop:
        return (Alignment.bottomCenter, Alignment.topCenter);
    }
  }
}
