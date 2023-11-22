import 'package:flutter/material.dart';

class ScreenArguments {
  var name;
  var temp;
  ScreenArguments(
    this.name,
    this.temp,
  );
}

class Locations extends StatefulWidget {
  Locations({super.key});

  @override
  _Locations createState() => _Locations();
}

class _Locations extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Color(0xff1F1F1F),
        appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Color(0xff1F1F1F),
            leading: IconButton(
              onPressed: () =>
                  {Navigator.pushReplacementNamed(context, "/home")},
              icon: Icon(Icons.arrow_back_rounded),
            )),
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
              const SizedBox(
                height: 56,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff323232),
                    prefixIcon: Icon(Icons.search),
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
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.only(
                    top: 20, right: 24, bottom: 20, left: 24),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xff34495E)),
                height: 96,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${args.name}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${args.temp}",
                      style: TextStyle(fontSize: 32),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
