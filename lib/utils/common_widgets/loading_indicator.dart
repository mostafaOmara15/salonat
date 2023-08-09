import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/colors/color_manager.dart';

Widget centerIndicator() {
  return
    //Positioned.fill(
  //  child:
  Container(
      color: Colors.transparent,
      child:  Center(
        child: SpinKitFadingCircle(
          color: ColorManager.primaryColor,
        ),
      ),
    );
  //);
}
