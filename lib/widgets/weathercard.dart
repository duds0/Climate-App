import 'package:climate_app/global/variables.dart';
import 'package:climate_app/screens/home.dart';
import 'package:climate_app/services/current_data_api.dart';
import 'package:climate_app/widgets/principal_informations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class WeatherCard extends StatefulWidget {
  final String city;
  final VoidCallback onRemove;

  const WeatherCard({
    Key? key,
    required this.city,
    required this.onRemove,
  }) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  late Future<Requests> requests;

  @override
  void initState() {
    super.initState();
    requests = fetch(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textContainer = (screenWidth - 160) * 0.7;

    return FutureBuilder<Requests>(
      future: requests,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return _buildWeatherCard(snapshot.data!, textContainer);
        } else if (snapshot.connectionState == ConnectionState.waiting &&
            cityValue != "") {
          return _buildShimmer();
        } else if (snapshot.hasError && cityValue != "") {
          WidgetsBinding.instance.addPostFrameCallback(
            (timeStamp) {
              errorMessage(
                  context, "Não foi possível encontrar a sua localização");
            },
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildShimmer();
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildWeatherCard(Requests data, double textContainer) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => const HomePage()));
        setState(() {
          cityValue = data.name;
        });
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 20, right: 24, bottom: 20, left: 24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xff34495E),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: textContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.name} ${data.temp.toStringAsFixed(0)}°",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${data.state}, ${data.country}",
                    style: const TextStyle(
                        fontStyle: FontStyle.italic, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${data.temp_min.toStringAsFixed(1)}° / ${data.temp_max.toStringAsFixed(1)}°",
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
                    getWeatherAnimation(data.icon),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 120,
      child: Shimmer.fromColors(
        baseColor: Colors.white.withOpacity(0.2),
        highlightColor: Colors.grey.withOpacity(0.2),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

void errorMessage(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: const Color.fromARGB(255, 66, 66, 66),
    content: Text(
      message,
      style: const TextStyle(color: Colors.white, fontFamily: "Inter"),
    ),
    duration: const Duration(seconds: 3, milliseconds: 5),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
