import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class ProfileTile extends StatelessWidget {
  String title;
  Widget? navigatedScreen;
  Function()? onTap;
  bool withIcon;

  ProfileTile({super.key,
    required this.title,
    this.navigatedScreen,
    this.onTap,
    required this.withIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: ColorManager.greyColor))),
      child: ListTile(
        title: largeTitle(title, ColorManager.blackColor, false),
        onTap: onTap ?? () {context.push(navigatedScreen!);},
        trailing: withIcon ? Icon(Icons.arrow_forward_ios_rounded, size: context.width * 0.04) : null,
      ),
    );
  }
}
