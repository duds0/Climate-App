import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:climate_app/global/variables.dart";

Future fetchForecast() async {
  var url =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=95b9027fe9d1f6c19c6b21c7a2d3f521&units=metric&lang=pt_br";
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  List<Map<String, dynamic>> dailyForecasts = [];
  String date = DateTime.now().toString();

  for (var item in json["list"]) {
    String dateStr = item["dt_txt"].split(' ')[0];
    int hour = int.parse(item["dt_txt"].split(' ')[1].split(':')[0]);

    if (hour >= 12 && date != dateStr) {
      if (!dailyForecasts.any((forecast) => forecast['date'] == dateStr)) {
        dailyForecasts.add({
          'date': dateStr,
          'forecast': item,
        });
        dates.add(item["dt_txt"]);
      }
    }
  }

  return dailyForecasts;
}
