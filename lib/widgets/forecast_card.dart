import "package:climate_app/services/forecast_api.dart";
import "package:climate_app/widgets/principal_informations.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data![0]["weekDay"],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(getWeatherAnimation(snapshot.data![0]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data![0]["averageTemp"].toStringAsFixed(1)}°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data![1]["weekDay"],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(getWeatherAnimation(snapshot.data![1]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data![1]["averageTemp"].toStringAsFixed(1)}°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data![2]["weekDay"],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(getWeatherAnimation(snapshot.data![2]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data![2]["averageTemp"].toStringAsFixed(1)}°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data![3]["weekDay"],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(getWeatherAnimation(snapshot.data![3]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data![3]["averageTemp"].toStringAsFixed(1)}°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data![4]["weekDay"],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(getWeatherAnimation(snapshot.data![4]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data![4]["averageTemp"].toStringAsFixed(1)}°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          );
        }
        return const SizedBox(
          child: Center(
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
