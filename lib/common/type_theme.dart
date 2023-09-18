import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final myTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(
      fontSize: 98,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
  ),
  displayMedium: GoogleFonts.poppins(
      fontSize: 61,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
  ),
  displaySmall: GoogleFonts.poppins(
      fontSize: 49,
      fontWeight: FontWeight.w400,
  ),
  headlineMedium: GoogleFonts.poppins(
      fontSize: 35,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
  ),
  headlineSmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w400,
  ),
  titleLarge: GoogleFonts.poppins( //headline 6
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
  ),
  titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
  ),
  titleSmall: GoogleFonts.poppins( //subtitle 2
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
  ),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
  ),
  bodyMedium: GoogleFonts.poppins( //bodytext 2
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
  ),
  labelLarge: GoogleFonts.poppins( //button
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
  ),
  bodySmall: GoogleFonts.poppins( //caption
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
  ),
  labelSmall: GoogleFonts.poppins( //overline
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
  ),
);