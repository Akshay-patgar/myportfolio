import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildEducationCard(BuildContext context, Map<String, dynamic> edu) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 16),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              edu["degree"],
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              edu["school"],
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              edu["duration"],
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
