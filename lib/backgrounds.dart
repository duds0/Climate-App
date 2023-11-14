import 'package:flutter/material.dart';
import 'package:weather_animation/weather_animation.dart';
import 'weathercard.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Background createState() => _Background();
}

class _Background extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WeatherScene.sunset.sceneWidget);
  }
}
