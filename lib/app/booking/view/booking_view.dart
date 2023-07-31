import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.greyColor,
        title: Text("bookings".tr(),
            style: const TextStyle(fontSize: 22, color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
      Container(
        decoration:  BoxDecoration(
            color: ColorManager.greyColor,

            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(20))
        ),
        child: CalendarDatePicker2(

        config: CalendarDatePicker2Config(
          dayTextStyle: const TextStyle(color: Color(0xff988E8E)),
controlsTextStyle: const TextStyle(color: Colors.white),
          lastMonthIcon:  Icon(Icons.arrow_drop_down,color: ColorManager.primaryColor,size: 50),
          nextMonthIcon: Icon(Icons.arrow_drop_up,color: ColorManager.primaryColor,size: 50,) ,
          selectedDayHighlightColor: ColorManager.primaryColor,
        calendarType: CalendarDatePicker2Type.single,
        ),
        value: [DateTime.now()],
        onValueChanged: (dates) => print( dates),
    ),
      )
        ],
      ),
    );
  }
}
