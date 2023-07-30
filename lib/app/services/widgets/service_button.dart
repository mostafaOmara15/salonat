import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class ServiceButton extends StatelessWidget {
  String title;
  bool active;

  ServiceButton({super.key, required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.03, horizontal: context.width * 0.02),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: active ? ColorManager.primaryColor :ColorManager.greyColor,
              elevation: 0),
          onPressed: (){},
          child: smallTitle(title, ColorManager.opacityBlackColor, false)
      ),
    );
  }
}