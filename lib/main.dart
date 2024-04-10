import 'package:climate_app/screens/locations.dart';
import 'screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: "Inter",
            ),
      ),
      theme: ThemeData(fontFamily: "Inter"),
      initialRoute: "/home",
      routes: {
        "/home": (context) => const HomePage(),
        "/new_locations": (context) => const Locations(),
      },
    );
  }
}
