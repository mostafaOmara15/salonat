import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class ServiceButton extends StatelessWidget {
  String title;

  ServiceButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.03, horizontal: context.width * 0.04),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: ColorManager.greyColor, elevation: 0),
          onPressed: (){},
          child: smallTitle(title, ColorManager.opacityBlackColor, false)
      ),
    );
  }
}