import "package:climate_app/widgets/principal_informations.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

// ignore: must_be_immutable
class CenterInformations extends StatelessWidget {
  CenterInformations({
    super.key,
    required this.cityName,
    required this.country,
    required this.description,
    required this.icon,
    required this.state,
    required this.temp,
  });

  String icon;
  double temp;
  String cityName;
  String? state;
  String country;
  String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(getWeatherAnimation(icon), height: 150),
          Text(
            "${temp.toStringAsFixed(0)}°",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(0.5))
              ],
            ),
          ),
          Text(
            cityName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(0.5))
              ],
            ),
          ),
          const SizedBox(height: 2),
          Text("$state, $country",
              style: TextStyle(fontStyle: FontStyle.italic, shadows: [
                Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(0.5))
              ])),
          const SizedBox(
            height: 8,
          ),
          Text(
            firstLetterToUpperCase(description),
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 17,
              shadows: [
                Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.grey.withOpacity(0.5))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
