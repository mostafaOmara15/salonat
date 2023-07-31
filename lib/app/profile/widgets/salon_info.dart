import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/sup_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';
import '../../../utils/spaces.dart';
import '../../opening/view/opening_screen.dart';
import 'about_salon.dart';

class SalonInfo extends StatelessWidget {
  String info;
  String address;
  SalonInfo({super.key, required this.info, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AboutTheSalon(text: info),
        heightSpace(context.height * 0.01),
        Row(
          children: [
            widthSpace(context.width * 0.025),
            Icon(Icons.location_on_outlined, color: ColorManager.primaryColor),
            widthSpace(context.width * 0.01),
            smallTitle(address, ColorManager.darkBrownColor, false)
          ],
        ),
        heightSpace(context.height * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            smallTitle("${"openFrom".tr()} 09:00am - 10:00pm ", ColorManager.blackColor, false),
            SupButton(height: context.height * 0.03, title: "edit".tr(), onTap:() {context.push(OpeningTimeScreen());})
          ],
        ),
      ],
    );
  }
}