import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import '../extensions/theme/colors/color_manager.dart';
import '../spaces.dart';

class LanguageButtons extends StatelessWidget {

  String language;
  bool active;
  Function() onTap;
  LanguageButtons({required this.language, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.width * 0.015),
      decoration: BoxDecoration(
          color: active ? ColorManager.lightPrimaryColor : ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(11),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(0.7,0.7,),
            ),
          ]
      ),
      child: mediumTitle(language, ColorManager.darkBrownColor, false),
    ).onTap(onTap);
  }
}
