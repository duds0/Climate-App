import 'package:climate_app/animations/backgrounds.dart';
import 'package:flutter/material.dart';

class Initial extends StatelessWidget {
  final String centerText;
  final String bottomText;

  const Initial({
    Key? key,
    required this.centerText,
    required this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                strokeWidth: 3,
                color: Color(0xffffffff),
              ),
              const SizedBox(height: 16),
              Text(
                centerText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
        Positioned(
          bottom: 24,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            width: MediaQuery.of(context).size.width,
            child: Text(
              bottomText,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
