import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';

class InputField extends StatefulWidget {
  IconData icon;
  TextInputType inputType;
  bool isPassword;
  TextEditingController controller;
  String hint;
  bool enable;
  bool enableIcon;
  String language;
  final validator;
  Function()? onChange;
  FocusNode? focusNode;
  int maxLine;

  InputField({
    required this.hint,
    required this.inputType,
    required this.controller,
    required this.icon,
    required this.validator,
    this.isPassword = false,
    this.enableIcon = false,
    this.maxLine = 1,
    this.language = '',
    this.enable = true,
    this.onChange,
    this.focusNode,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        textDirection: widget.language.isEmpty
            ? null
            : widget.language == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        maxLines: widget.maxLine,
        focusNode: widget.focusNode ?? FocusNode(),
        enabled: widget.enable,
        cursorColor: ColorManager.blackColor,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: isHidden && widget.isPassword,
        keyboardType: widget.inputType,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: ColorManager.blackColor,
          fontFamily: 'Lato',
        ),
        decoration: InputDecoration(
          prefixIcon: widget.enableIcon ? Icon(widget.icon) : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          border: InputBorder.none,
          isDense: true,
          alignLabelWithHint: false,
          hintText: widget.hint,
          hintTextDirection: widget.language.isEmpty
              ? null
              : widget.language == "ar"
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          hintStyle: TextStyle(
            color: Colors.black26.withOpacity(0.3),
          ),
          filled: true,
          fillColor: Colors.transparent,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          enabledBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 0.6,
              color: ColorManager.blackColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 0.6,
              color: ColorManager.blackColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 2),
            gapPadding: 0,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: 2,
            ),
            gapPadding: 0,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              width: 2,
            ),
            gapPadding: 0,
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: isHidden == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Icon(
                            Icons.visibility_off, // color: blackColor,
                            size: 22,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Icon(
                            Icons.visibility, // color: blackColor,
                            size: 22,
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                        ),
                )
              : const SizedBox(),
          suffixIconConstraints: const BoxConstraints(maxHeight: 20),
        ),
      ),
    );
  }
}
