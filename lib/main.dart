import 'package:flutter/material.dart';
import 'weathercard.dart';

// ignore: prefer_typing_uninitialized_variables
var cityValue = "";

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyApp createState() => _MyApp();

  // This widget is the root of your application.
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Stack(
          children: [
            WeatherCard(city: cityValue),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "Digite sua cidade aqui",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        // -------
                        // -------
                        // -------
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      onSubmitted: (value) {
                        setState(
                          () {
                            cityValue = value;
                          },
                        );
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
