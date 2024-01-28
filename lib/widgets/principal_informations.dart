// ignore_for_file: non_constant_identifier_names
import 'package:climate_app/services/api_openweather.dart';
import '../animations/backgrounds.dart';
import 'package:climate_app/global/variables.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PrincipalInformations extends StatefulWidget {
  final String city;

  const PrincipalInformations({
    super.key,
    required this.city,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PrincipalInformations createState() => _PrincipalInformations();
}

class _PrincipalInformations extends State<PrincipalInformations> {
  Future<Requests>? requests;

  @override
  Widget build(BuildContext context) {
    requests = fetch(widget.city);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<Requests>(
      future: requests,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          snap = snapshot;
          return Stack(
            children: [
              Background(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight,
                      width: screenWidth,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.35,
                                  // color: Colors.amber,
                                ),
                                Lottie.asset(getWeatherAnimation(icon),
                                    height: 150),
                                Text(
                                  "${snapshot.data!.temp.toStringAsFixed(0)}°",
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
                                  "${snapshot.data!.name}",
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
                                Text(
                                    "${snapshot.data!.state}, ${snapshot.data!.country}",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        shadows: [
                                          Shadow(
                                              offset: const Offset(1, 1),
                                              blurRadius: 2,
                                              color:
                                                  Colors.grey.withOpacity(0.5))
                                        ])),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  firstLetterToUpperCase(
                                      "${snapshot.data!.description}"),
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
                          ),
                          SizedBox(height: screenHeight * 0.15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Umidade",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
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
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${snapshot.data!.feelsLike.toStringAsFixed(1)}°",
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Vel. Vento",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
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
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          const Icon(Icons.arrow_drop_down_sharp)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.35,
                      width: screenWidth,
                      child: Column(
                        children: [Text("Cidade")],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting &&
            cityValue != "") {
          return Stack(
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
          return Stack(
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
          return Stack(
            children: [
              Background(),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Color(0xffffffff),
                    ),
                    SizedBox(height: 16),
                    Text("Aguarde",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300)),
                    SizedBox(height: 32),
                  ],
                ),
              ),
              Positioned(
                bottom: 24,
                child: Container(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Caso não haja uma cidade, por favor, acrescente uma",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          );
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
