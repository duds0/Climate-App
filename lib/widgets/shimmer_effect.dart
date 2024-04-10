import 'package:climate_app/animations/backgrounds.dart';
import 'package:climate_app/widgets/additional_informations_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Load extends StatelessWidget {
  const Load({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> shimmerColors = {
      "baseColor": Colors.grey[300]!,
      "highlightColor": Colors.grey,
      "containerColor": Colors.white.withOpacity(0.5),
    };

    return Stack(
      children: [
        const Background(),
        _buildCenterContent(shimmerColors),
        _buildBottomContent(shimmerColors),
      ],
    );
  }

  Widget _buildCenterContent(Map<String, Color> shimmerColors) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildShimmerContainer(shimmerColors, BoxShape.circle, 150, 150),
          const SizedBox(height: 24),
          _buildShimmerContainer(shimmerColors, BoxShape.rectangle, 80, 56),
          const SizedBox(height: 24),
          _buildShimmerContainer(shimmerColors, BoxShape.rectangle, 125, 24),
          const SizedBox(height: 8),
          _buildShimmerContainer(shimmerColors, BoxShape.rectangle, 100, 24),
          const SizedBox(height: 16),
          _buildShimmerContainer(shimmerColors, BoxShape.rectangle, 135, 24),
        ],
      ),
    );
  }

  Widget _buildBottomContent(Map<String, Color> shimmerColors) {
    return Positioned(
      bottom: 16,
      left: 0,
      right: 0,
      child: Column(
        children: [
          SizedBox(
            height: 88,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: const [
                ShimmerEffectAdInfos(),
                ShimmerEffectAdInfos(),
                ShimmerEffectAdInfos(),
                ShimmerEffectAdInfos(),
                ShimmerEffectAdInfos(),
                ShimmerEffectAdInfos(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Shimmer.fromColors(
              baseColor: shimmerColors["baseColor"]!,
              highlightColor: shimmerColors["highlightColor"]!,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 39),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: shimmerColors["containerColor"]!,
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerContainer(Map<String, Color> shimmerColors,
      BoxShape shape, double? width, double? height) {
    return Shimmer.fromColors(
      baseColor: shimmerColors["baseColor"]!,
      highlightColor: shimmerColors["highlightColor"]!,
      child: Container(
        decoration: BoxDecoration(
          shape: shape,
          color: shimmerColors["containerColor"]!,
          borderRadius:
              shape == BoxShape.circle ? null : BorderRadius.circular(4),
        ),
        height: height,
        width: width,
      ),
    );
  }
}
