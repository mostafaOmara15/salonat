import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';

import '../theme/colors/color_manager.dart';

class AppButton extends StatelessWidget {
  String title;
  Function() onTap;
  AppButton({super.key, required this.title, required this.onTap});

  TextEditingController ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primaryColor, elevation: 0,
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: mediumTitle(title, ColorManager.whiteColor, false),
        )
    );
  }
}
