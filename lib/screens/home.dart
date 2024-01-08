import 'package:climate_app/screens/locations.dart';
import 'package:flutter/material.dart';
import '../widgets/principal_informations.dart';
import 'package:climate_app/global/variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Home createState() => _Home();
}

class _Home extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Locations(),
                ),
              )
            },
            icon: const Icon(
              Icons.add_location_alt_outlined,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PrincipalInformations(
            city: cityValue,
          ),
        ],
      ),
    );
  }
}
