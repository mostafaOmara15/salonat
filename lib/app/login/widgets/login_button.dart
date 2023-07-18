import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class LoginButton extends StatelessWidget {

  Function? function;

  LoginButton({required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorManager.lightBrown, width: 1.5),
      ),
      child: Center(child: Text("Log in", style: TextStyle(
          color: ColorManager.darkBrown,
          fontSize: 19,
          fontWeight: FontWeight.w600))),
    ).onTap(
        function
    );
  }
}
