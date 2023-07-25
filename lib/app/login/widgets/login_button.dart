import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class LoginButton extends StatelessWidget {
  Function? function;

  LoginButton({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: context.width * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorManager.lightBrownColor, width: 1.5),
      ),
      child: Center(
          child: mediumTitle("login".tr(), ColorManager.darkBrownColor, false)
      ),
    ).onTap(function);
  }
}
