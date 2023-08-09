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

  TimeField({super.key,required this.title, required this.timeController});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {

  // DateTime _selectedDate = DateTime.now();
  //
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate ?? DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(DateTime.now().year + 2),
  //   );
  //
  //   if (picked != null && picked != _selectedDate) {
  //     setState(() {
  //       _selectedDate = picked;
  //       widget.timeController.text = DateFormat('yyyy-MM-dd').format(picked).toString(); // Format as needed
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.height *0.01, horizontal: context.width * 0.12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mediumTitle(widget.title, Colors.black, false),
          widthSpace(context.width * 0.1),
          Container(
            color: Colors.red,
            height: context.height * 0.05,
            width: context.width * 0.4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
                      print(parsedTime); //output 1970-01-01 22:53:00.000
                      String formattedTime = DateFormat('HH:mm').format(parsedTime);
                      print(formattedTime); //output 14:59:00
                      setState(() {
                        widget.timeController.text = formattedTime; //set the value of text field.
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
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: ColorManager.greyColor)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: ColorManager.greyColor)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class TimeField extends StatefulWidget {
//   String title;
//   TimeOfDay  selectedTime;
//   bool timeUpdated = false;
//
//   TimeField({super.key, required this.title, required this.selectedTime});
//
//   @override
//   State<TimeField> createState() => _TimeFieldState();
// }
//
// class _TimeFieldState extends State<TimeField> {
//   Future<void> showTimePickerDialog() async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: widget.selectedTime,
//     );
//
//     if (pickedTime != null && pickedTime != widget.selectedTime) {
//       setState(() {
//         widget.selectedTime = pickedTime;
//         widget.timeUpdated = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: context.height *0.01, horizontal: context.width * 0.12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           mediumTitle(widget.title, Colors.black, false),
//           Center(
//             child: Container(
//               width: context.width * 0.5,
//               height: context.height * 0.04,
//               decoration: BoxDecoration(
//                   border: Border.all(color: ColorManager.greyColor),
//                   borderRadius: BorderRadius.circular(5)
//               ),
//               child: Center(
//                   child: widget.timeUpdated
//                     ? smallTitle(widget.selectedTime.format(context), ColorManager.blackColor, false)
//                     : smallTitle(widget.selectedTime.format(context), ColorManager.greyColor, false)
//               ),
//             ).onTap((){showTimePickerDialog();}),
//           ),
//         ],
//       ),
//     );
//   }
// }