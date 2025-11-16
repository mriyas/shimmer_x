import 'package:flutter/material.dart';
enum ShimmerDirection {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

extension ShimmerDirectionAlignment on ShimmerDirection {
  /// Resolves shimmer begin/end alignment based on TextDirection
  ShimmerAlignment resolve(BuildContext context) {
    final TextDirection dir = Directionality.of(context);

    switch (this) {
      case ShimmerDirection.leftToRight:
        return ShimmerAlignment(
          dir == TextDirection.rtl ? Alignment.centerRight : Alignment.centerLeft,
          dir == TextDirection.rtl ? Alignment.centerLeft : Alignment.centerRight,
        );

      case ShimmerDirection.rightToLeft:
        return ShimmerAlignment(
          dir == TextDirection.rtl ? Alignment.centerLeft : Alignment.centerRight,
          dir == TextDirection.rtl ? Alignment.centerRight : Alignment.centerLeft,
        );

      case ShimmerDirection.topToBottom:
        return const ShimmerAlignment(Alignment.topCenter, Alignment.bottomCenter);

      case ShimmerDirection.bottomToTop:
        return const ShimmerAlignment(Alignment.bottomCenter, Alignment.topCenter);
    }
  }
}

class ShimmerAlignment {
  final Alignment begin;
  final Alignment end;

  const ShimmerAlignment(this.begin, this.end);
}

