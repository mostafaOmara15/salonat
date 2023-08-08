import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';

import '../../../utils/extensions/theme/colors/color_manager.dart';

class OfferDescription extends StatelessWidget {
  TextEditingController controller;
  String hint;
  bool isAr;
  final Function? validate;

  OfferDescription({required this.controller, required this.hint, required this.isAr, required this.validate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(border: Border.all(color: ColorManager.blackColor, width: 0.3)),
        width: double.infinity,
        child: TextFormField(
          validator: (p) => validate!(p),
          // validator: (p) => validate!(p),
          controller: controller,
          keyboardType: TextInputType.multiline,
          style: GoogleFonts.fraunces(textStyle: TextStyle(fontSize: 16 ,color: ColorManager.opacityBlackColor, letterSpacing: 0.5),),
          cursorColor: ColorManager.darkBrownColor,
          textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
          textAlign: isAr ? TextAlign.right : TextAlign.left,
          maxLines: null,
          minLines: 2,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: ColorManager.opacityBlackColor, fontSize: 14),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            errorBorder: OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none
            ),
          ),
        ),
      ),
    );
  }
}