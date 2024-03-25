import "dart:async";
import "dart:convert";
import "package:http/http.dart" as http;
import "package:climate_app/global/variables.dart";

Future fetchForecast() async {
  var url =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=95b9027fe9d1f6c19c6b21c7a2d3f521&units=metric&lang=pt_br";
  var response = await http.get(Uri.parse(url));
  var jsonData = jsonDecode(response.body);

  List<Map<String, dynamic>> forecast = [];

  List<dynamic> forecastList = jsonData["list"];

  for (int i = 0; i < forecastList.length; i += 8) {
    String dateTimeString = forecastList[i]["dt_txt"];
    DateTime date = DateTime.parse(dateTimeString);
    String dayOfWeek = getDayOfWeek(date.weekday);

    double totalTemp = 0;
    int countTemp = 0;

    for (int j = i; j < i + 8; j++) {
      if (j < forecastList.length) {
        totalTemp += forecastList[j]["main"]["temp"];
        countTemp++;
      }
    }

    double averageTemp = countTemp > 0 ? totalTemp / countTemp : 0;

    String icon = forecastList[i + 4]["weather"][0]["icon"];

    Map<String, dynamic> dayForecast = {
      "weekDay": dayOfWeek,
      "averageTemp": averageTemp,
      "icon": icon,
    };

    forecast.add(dayForecast);
  }

  return forecast;
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
