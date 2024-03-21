import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdditionalInformations extends StatelessWidget {
  AdditionalInformations({
    super.key,
    required this.content,
    required this.description,
    this.unitOfMeasurement,
  });

  String description;
  String content;
  String? unitOfMeasurement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          description,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: content,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: unitOfMeasurement,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
