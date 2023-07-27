import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/spaces.dart';

class TimeField extends StatelessWidget {
  String title;
  TextEditingController timeCtrl = TextEditingController();
  String hintText;

  TimeField({super.key, required this.title, required this.timeCtrl, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mediumTitle(title, ColorManager.blackColor, false),
          widthSpace(context.width * 0.05),
          Container(
            width: context.width * 0.2,
            height: context.height * 0.035,
            padding: EdgeInsets.only(top: 7, left: context.width * 0.04),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)
            ),
            child: TextField(
              controller: timeCtrl,
              style: GoogleFonts.fraunces(
                textStyle: TextStyle(
                  color: ColorManager.blackColor,
                  letterSpacing: 0.5,
                  fontSize: 12
                 )
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GoogleFonts.fraunces(
                    textStyle: TextStyle(
                      color: ColorManager.greyColor,
                      letterSpacing: 0.5,
                        fontSize: 12
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}