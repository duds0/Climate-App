// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:climate_app/backgrounds.dart';
import 'package:climate_app/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

var icon = "initial";
var snap;

Future<Requests> fetch(city) async {
  var urlCoordInfos =
      "https://api.openweathermap.org/geo/1.0/direct?q=$city&appid=95b9027fe9d1f6c19c6b21c7a2d3f521";
  var response = await http.get(Uri.parse(urlCoordInfos));
  var jsonCoordInfos = jsonDecode(response.body);

  var lat = jsonCoordInfos[0]["lat"];
  var lon = jsonCoordInfos[0]["lon"];

  var urlWeatherInfos =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=95b9027fe9d1f6c19c6b21c7a2d3f521&units=metric&lang=pt_br";
  var response0 = await http.get(Uri.parse(urlWeatherInfos));
  var jsonWeatherInfos = jsonDecode(response0.body);

  icon = jsonWeatherInfos["weather"][0]["icon"];

  var requests = Requests(
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

class WeatherCard extends StatefulWidget {
  final String city;
  const WeatherCard({super.key, required this.city});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherCard createState() => _WeatherCard();
}

class _WeatherCard extends State<WeatherCard> {
  Future<Requests>? requests;

  @override
  Widget build(BuildContext context) {
    requests = fetch(widget.city);

    return FutureBuilder<Requests>(
      future: requests,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          snap = snapshot.data.icon;
          return Stack(
            children: [
              Background(),
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(getWeatherAnimation(icon), height: 150),
                          Text(
                            "${snapshot.data!.temp.toStringAsFixed(0)}°",
                            style: const TextStyle(
                                fontSize: 48, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${snapshot.data!.name}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          Text(
                              "${snapshot.data!.state}, ${snapshot.data!.country}",
                              style:
                                  const TextStyle(fontStyle: FontStyle.italic)),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                              firstLetterToUpperCase(
                                  "${snapshot.data!.description}"),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 17)),
                        ],
                      ),
                      const SizedBox(height: 125),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Umidade",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${snapshot.data!.humidity}",
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: "%",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Sens. Térmica",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${snapshot.data!.feelsLike.toStringAsFixed(1)}°",
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Vel. Vento",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "${snapshot.data!.windSpeed.toStringAsFixed(0)}",
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: "km/h",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Stack(
            children: [
              Background(),
              Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Color(0xffffffff),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError && cityValue != "") {
          icon = "initial";
          return const Stack(
            children: [
              Background(),
              Center(
                child: Text(
                  "Não conseguimos encontrar essa localização 🗺️",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          );
        } else if (cityValue == "") {
          icon = "initial";
          return const Stack(children: [
            Background(),
            Center(
                child: Text(
              "Não há nada aqui.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            ))
          ]);
        }
        return const SizedBox();
      },
    );
  }
}

getWeatherAnimation(String? icon) {
  switch (icon!.toLowerCase()) {
    case "01d":
      return "assets/animations/Sunny.json";

    case "01n":
      return "assets/animations/Moon.json";

    case "02d":
      return "assets/animations/Partly_cloudy_day.json";

    case "02n":
      return "assets/animations/Moon_Cloudy.json";

    case "03d" || "03n" || "04d" || "04n":
      return "assets/animations/Windy.json";

    case "09d" || "10d":
      return "assets/animations/Rainny_day.json";

    case "09n" || "10n":
      return "assets/animations/Rainny_night.json";

    case "11d" || "11n":
      return "assets/animations/Storm.json";

    case "13d" || "13n":
      return "assets/animations/Snow.json";

    case "50d" || "50n":
      return "assets/animations/Mist.json";

    default:
      return Image.network(
          "https://openweathermap.org/img/wn/${snap.data!.icon}@2x.png");
  }
}

String firstLetterToUpperCase(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}
