import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/theme/colors/color_manager.dart';

class TimeField extends StatefulWidget {
  String title;
  TextEditingController timeController;
  Function() onTap;

  TimeField({super.key,required this.title, required this.timeController, required this.onTap});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height *0.01, horizontal: context.width * 0.12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mediumTitle(widget.title, Colors.black, false),
          widthSpace(context.width * 0.05),
          Container(
            height: context.height * 0.05,
            width: context.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: ColorManager.greyColor)
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TextFormField(
                controller: widget.timeController,
                readOnly: true,
                onTap: () async {
                  TimeOfDay? pickedTime =  await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  if(pickedTime != null ){
                    print(pickedTime.format(context));   //output 10:51 PM
                    DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                    String formattedTime = DateFormat('HH:mm').format(parsedTime);
                    print(formattedTime); //output 14:59:00
                    setState(() {
                      widget.timeController.text = formattedTime;
                      widget.onTap;
                    });
                  }else{
                    print("Time is not selected");
                  }
                },
                style: GoogleFonts.fraunces(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: ColorManager.greyColor200,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                  ),
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}