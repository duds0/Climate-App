import "package:climate_app/global/variables.dart";
import "package:climate_app/services/forecast_api.dart";
import "package:climate_app/widgets/principal_informations.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class ForecastCard extends StatefulWidget {
  const ForecastCard({Key? key}) : super(key: key);

  @override
  _ForecastCard createState() => _ForecastCard();
}

class _ForecastCard extends State<ForecastCard> {
  @override
  Widget build(BuildContext context) {
    final future = fetchForecast();

    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          formatedData();
          return SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekDays[0],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(
                        getWeatherAnimation(
                            snapshot.data[0]["forecast"]["weather"][0]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data[0]["forecast"]["main"]['temp'].toStringAsFixed(0)}°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekDays[1],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(
                        getWeatherAnimation(
                            snapshot.data[1]["forecast"]["weather"][0]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data[1]["forecast"]["main"]['temp'].toStringAsFixed(0)}°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekDays[2],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(
                        getWeatherAnimation(
                            snapshot.data[2]["forecast"]["weather"][0]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data[2]["forecast"]["main"]['temp'].toStringAsFixed(0)}°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekDays[3],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(
                        getWeatherAnimation(
                            snapshot.data[3]["forecast"]["weather"][0]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data[3]["forecast"]["main"]['temp'].toStringAsFixed(0)}°",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weekDays[4],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 8),
                    Lottie.asset(
                        getWeatherAnimation(
                            snapshot.data[4]["forecast"]["weather"][0]["icon"]),
                        height: 40),
                    const SizedBox(height: 2),
                    Text(
                      "${snapshot.data[4]["forecast"]["main"]['temp'].toStringAsFixed(0)}°",
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

  // Date Format Process
  List<String> weekDays = [];
  Set<String> processedDates = <String>{};

  void formatedData() {
    for (String dateString in dates) {
      if (!processedDates.contains(dateString)) {
        String weekDay = getWeekDay(dateString);
        weekDays.add(weekDay);
        processedDates.add(dateString);
      }
    }
  }

  String getWeekDay(String dateString) {
    DateTime data = DateTime.parse(dateString);
    int numWeekDay = data.weekday;
    return getWeekDayName(numWeekDay);
  }

  String getWeekDayName(int numWeekDay) {
    switch (numWeekDay) {
      case 1:
        return "Seg.";
      case 2:
        return "Ter.";
      case 3:
        return "Qua.";
      case 4:
        return "Qui.";
      case 5:
        return "Sex.";
      case 6:
        return "Sáb.";
      case 7:
        return "Dom.";
      default:
        return "Dia inválido";
    }
  }
}
