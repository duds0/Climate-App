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
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: backgroundAnimation(icon),
        )
      ],
    );
  }
}

backgroundAnimation(String? icon) {
  switch (icon!.toLowerCase()) {
    case "01d":
      return WrapperScene(
        children: [SunWidget()],
        colors: [Colors.blue, Colors.white],
      );

    case "01n":
      return WeatherScene.scorchingSun.sceneWidget;

    case "02d":
      return WeatherScene.showerSleet.sceneWidget;

    case "02n":
      return WeatherScene.showerSleet.sceneWidget;

    case "03d" || "03n" || "04d" || "04n":
      return WeatherScene.frosty.sceneWidget;

    case "09d" || "10d":
      return WeatherScene.rainyOvercast.sceneWidget;

    case "09n" || "10n":
      return WeatherScene.rainyOvercast.sceneWidget;

    case "11d" || "11n":
      return WeatherScene.stormy.sceneWidget;

    case "13d" || "13n":
      return WeatherScene.frosty.sceneWidget;

    case "50d" || "50n":
      return WeatherScene.weatherEvery.sceneWidget;

    default:
      return WeatherScene.weatherEvery.sceneWidget;
  }
}
