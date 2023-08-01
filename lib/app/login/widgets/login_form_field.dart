import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class LoginFormField extends StatelessWidget {

  TextEditingController fieldCtrl;
  final Function? validate;
  bool withIcon;
  IconData fieldIcon;
  bool isSecured;
  Function()? showPass;
  TextInputType fieldInput;
  String? fieldHint;
  Function()? checkFields;

  LoginFormField
  (
    {
      super.key,
      required this.validate,
      required this.fieldCtrl,
      required this.withIcon,
      required this.fieldIcon,
      required this.isSecured,
      required this.fieldInput,
      this.fieldHint,
      this.showPass,
      this.checkFields
    }
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldCtrl,
      validator: (p) => validate!(p),
      keyboardType: fieldInput,
      obscureText: isSecured,
      style: GoogleFonts.fraunces(
        textStyle: TextStyle(fontSize: 16 ,color: ColorManager.darkBrownColor, letterSpacing: 0.5),
      ),
      cursorColor: ColorManager.darkBrownColor,
      decoration: InputDecoration(
        suffixIcon: withIcon
          ? IconButton(
            onPressed: showPass,
            icon: isSecured
              ? Icon(
                Icons.visibility_off,
                color: ColorManager.greyColor
              )
              : Icon(
                  Icons.visibility,
                  color: ColorManager.darkBrownColor
              )
          )
          : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        fillColor: Colors.white,
        filled: true,
        hintText: fieldHint,
        hintStyle: TextStyle(color: ColorManager.darkBrownColor, fontSize: 19),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.zero),
          borderSide: BorderSide(color: ColorManager.lightBrownColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.zero),
          borderSide: BorderSide(color: ColorManager.lightBrownColor, width: 1.5),
        ),
      ),
    );
  }
}