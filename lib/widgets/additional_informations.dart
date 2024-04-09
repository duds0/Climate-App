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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            description,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: content,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: unitOfMeasurement,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
