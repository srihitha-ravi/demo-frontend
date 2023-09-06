import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    shadowColor: const Color.fromARGB(255, 113, 24, 20),
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 113, 24, 20),
    ),
    titleTextStyle: GoogleFonts.ptSans(
      textStyle: const TextStyle(
        color: Color.fromARGB(255, 113, 24, 20),
        fontWeight: FontWeight.bold
      ),
    ),
  ),
  // ... other theme properties
);
