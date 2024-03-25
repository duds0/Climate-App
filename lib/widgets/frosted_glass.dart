import 'dart:ui';

import 'package:climate_app/widgets/forecast_card.dart';
import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  const FrostedGlass({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.1),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.black,
                    Colors.white,
                  ])),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: const ForecastCard(),
        ),
      ),
    );
  }
}
