import "package:climate_app/services/forecast_api.dart";
import "package:climate_app/widgets/forecast_informations.dart";
import "package:flutter/material.dart";

class ForecastCard extends StatefulWidget {
  const ForecastCard({Key? key}) : super(key: key);

  @override
  _ForecastCardState createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  late Future<List<Map<String, dynamic>>> future;

  @override
  void initState() {
    super.initState();
    future = fetchForecast();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: future,
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: snapshot.data!
                  .map((data) => ForecastInformations(
                        weekDay: data["weekDay"],
                        icon: data["icon"],
                        averageTemp: data["averageTemp"],
                      ))
                  .toList(),
            ),
          );
        }
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
