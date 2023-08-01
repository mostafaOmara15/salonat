import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';

Widget centerIndicator() {
  return Positioned.fill(
    child: Container(
      color: Colors.black45,
      child:  Center(
        child: SpinKitFadingCircle(
          color: ColorManager.primaryColor,
        ),
      ),
    ),
  );
}
