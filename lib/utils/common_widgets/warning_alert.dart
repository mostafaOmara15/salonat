import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import '../extensions/theme/colors/color_manager.dart';
import 'dialog_button.dart';

class WarningAlert extends StatelessWidget {
  String title;
  String supTitle;
  Function() action;

  WarningAlert(
      {required this.title, required this.supTitle, required this.action});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.whiteColor,
      elevation: 0,
      insetPadding: EdgeInsets.only(bottom: context.height * 0.35),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
      titlePadding: EdgeInsets.all(context.width * 0.05),
      actionsPadding: const EdgeInsets.all(0),
      title: SizedBox(
        height: 20,
        width: 100,
        child: Center(child: smallTitle(title, ColorManager.blackColor, false)),
      ),
      // Center(child: Text("${"remove".tr()} ( Nirvana Anti Aging 90 )", style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)),
      content: Container(
        height: context.height * 0.06,
        width: context.width * 0.7,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                  child: mediumBody(supTitle, ColorManager.buttonColor, true)),
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
                AlertButton(
                  title: "cancel".tr(),
                  onTap: () => context.pop(),
                ),
                AlertButton(
                    title: "delete".tr(),
                    onTap: () {
                      context.pop();
                      action();
                    }),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
