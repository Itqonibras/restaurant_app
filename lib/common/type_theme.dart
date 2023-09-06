import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final myTextTheme = TextTheme(
  displayLarge: GoogleFonts.hind(
      fontSize: 98,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5
  ),
  displayMedium: GoogleFonts.hind(
      fontSize: 61,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5
  ),
  displaySmall: GoogleFonts.hind(
      fontSize: 49,
      fontWeight: FontWeight.w400
  ),
  headlineMedium: GoogleFonts.hind(
      fontSize: 35,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25
  ),
  headlineSmall: GoogleFonts.hind(
      fontSize: 24,
      fontWeight: FontWeight.w400
  ),
  titleLarge: GoogleFonts.hind( //headline 6
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15
  ),
  titleMedium: GoogleFonts.hind(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15
  ),
  titleSmall: GoogleFonts.hind( //subtitle 2
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1
  ),
  bodyLarge: GoogleFonts.openSans(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5
  ),
  bodyMedium: GoogleFonts.openSans( //bodytext 2
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25
  ),
  labelLarge: GoogleFonts.openSans( //button
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25
  ),
  bodySmall: GoogleFonts.openSans( //caption
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4
  ),
  labelSmall: GoogleFonts.openSans( //overline
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5
  ),
);