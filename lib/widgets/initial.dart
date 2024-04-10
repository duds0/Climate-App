import 'package:climate_app/animations/backgrounds.dart';
import 'package:climate_app/widgets/additional_informations_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class Initial extends StatelessWidget {
  Initial({Key? key}) : super(key: key);

  final Map<String, Color> shimmerColors = {
    "baseColor": Colors.grey[300]!,
    "highlightColor": Colors.grey,
    "containerColor": Colors.white.withOpacity(0.5),
  };

  Future<List<String>> _loadCitiesFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cities = prefs.getStringList('cities');
    return cities ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadCitiesFromSharedPreferences(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data?.isNotEmpty ?? false) {
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
        } else if (snapshot.data?.isEmpty ?? false) {
          return const Stack(
            children: [
              Background(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Center(
                  child: Text(
                    "Nenhuma cidade encontrada. Adicione uma agora! 🌍🗺️",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                        fontSize: 18),
                  ),
                ),
              )
            ],
          );
        }
        return const Stack(
          children: [
            Background(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Aguarde",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
