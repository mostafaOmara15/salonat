import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class ServiceTextField extends StatelessWidget {

  String hintText;
  TextEditingController fieldCtrl;
  double width;
  int maxLines;

  ServiceTextField({super.key, required this.hintText, required this.fieldCtrl, required this.width, required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * width,
      child: TextFormField(
        controller: fieldCtrl,
        style: GoogleFonts.fraunces(
          textStyle: TextStyle(fontSize: 14 ,color: ColorManager.darkBrownColor, letterSpacing: 0.5),
        ),
        maxLines: maxLines,
        cursorColor: ColorManager.darkBrownColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: ColorManager.lightBrownColor, fontSize: 14),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.zero),
            borderSide: BorderSide(color: ColorManager.lightBrownColor, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.zero),
            borderSide: BorderSide(color: ColorManager.lightBrownColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
