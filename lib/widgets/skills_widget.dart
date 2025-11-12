import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSkillCategory(
    String title, List<dynamic> skills, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: skills
              .map((skill) => Chip(
                    label: Text(skill,
                        style: GoogleFonts.poppins(color: Colors.black87)),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ))
              .toList(),
        ),
      ],
    ),
  );
}
