import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}