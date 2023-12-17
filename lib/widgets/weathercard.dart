import 'package:climate_app/main.dart';
import 'package:climate_app/screens/home.dart';
import 'package:climate_app/services/api_openweather.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeatherCard extends StatefulWidget {
  WeatherCard({super.key, required this.city});
  String city;

  @override
  // ignore: library_private_types_in_public_api
  _WeatherCard createState() => _WeatherCard();
}

class _WeatherCard extends State<WeatherCard> {
  Future<Requests>? requests;
  var notVisible = false;

  @override
  Widget build(BuildContext context) {
    requests = fetch(widget.city);

    return FutureBuilder<Requests>(
      future: requests,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return InkWell(
            onTap: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage())),
              setState(() {
                cityValue = snapshot.data!.name;
              })
            },
            child: Container(
              // margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.only(
                  top: 20, right: 24, bottom: 20, left: 24),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xff34495E)),
              height: 96,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data!.name}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "${snapshot.data!.state}, ${snapshot.data!.country}",
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "${snapshot.data!.temp.toStringAsFixed(1)}°",
                    style: const TextStyle(fontSize: 32),
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting &&
            cityValue != "") {
          return const SizedBox(
            height: 96,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Color(0xffffffff),
              ),
            ),
          );
        } else if (snapshot.hasError && cityValue != "") {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            errorMessage(
                context, "Não foi possível encontrar a sua localização");
          });
          return Visibility(visible: notVisible, child: const SizedBox());
        }
        return Visibility(visible: notVisible, child: const SizedBox());
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
