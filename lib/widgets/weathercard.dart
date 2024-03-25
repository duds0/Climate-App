import 'package:climate_app/global/variables.dart';
import 'package:climate_app/screens/home.dart';
import 'package:climate_app/services/api_openweather.dart';
import 'package:climate_app/widgets/principal_informations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class WeatherCard extends StatefulWidget {
  String city;
  final VoidCallback onRemove;

  WeatherCard({
    super.key,
    required this.city,
    required this.onRemove,
  });

  @override
  // ignore: library_private_types_in_public_api
  _WeatherCard createState() => _WeatherCard();
}

class _WeatherCard extends State<WeatherCard> {
  Future<Requests>? requests;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textContainer = (screenWidth - 160) * 0.7;

    requests = fetch(widget.city);

    return FutureBuilder<Requests>(
      future: requests,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
              setState(() {
                cityValue = snapshot.data!.name;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                  top: 20, right: 24, bottom: 20, left: 24),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff34495E)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: textContainer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data!.name} ${snapshot.data!.temp.toStringAsFixed(0)}°",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${snapshot.data!.state}, ${snapshot.data!.country}",
                          style: const TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${snapshot.data!.temp_min.toStringAsFixed(1)}° / ${snapshot.data!.temp_max.toStringAsFixed(1)}°",
                          style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Lottie.asset(
                          getWeatherAnimation(snapshot.data!.icon),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting &&
            cityValue != "") {
          return const SizedBox(
            height: 120,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Color(0xffffffff),
              ),
            ),
          );
        } else if (snapshot.hasError && cityValue != "") {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              errorMessage(
                  context, "Não foi possível encontrar a sua localização");
            },
          );
          return const SizedBox.shrink();
        }
        return const SizedBox();
      },
    );
  }
}

void errorMessage(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: const Color.fromARGB(255, 66, 66, 66),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 3, milliseconds: 5),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
