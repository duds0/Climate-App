import 'package:flutter/material.dart';

class AdditionalInformations extends StatelessWidget {
  final String description;
  final String content;
  final String? unitOfMeasurement;

  const AdditionalInformations({
    Key? key,
    required this.description,
    required this.content,
    this.unitOfMeasurement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: "Inter",
            ),
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
                      fontFamily: "Inter"),
                ),
                if (unitOfMeasurement != null)
                  TextSpan(
                    text: unitOfMeasurement!,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inter"),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
