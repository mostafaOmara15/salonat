import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget largeTitle(String? text, Color color, bool isBold){
  return AutoSizeText(
    text!,
    style: GoogleFonts.fraunces(
      textStyle: TextStyle(color: color, letterSpacing: 0.5, fontWeight: isBold ? FontWeight.w700 : FontWeight.w600)
    ),
    minFontSize: 18,
    maxFontSize: 22,
    maxLines: 2,
  );
}

Widget mediumTitle(String? text, Color color, bool isBold){
  return AutoSizeText(
    text!,
    style: GoogleFonts.fraunces(
      textStyle: TextStyle(color: color, letterSpacing: 0.5, fontWeight: isBold ? FontWeight.w700 : FontWeight.w600),
    ),
    textAlign: TextAlign.center,
    minFontSize: 16,
    maxFontSize: 20,
    maxLines: 2,
  );
}

Widget smallTitle(String? text, Color color, bool isBold){
  return AutoSizeText(
    text!,
    style: GoogleFonts.fraunces(
      textStyle: TextStyle(color: color, letterSpacing: 0.5, fontWeight: isBold ? FontWeight.w700 : FontWeight.w400),
    ),
    textAlign: TextAlign.center,
    maxLines: 2,
    minFontSize: 12,
    maxFontSize: 16,
  );
}

Widget largeBody(String? text, Color color){
  return AutoSizeText(
    text!,
    style: GoogleFonts.fraunces(
      textStyle: TextStyle(
        color: color,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w600
      )
    ),
    maxFontSize: 14,
    minFontSize: 12,
    maxLines: 1,
  );
}

Widget mediumBody(String? text, Color color, bool center){
  return AutoSizeText(
    text!,
    style: GoogleFonts.fraunces(
      textStyle: TextStyle(
        color: color,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w600
      ),
    ),
    textAlign: center ? TextAlign.center : TextAlign.start,
    maxFontSize: 12,
    minFontSize: 10,
    maxLines: 5,
  );
}

Widget smallBody(String? text, Color color, bool isBold){
  return AutoSizeText(
    text!,
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