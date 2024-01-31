// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:climate_app/global/variables.dart';
import 'package:http/http.dart' as http;

Future<Requests> fetch(city) async {
  var urlCoordInfos =
      "https://api.openweathermap.org/geo/1.0/direct?q=$city&appid=95b9027fe9d1f6c19c6b21c7a2d3f521";
  var response = await http.get(Uri.parse(urlCoordInfos));
  var jsonCoordInfos = jsonDecode(response.body);

  lat = jsonCoordInfos[0]["lat"];
  lon = jsonCoordInfos[0]["lon"];

  var urlWeatherInfos =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=95b9027fe9d1f6c19c6b21c7a2d3f521&units=metric&lang=pt_br";

  await Future.delayed(const Duration(seconds: 2));

  var response0 = await http.get(Uri.parse(urlWeatherInfos));
  var jsonWeatherInfos = jsonDecode(response0.body);

  icon = jsonWeatherInfos["weather"][0]["icon"];

  requests = Requests(
    name: jsonCoordInfos[0]["name"],
    country: jsonCoordInfos[0]["country"],
    state: jsonCoordInfos[0]["state"],
    temp: jsonWeatherInfos["main"]["temp"],
    temp_min: jsonWeatherInfos["main"]["temp_min"],
    temp_max: jsonWeatherInfos["main"]["temp_max"],
    description: jsonWeatherInfos["weather"][0]["description"],
    icon: icon,
    humidity: jsonWeatherInfos["main"]["humidity"],
    windSpeed: jsonWeatherInfos["wind"]["speed"],
    feelsLike: jsonWeatherInfos["main"]["feels_like"],
  );

  return requests;
}

class Requests {
  final name;
  final country;
  final state;
  final temp;
  final temp_min;
  final temp_max;
  final description;
  final icon;
  final humidity;
  final windSpeed;
  final feelsLike;

  Requests({
    required this.name,
    required this.country,
    required this.state,
    required this.temp,
    required this.temp_min,
    required this.temp_max,
    required this.description,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.feelsLike,
  });
}
