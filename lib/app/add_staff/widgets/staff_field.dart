import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class StaffField extends StatelessWidget {

  String hintText;
  TextEditingController fieldCtrl;
  double width;

  StaffField({super.key, required this.hintText, required this.fieldCtrl, required this.width});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
        width: context.width * width,
        child: TextFormField(
          controller: fieldCtrl,
          style: GoogleFonts.fraunces(
            textStyle: TextStyle(fontSize: 12 ,color: ColorManager.darkBrownColor, letterSpacing: 0.5),
          ),
          maxLines: 1,
          cursorColor: ColorManager.darkBrownColor,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: ColorManager.greyColor, fontSize: 14),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.zero),
              borderSide: BorderSide(color: ColorManager.greyColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.zero),
              borderSide: BorderSide(color: ColorManager.greyColor, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
