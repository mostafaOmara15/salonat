import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget largeTitle(String text, Color color){
  return AutoSizeText(
    text,
    style: GoogleFonts.fraunces(
        textStyle: TextStyle(
            color: color,
            letterSpacing: 0.5,
            fontSize: 22,
            fontWeight: FontWeight.w700
        )
    ),
    minFontSize: 20,
    maxLines: 1,
  );
}

Widget mediumTitle(String text, Color color, bool isBold){
  return AutoSizeText(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.fraunces(
        textStyle: TextStyle(
            color: color,
            letterSpacing: 0.5,
            fontSize: 20,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
        ),
    ),
    minFontSize: 18,
    maxLines: 2,
  );
}

Widget smallTitle(String text, Color color, bool isBold){
  return AutoSizeText(
    text,
    style: GoogleFonts.fraunces(
        textStyle: TextStyle(
            color: color,
            letterSpacing: 0.5,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.normal,
            fontSize: 16
        )
    ),
    maxLines: 1,
    minFontSize: 14,
  );
}
Widget largeBody(String text, Color color){
  return AutoSizeText(
    text,
    style: GoogleFonts.fraunces(
        textStyle: TextStyle(
            color: color,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600
        )
    ),
    maxFontSize: 20,
    minFontSize: 18,
    maxLines: 1,
  );
}

Widget mediumBody(String text, Color color, bool isBold){
  return AutoSizeText(
    text,
    style: GoogleFonts.fraunces(
        textStyle: TextStyle(
            color: color,
            letterSpacing: 0.5,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.normal
        )
    ),
    maxFontSize: 14,
    minFontSize: 12,
    maxLines: 1,
  );
}

Widget smallBody(String text, Color color, bool isBold){
  return AutoSizeText(
    text,
    style: GoogleFonts.fraunces(
        textStyle: TextStyle(
            color: color,
            letterSpacing: 0.5,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.normal
        )
    ),
    maxFontSize: 12,
    minFontSize: 10,
    maxLines: 1,
  );
}