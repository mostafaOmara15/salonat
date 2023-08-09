import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';

import '../theme/colors/color_manager.dart';

class SupButton extends StatelessWidget {
  double height;
  Function() onTap;
  String title;
  SupButton({required this.height, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: ColorManager.primaryColor, elevation: 0),
        child: mediumBody(title, ColorManager.whiteColor, false)
      ),
    );
  }
}
