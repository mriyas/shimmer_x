import 'package:flutter/material.dart';
import 'package:shimmer_x/shimmer_direction.dart';
import 'package:shimmer_x/shimmer_x.dart';

void main() {
  runApp(const FullPageShimmerExample());
}

class FullPageShimmerExample extends StatelessWidget {
  const FullPageShimmerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShimmerPage(),
    );
  }
}

class ShimmerPage extends StatelessWidget {
  const ShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShimmerX(
        duration: const Duration(seconds: 3),
        interval: const Duration(seconds: 5),
        color: Colors.white,
        colorOpacity: 0.3,
        enabled: true,
        direction:  ShimmerDirection.leftToRight,
        child: Container(
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
