import 'package:climate_app/main.dart';
import 'package:climate_app/src/services.dart';
import 'package:flutter/material.dart';

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
            padding:
                const EdgeInsets.only(top: 20, right: 24, bottom: 20, left: 24),
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
          return const SizedBox(
            height: 96,
            child: Center(
              child: Text("Não conseguimos encontrar essa localização 🗺️"),
            ),
          );
        } else if (cityValue == "") {
          return const SizedBox(
            height: 96,
            child: Center(
              child: Text("Adicione alguma cidade no campo acima"),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
