import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/theme/colors/color_manager.dart';

class AboutTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  bool isAr;

  AboutTextField({required this.controller, required this.hint, required this.isAr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03, vertical: context.height * 0.03),
      child: Container(
        color: ColorManager.primaryColor,
        width: double.infinity,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          style: GoogleFonts.fraunces(textStyle: TextStyle(fontSize: 14 ,color: ColorManager.opacityBlackColor, letterSpacing: 0.5),),
          cursorColor: ColorManager.darkBrownColor,
          textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
          textAlign: isAr ? TextAlign.right : TextAlign.left,
          maxLines: null,
          minLines: 3,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: ColorManager.opacityBlackColor, fontSize: 14),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none
            ),
          ),
        ),
      ),
    );
  }
}