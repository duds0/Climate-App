import 'package:climate_app/widgets/principal_informations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class ForecastInformations extends StatelessWidget {
  ForecastInformations({
    super.key,
    required this.weekDay,
    required this.icon,
    required this.averageTemp,
  });

  String weekDay;
  String icon;
  double averageTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weekDay,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 8),
        Lottie.asset(getWeatherAnimation(icon), height: 40),
        const SizedBox(height: 2),
        Text(
          "${averageTemp.toStringAsFixed(1)}°",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
