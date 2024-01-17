import 'package:climate_app/global/variables.dart';
import 'package:climate_app/screens/locations.dart';
import 'package:climate_app/widgets/principal_informations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Home createState() => _Home();
}

class _Home extends State<HomePage> with AutomaticKeepAliveClientMixin {
  Future<List<String>> _loadCitiesFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cities = prefs.getStringList('cities');
    return cities ?? [];
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    void toggleHomePageController() {
      setState(() {
        if (isFirstTimePressed) {
          homePageController = !homePageController;
          isFirstTimePressed = false;
        }
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Locations(),
                ),
              );
              toggleHomePageController();
            },
            icon: const Icon(
              Icons.add_location_alt_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: _loadCitiesFromSharedPreferences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Indicador de carregamento, caso necessário.
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Tratar erro, caso necessário.
            return Text('Erro: ${snapshot.error}');
          } else {
            List<String> savedCities = snapshot.data!;
            String firstCity =
                savedCities.isNotEmpty ? savedCities.first : 'Default City';

            return Stack(
              children: [
                homePageController
                    ? PrincipalInformations(
                        city: firstCity,
                      )
                    : PrincipalInformations(city: cityValue)
              ],
            );
          }
        },
      ),
    );
  }
}
