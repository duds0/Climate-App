import 'package:climate_app/animations/backgrounds.dart';
import 'package:climate_app/widgets/additional_informations_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Load extends StatelessWidget {
  const Load({super.key});

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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: shimmerColors["baseColor"]!,
                highlightColor: shimmerColors["highlightColor"]!,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: shimmerColors["containerColor"]!,
                  ),
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 24),
              Shimmer.fromColors(
                baseColor: shimmerColors["baseColor"]!,
                highlightColor: shimmerColors["highlightColor"]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: shimmerColors["containerColor"]!,
                  ),
                  height: 56,
                  width: 80,
                ),
              ),
              const SizedBox(height: 24),
              Shimmer.fromColors(
                baseColor: shimmerColors["baseColor"]!,
                highlightColor: shimmerColors["highlightColor"]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: shimmerColors["containerColor"]!,
                  ),
                  height: 24,
                  width: 125,
                ),
              ),
              const SizedBox(height: 8),
              Shimmer.fromColors(
                baseColor: shimmerColors["baseColor"]!,
                highlightColor: shimmerColors["highlightColor"]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: shimmerColors["containerColor"]!,
                  ),
                  height: 24,
                  width: 100,
                ),
              ),
              const SizedBox(height: 16),
              Shimmer.fromColors(
                baseColor: shimmerColors["baseColor"]!,
                highlightColor: shimmerColors["highlightColor"]!,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: shimmerColors["containerColor"]!,
                  ),
                  height: 24,
                  width: 135,
                ),
              ),
            ],
          ),
        ),
        Positioned(
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
        ),
      ],
    );
  }
}
