import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme(){
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,

    textTheme: buildTextTheme(), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey[50]),
  );
}

TextTheme buildTextTheme(){
  return GoogleFonts.latoTextTheme().copyWith(
    subtitle1: GoogleFonts.lato(textStyle:  TextStyle(color: Colors.white)),
    subtitle2: GoogleFonts.lato(textStyle:  TextStyle(color: Colors.white)),
    bodyText1: GoogleFonts.lato(textStyle:  TextStyle(color: Colors.white)),
    headline5: GoogleFonts.lato(textStyle:  TextStyle(color: Colors.white)),
  );
}