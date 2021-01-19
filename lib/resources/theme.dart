import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() => ThemeData(
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.ibmPlexSansTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        textTheme: TextTheme(
          headline6: GoogleFonts.ibmPlexSans(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
