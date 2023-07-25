import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class ProfileTile extends StatelessWidget {
  String title;
  bool withButton;
  Widget navigatedScreen;

  ProfileTile({super.key,
    required this.title,
    required this.withButton,
    required this.navigatedScreen,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: withButton
          ? mediumTitle(title, ColorManager.blackColor, false)
          : mediumTitle(title, ColorManager.blackColor, false),
      onTap: () {
        withButton == false ? context.push(navigatedScreen) : () {};
      },
      trailing: withButton
          ? SizedBox(
              height: context.height * 0.03,
              child: ElevatedButton(
                  onPressed: () {
                    context.push(navigatedScreen);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primaryColor, elevation: 0),
                  child: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          : const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
