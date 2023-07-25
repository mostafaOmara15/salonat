import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

Widget aboutTheSalon (String text){
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        color: ColorManager.opacityPrimaryColor,
        child: ReadMoreText(
          text,
          trimLines: 5,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: 'Read less',
          style: GoogleFonts.fraunces(
            textStyle: TextStyle(color: ColorManager.opacityBlackColor, fontSize: 14, letterSpacing: 0.5)
          ),
          lessStyle: GoogleFonts.fraunces(
            textStyle: const TextStyle(color: Colors.blue, fontSize: 16, letterSpacing: 0.5, decoration: TextDecoration.underline, decorationColor: Colors.blue)
          ),
          moreStyle: GoogleFonts.fraunces(
            textStyle: const TextStyle(color: Colors.blue, fontSize: 16, letterSpacing: 0.5, decoration: TextDecoration.underline, decorationColor: Colors.blue)
          )
        ),
      ),
    ],
  );
}