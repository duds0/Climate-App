// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:climate_app/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  var requests = Requests(
    name: jsonCoordInfos[0]["name"],
    country: jsonCoordInfos[0]["country"],
    state: jsonCoordInfos[0]["state"],
    temp: jsonWeatherInfos["main"]["temp"],
    temp_min: jsonWeatherInfos["main"]["temp_min"],
    temp_max: jsonWeatherInfos["main"]["temp_max"],
    description: jsonWeatherInfos["weather"][0]["description"],
    icon: jsonWeatherInfos["weather"][0]["icon"],
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

  Requests(
      {required this.name,
      required this.country,
      required this.state,
      required this.temp,
      required this.temp_min,
      required this.temp_max,
      required this.description,
      required this.icon});
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
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xff3498DB),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(top: 20, bottom: 16),
            padding:
                const EdgeInsets.only(top: 16, right: 24, bottom: 16, left: 24),
            height: 150,
            width: 360,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${snapshot.data!.name} ${snapshot.data!.temp.toStringAsFixed(0)}°",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${snapshot.data!.state}, ${snapshot.data!.country}",
                        style: const TextStyle(
                            fontSize: 14, fontStyle: FontStyle.italic),
                      ),
                      Text(
                          "Mín: ${snapshot.data!.temp_min.toStringAsFixed(1)}°"),
                      Text(
                          "Máx: ${snapshot.data!.temp_max.toStringAsFixed(1)}°"),
                      Text(
                        firstLetterToUpperCase(snapshot.data.description),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.network(
                        "https://openweathermap.org/img/wn/${snapshot.data!.icon}@2x.png"),
                  ],
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            margin: const EdgeInsets.only(top: 20, bottom: 16),
            height: 150,
            width: 360,
            decoration: BoxDecoration(
              color: const Color(0xff2C3E50),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 4,
                color: Color(0xff797979),
              ),
            ),
          );
        } else if (snapshot.hasError && cityValue != "") {
          return Container(
            margin: const EdgeInsets.only(top: 20, bottom: 16),
            height: 150,
            width: 360,
            child: const Center(
              child: Text(
                "Não conseguimos encontrar esta localização 🗺️",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

String firstLetterToUpperCase(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}
