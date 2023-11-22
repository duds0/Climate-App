import 'package:flutter/material.dart';
import 'main_screen.dart';
import '/main.dart';
import 'new_locations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _Home createState() => _Home();
}

class _Home extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.pushReplacementNamed(context, "/new_locations",
                        arguments: ScreenArguments(
                          requests?.name,
                          requests?.temp,
                        ))
                  },
              icon: const Icon(
                Icons.add_location_alt_outlined,
                size: 25,
                color: Colors.white,
              ))
        ],
      ),
      body: Stack(
        children: [
          WeatherCard(city: cityValue),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: TextField(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                    labelText: "Digite sua cidade aqui",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
