import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeTitle extends StatelessWidget {
  String text;
  Color color;
  bool isBold = false;
  LargeTitle({required this.text, required this.color, required this.isBold});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: GoogleFonts.fraunces(
          textStyle: TextStyle(
              color: color,
              fontSize: 19,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.normal
          )
      ),
      maxLines: 1,
    );
  }
}

class SubTitle extends StatelessWidget {
  String text;
  Color color;
  bool isBold = false;
  SubTitle({required this.text, required this.color, required this.isBold});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: GoogleFonts.fraunces(
          textStyle: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.normal
          )
      ),
      maxLines: 1,
    );
  }
}