import 'package:flutter/material.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  _Locations createState() => _Locations();
}

class _Locations extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Color(0xff1F1F1F),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Color(0xff1F1F1F),
          leading:
              Icon(Icons.arrow_back_rounded, color: Colors.white, size: 25),
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
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
                padding:
                    EdgeInsets.only(top: 20, right: 24, bottom: 20, left: 24),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xff34495E)),
                height: 96,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ipupiara",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "26°",
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
