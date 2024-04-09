import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectAdInfos extends StatelessWidget {
  const ShimmerEffectAdInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> shimmerColors = {
      "baseColor": Colors.grey[300]!,
      "highlightColor": Colors.grey,
      "containerColor": Colors.white.withOpacity(0.5),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildShimmerContainer(shimmerColors, 16, 80),
          const SizedBox(height: 8),
          _buildShimmerContainer(shimmerColors, 32, 56),
        ],
      ),
    );
  }

  Widget _buildShimmerContainer(
      Map<String, Color> shimmerColors, double height, double width) {
    return Shimmer.fromColors(
      baseColor: shimmerColors["baseColor"]!,
      highlightColor: shimmerColors["highlightColor"]!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: shimmerColors["containerColor"]!,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
