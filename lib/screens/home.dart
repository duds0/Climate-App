import 'package:climate_app/global/variables.dart';
import 'package:climate_app/screens/locations.dart';
import 'package:climate_app/widgets/principal_informations.dart';
import 'package:flutter/cupertino.dart';
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

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text("Tem certeza?",
                style: TextStyle(fontFamily: "Inter")),
            content: const Text("Você realmente quer sair?",
                style: TextStyle(fontFamily: "Inter")),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(false),
                textStyle: const TextStyle(color: CupertinoColors.systemRed),
                child: const Text("Não", style: TextStyle(fontFamily: "Inter")),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(true),
                isDefaultAction: true,
                textStyle: const TextStyle(color: CupertinoColors.systemBlue),
                child: const Text("Sim", style: TextStyle(fontFamily: "Inter")),
              ),
            ],
          ),
        );

        return shouldPop ?? false;
      },
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Inter", brightness: Brightness.dark),
        home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            forceMaterialTransparency: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (context) => const Locations()));

                  toggleHomePageController();
                },
                icon: const Icon(
                  Icons.add,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: FutureBuilder<List<String>>(
            future: _loadCitiesFromSharedPreferences(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
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
        ),
      ),
    );
  }
}
