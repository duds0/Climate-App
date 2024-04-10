import "dart:async";
import "dart:convert";
import "package:http/http.dart" as http;
import "package:climate_app/global/variables.dart";

Future<List<Map<String, dynamic>>> fetchForecast() async {
  final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=95b9027fe9d1f6c19c6b21c7a2d3f521&units=metric&lang=pt_br");
  final response = await http.get(url);
  final jsonData = jsonDecode(response.body);

  final forecastList = jsonData["list"];
  final forecast = <Map<String, dynamic>>[];

  for (var i = 0; i < forecastList.length; i += 8) {
    final dayForecast = _processDayForecast(forecastList, i);
    forecast.add(dayForecast);
  }

  return forecast;
}

Map<String, dynamic> _processDayForecast(
    List<dynamic> forecastList, int startIndex) {
  final dateTimeString = forecastList[startIndex]["dt_txt"];
  final date = DateTime.parse(dateTimeString);
  final dayOfWeek = getDayOfWeek(date.weekday);

  final totalTemp = forecastList
      .sublist(startIndex, startIndex + 8)
      .map((item) => item["main"]["temp"])
      .reduce((value, element) => value + element);
  final averageTemp = totalTemp / 8;

  final icon = forecastList[startIndex + 4]["weather"][0]["icon"];

  return {
    "weekDay": dayOfWeek,
    "averageTemp": averageTemp,
    "icon": icon,
  };
}

String getDayOfWeek(int day) {
  switch (day) {
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
      return "";
  }
}
