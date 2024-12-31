import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// NUTRITION CARD WIDGET

class NutritionCard extends StatelessWidget {
  const NutritionCard({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: 80,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(14, 161, 125, 0.08),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color.fromRGBO(14, 161, 125, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
