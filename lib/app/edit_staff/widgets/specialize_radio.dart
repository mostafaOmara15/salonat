import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/spaces.dart';

class SpecializationRad extends StatelessWidget {
  String? value;
  List groupValue;

  final ValueChanged<String> onChanged;

  SpecializationRad({super.key, required this.value, required this.groupValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.08, vertical: context.height * 0.012),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              height: context.height * 0.020,
              width: context.height * 0.020,
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: ColorManager.primaryColor,
              ),
              child: Center(
                child: Container(
                  height: (context.height * 0.020) - context.height * 0.005,
                  width: (context.height * 0.020) - context.height * 0.005,
                  decoration: ShapeDecoration(
                    shape: const CircleBorder(),
                    color: groupValue.contains(value)
                        ? ColorManager.primaryColor
                        : Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ),
          widthSpace(context.width * 0.05),
          mediumBody(value, ColorManager.darkBrownColor, false)
        ],
      ).onTap(
          (){
            if(groupValue.contains(value)){
              groupValue.remove(value);
            }
            else {
              groupValue.add(value);
            }
            onChanged(value!);
          }
      ),
    );
  }
}