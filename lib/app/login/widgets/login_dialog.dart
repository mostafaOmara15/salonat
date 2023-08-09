import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/dialog_button.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';

import '../../../utils/theme/colors/color_manager.dart';

class loginDialog extends StatelessWidget {
  String subTitle;

  loginDialog({super.key, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.whiteColor,
      elevation: 0,
      insetPadding: EdgeInsets.only(bottom: context.height * 0.35),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
      titlePadding:  EdgeInsets.all(context.width * 0.05),
      actionsPadding: const EdgeInsets.all(0),
      title: const Center(child: Icon(Icons.info)),
      // Center(child: Text("${"remove".tr()} ( Nirvana Anti Aging 90 )", style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)),
      content: Container(
        height: context.height * 0.06,
        width: context.width * 0.7,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: mediumBody(subTitle, ColorManager.buttonColor,true)),
            ],
          ),
        ),
      ),
      actions: [
        Column(
          children: [
            const Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AlertButton(title: "cancel".tr(), onTap: () => context.pop(),),
              ],
            ),
          ],
        ),
      ],
    );
  }
}