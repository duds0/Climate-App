import 'package:climate_app/animations/backgrounds.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Initial extends StatelessWidget {
  Initial({
    super.key,
    required this.bottomText,
    required this.centerText,
  });

  String centerText;
  String bottomText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                strokeWidth: 3,
                color: Color(0xffffffff),
              ),
              const SizedBox(height: 16),
              Text(centerText,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w300)),
              const SizedBox(height: 32),
            ],
          ),
        ),
        Positioned(
          bottom: 24,
          child: Container(
            padding: const EdgeInsets.only(left: 4, right: 4),
            width: MediaQuery.of(context).size.width,
            child: Text(
              bottomText,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
