import 'package:climate_app/src/new_locations.dart';
import 'src/home.dart';
import 'package:flutter/material.dart';
import 'src/main_screen.dart';
import 'src/home.dart';

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
      initialRoute: "/new_locations",
      routes: {
        "/home": (context) => HomePage(),
        "/new_locations": (context) => Locations(),
      },
    );
  }
}
