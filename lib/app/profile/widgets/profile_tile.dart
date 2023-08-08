import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class ProfileTile extends StatelessWidget {
  String title;
  Function() onTap;
  bool withIcon;

  ProfileTile({super.key,
    required this.title,
    required this.onTap,
    required this.withIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: ColorManager.greyColor))),
      child: ListTile(
        title: largeTitle(title, ColorManager.blackColor, false),
        onTap: onTap,
        trailing: withIcon ? Icon(Icons.arrow_forward_ios_rounded, size: context.width * 0.04) : null,
      ),
    );
  }
}
