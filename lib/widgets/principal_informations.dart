// ignore_for_file: non_constant_identifier_names
import 'package:climate_app/services/api_openweather.dart';
import 'package:climate_app/widgets/additional_informations.dart';
import 'package:climate_app/widgets/center_informations.dart';
import 'package:climate_app/widgets/shimmer_effect.dart';
import 'package:climate_app/widgets/frosted_glass.dart';
import 'package:climate_app/widgets/initial.dart';
import '../animations/backgrounds.dart';
import 'package:climate_app/global/variables.dart';
import 'package:flutter/material.dart';

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

    return FutureBuilder<Requests>(
      future: requests,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          snap = snapshot;

          //Timestamp formatting
          String zeroFix(int tStamp) {
            return tStamp.toString().padLeft(2, '0');
          }

          int sunriseTimestamp = snapshot.data!.sunrise;
          int sunsetTimestamp = snapshot.data!.sunset;

          DateTime sunriseDateTime =
              DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp * 1000);
          DateTime sunsetDateTime =
              DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp * 1000);

          String sunriseTime =
              '${zeroFix(sunriseDateTime.hour)}:${zeroFix(sunriseDateTime.minute)}';
          String sunsetTime =
              '${zeroFix(sunsetDateTime.hour)}:${zeroFix(sunsetDateTime.minute)}';

          return Stack(
            children: [
              const Background(),
              CenterInformations(
                cityName: snapshot.data!.name,
                country: snapshot.data!.country,
                description: snapshot.data!.description,
                icon: icon,
                state: snap.data.state,
                temp: snapshot.data!.temp,
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 72,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            AdditionalInformations(
                              description: "Sens. Térmica",
                              content:
                                  "${snapshot.data!.feelsLike.toStringAsFixed(1)}°",
                            ),
                            AdditionalInformations(
                              description: "Umidade",
                              content: "${snapshot.data!.humidity}",
                              unitOfMeasurement: "%",
                            ),
                            AdditionalInformations(
                              description: "Vel. Vento",
                              content:
                                  "${snapshot.data!.windSpeed.toStringAsFixed(0)}",
                              unitOfMeasurement: "km/h",
                            ),
                            AdditionalInformations(
                              description: "Pressão",
                              content: "${snapshot.data!.pressure}",
                              unitOfMeasurement: "hPa",
                            ),
                            AdditionalInformations(
                              description: "Nascer do Sol",
                              content: sunriseTime,
                            ),
                            AdditionalInformations(
                              description: "Pôr do Sol",
                              content: sunsetTime,
                            ),
                          ],
                        ),
                      ),
                      const FrostedGlass(),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting &&
            cityValue != "") {
          return const Load();
        } else if (snapshot.hasError && cityValue != "") {
          icon = "initial";
        } else if (cityValue == "") {
          icon = "initial";
          return Initial(
              bottomText: "Não adcionou uma cidade? Por favor, adcione uma!",
              centerText: "Aguarde");
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
