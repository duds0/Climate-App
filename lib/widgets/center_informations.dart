import "package:climate_app/widgets/principal_informations.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class CenterInformations extends StatelessWidget {
  final String icon;
  final double temp;
  final String cityName;
  final String? state;
  final String country;
  final String description;

  const CenterInformations({
    Key? key,
    required this.cityName,
    required this.country,
    required this.description,
    required this.icon,
    required this.state,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(getWeatherAnimation(icon), height: 150),
          _buildTemperatureText(temp),
          _buildCityNameText(cityName),
          const SizedBox(height: 2),
          _buildStateAndCountryText(state, country),
          const SizedBox(height: 8),
          _buildDescriptionText(description),
        ],
      ),
    );
  }

  Widget _buildTemperatureText(double temp) {
    return Text(
      "${temp.toStringAsFixed(0)}°",
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildCityNameText(String cityName) {
    return Text(
      cityName,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        shadows: [
          Shadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildStateAndCountryText(String? state, String country) {
    return Text(
      "$state, $country",
      style: TextStyle(
        fontStyle: FontStyle.italic,
        shadows: [
          Shadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionText(String description) {
    return Text(
      firstLetterToUpperCase(description),
      style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 17,
        shadows: [
          Shadow(
            offset: const Offset(1, 1),
            blurRadius: 2,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
