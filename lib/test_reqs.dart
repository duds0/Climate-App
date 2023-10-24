//file destinated for test of the api ant the requests
//The correct and final form is not here.

import 'dart:convert';
import 'package:http/http.dart' as http;

Future main() async {
  final response = await fetch();
  print(response.name);
}

String inputValue = "São Paulo";

Future<Requests> fetch() async {
  var urlCoordInfos =
      "https://api.openweathermap.org/geo/1.0/direct?q=$inputValue&appid=95b9027fe9d1f6c19c6b21c7a2d3f521";
  var response = await http.get(Uri.parse(urlCoordInfos));
  var jsonCoordInfos = jsonDecode(response.body);

  // var cityName = jsonCoordInfos[0]["name"];
  var lat = jsonCoordInfos[0]["lat"];
  var lon = jsonCoordInfos[0]["lon"];
  // var county = jsonCoordInfos[0]["country"];
  // var state = jsonCoordInfos[0]["state"];
  //print("$cityName, $lat, $lon, $county, $state");
  //print(json);

  var urlWeatherInfos =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=95b9027fe9d1f6c19c6b21c7a2d3f521&units=metric&lang=pt_br";
  var response0 = await http.get(Uri.parse(urlWeatherInfos));
  var jsonWeatherInfos = jsonDecode(response0.body);

  // var temp = jsonWeatherInfos["main"]["temp"];
  // var minTemp = jsonWeatherInfos["main"]["temp_min"];
  // var maxTemp = jsonWeatherInfos["main"]["temp_max"];
  // var description = jsonWeatherInfos["weather"][0]["description"];
  // var icon = jsonWeatherInfos["weather"][0]["icon"];
  // print("$temp, $minTemp, $maxTemp, $description, $icon");
  // print(jsonWeatherInfos);

  var requests = Requests(
      name: jsonCoordInfos[0]["name"],
      country: jsonCoordInfos[0]["country"],
      state: jsonCoordInfos[0]["state"],
      temp: jsonWeatherInfos["main"]["temp"],
      minTemp: jsonWeatherInfos["main"]["temp_min"],
      maxTemp: jsonWeatherInfos["main"]["temp_max"],
      description: jsonWeatherInfos["weather"][0]["description"],
      icon: jsonWeatherInfos["weather"][0]["icon"]);

  return requests;
}

class Requests {
  final String name;
  final String country;
  final String state;
  final String temp;
  final String minTemp;
  final String maxTemp;
  final String description;
  final String icon;

  Requests(
      {required this.name,
      required this.country,
      required this.state,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.description,
      required this.icon});
}
