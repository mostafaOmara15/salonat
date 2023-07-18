import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  /// add tap to parent widget
  Widget onTap(
      Function? function, {
        BorderRadius borderRadius = const BorderRadius.all(Radius.circular(0)),
        Color? splashColor,
      }) {
    return InkWell(
      onTap: function as void Function()?,
      borderRadius: borderRadius,
      splashColor: splashColor,
      child: this,
    );
  }
}