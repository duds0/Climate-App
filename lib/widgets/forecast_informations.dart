import 'package:climate_app/widgets/principal_informations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ForecastInformations extends StatelessWidget {
  final String weekDay;
  final String icon;
  final double averageTemp;

  const ForecastInformations({
    Key? key,
    required this.weekDay,
    required this.icon,
    required this.averageTemp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildWeekDayText(weekDay),
        const SizedBox(height: 8),
        Lottie.asset(getWeatherAnimation(icon), height: 40),
        const SizedBox(height: 2),
        _buildAverageTempText(averageTemp),
      ],
    );
  }

  Widget _buildWeekDayText(String weekDay) {
    return Text(
      weekDay,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget _buildAverageTempText(double averageTemp) {
    return Text(
      "${averageTemp.toStringAsFixed(1)}°",
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
