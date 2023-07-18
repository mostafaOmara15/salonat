import 'package:flutter/material.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class LoginFormField extends StatelessWidget {
  TextEditingController fieldCtrl;
  String hintText;

  LoginFormField({required this.fieldCtrl, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldCtrl,
      style: TextStyle(color: ColorManager.darkBrown, fontSize: 19),
      cursorColor: ColorManager.darkBrown,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical:10, horizontal: 10),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: ColorManager.darkBrown, fontSize: 19),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.zero),
          borderSide: BorderSide(color: ColorManager.lightBrown, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.zero),
          borderSide: BorderSide(color: ColorManager.lightBrown, width: 1.5),
        ),
      ),
    );
  }
}
