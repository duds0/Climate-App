import 'package:climate_app/screens/home.dart';
import 'package:climate_app/services/api_openweather.dart';
import 'package:climate_app/widgets/weathercard.dart';
import 'package:flutter/material.dart';
import 'package:climate_app/global/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Locations createState() => _Locations();
}

class _Locations extends State<Locations> with AutomaticKeepAliveClientMixin {
  bool showRemoveIcon = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadCitiesFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    TextEditingController textController = TextEditingController();

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: const Color(0xff1F1F1F),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: const Color(0xff1F1F1F),
          leading: IconButton(
            onPressed: () => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()))
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  showRemoveIcon = !showRemoveIcon;
                });
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: Container(
          padding:
              const EdgeInsets.only(top: 8, right: 20, bottom: 8, left: 20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Suas cidades",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 56,
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Color(0xff323232),
                    // prefixIcon: Icon(Icons.search),
                    labelStyle:
                        TextStyle(color: Color(0xff797979), fontSize: 17),
                    labelText: "Digite seu local",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  controller: textController,
                  onSubmitted: (city) async {
                    if (city.isNotEmpty) {
                      setState(
                        () {
                          cityValue = city;
                          fetch(cityValue);
                          textController.clear();
                          items.add(WeatherCard(
                              city: cityValue,
                              onRemove: () => _removeCity(cityValue)));
                          cities.add(city);
                          _saveCitiesToSharedPreferences();
                        },
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 6,
                  ),
                  itemCount: items.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: items[index],
                      trailing: showRemoveIcon
                          ? Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _removeCity(items[index].city),
                              ),
                            )
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//SharedPreferences Functions CRUD ->
  Future<void> _saveCitiesToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('cidades', cities);
  }

  Future<void> _removeCity(String city) async {
    setState(() {
      items.removeWhere((item) => item.city == city);
      cities.remove(city);
      _saveCitiesToSharedPreferences();
    });
  }

  Future<void> _loadCitiesFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedCities = prefs.getStringList('cidades');
    if (savedCities != null) {
      setState(() {
        cities = savedCities;
        items = cities
            .map((city) =>
                WeatherCard(city: city, onRemove: () => _removeCity(city)))
            .toList();
      });
    }
  }
}
