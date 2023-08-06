import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';

class TimeField extends StatefulWidget {
  String title;
  TimeOfDay  selectedTime;
  bool timeUpdated = false;

  TimeField({super.key, required this.title, required this.selectedTime});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  Future<void> showTimePickerDialog() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: widget.selectedTime,
    );

    if (pickedTime != null && pickedTime != widget.selectedTime) {
      setState(() {
        widget.selectedTime = pickedTime;
        widget.timeUpdated = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height *0.01, horizontal: context.width * 0.12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mediumTitle(widget.title, Colors.black, false),
          Center(
            child: Container(
              width: context.width * 0.5,
              height: context.height * 0.04,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.greyColor),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                  child: widget.timeUpdated

                      ?
                  smallTitle(widget.selectedTime.format(context), ColorManager.blackColor, false)
                      : smallTitle(widget.selectedTime.format(context), ColorManager.greyColor, false)
              ),
            ).onTap((){showTimePickerDialog();}),
          ),
        ],
      ),
    );
  }
}