import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: GoogleFonts.nunito().fontFamily,
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        TextStyle(color: Colors.black),
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(103, 179, 179, 179),
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.nunito(fontSize: 43),
    bodyMedium: GoogleFonts.nunito(fontSize: 23),
  ),
);
