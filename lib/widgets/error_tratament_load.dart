import 'package:climate_app/animations/backgrounds.dart';
import 'package:flutter/material.dart';

class Load extends StatelessWidget {
  const Load({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Background(),
        Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Color(0xffffffff),
          ),
        ),
      ],
    );
  }
}
