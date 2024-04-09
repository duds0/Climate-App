import "package:climate_app/services/forecast_api.dart";
import "package:climate_app/widgets/forecast_informations.dart";
import "package:flutter/material.dart";

class ForecastCard extends StatefulWidget {
  const ForecastCard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ForecastCard createState() => _ForecastCard();
}

class _ForecastCard extends State<ForecastCard> {
  @override
  Widget build(BuildContext context) {
    Future future = fetchForecast();
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ForecastInformations(
                  weekDay: snapshot.data![0]["weekDay"],
                  icon: snapshot.data[0]["icon"],
                  averageTemp: snapshot.data![0]["averageTemp"],
                ),
                ForecastInformations(
                  weekDay: snapshot.data![1]["weekDay"],
                  icon: snapshot.data[1]["icon"],
                  averageTemp: snapshot.data![1]["averageTemp"],
                ),
                ForecastInformations(
                  weekDay: snapshot.data![2]["weekDay"],
                  icon: snapshot.data[2]["icon"],
                  averageTemp: snapshot.data![2]["averageTemp"],
                ),
                ForecastInformations(
                  weekDay: snapshot.data![3]["weekDay"],
                  icon: snapshot.data[3]["icon"],
                  averageTemp: snapshot.data![3]["averageTemp"],
                ),
                ForecastInformations(
                  weekDay: snapshot.data![4]["weekDay"],
                  icon: snapshot.data[4]["icon"],
                  averageTemp: snapshot.data![4]["averageTemp"],
                ),
              ],
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
