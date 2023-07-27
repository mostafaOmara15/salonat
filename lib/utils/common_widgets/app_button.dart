import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../app/services/widgets/service_textfield.dart';
import '../extensions/theme/colors/color_manager.dart';
import '../spaces.dart';

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
