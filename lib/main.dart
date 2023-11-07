import 'dart:io';
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
        backgroundColor: const Color(0xff2C3E50),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => {exit(0)}, icon: const Icon(Icons.logout))
          ],
          backgroundColor: const Color(0xff34495E),
          title: const Text("Climate App"),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 24, bottom: 0),
            child: Column(
              children: [
                const Text(
                  "Pesquise por sua cidade aqui ;)",
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 24, right: 32, bottom: 20, left: 32),
                  child: TextField(
                    decoration:
                        const InputDecoration(labelText: "Digite algo..."),
                    onSubmitted: (value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                ),
                WeatherCard(city: cityValue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
