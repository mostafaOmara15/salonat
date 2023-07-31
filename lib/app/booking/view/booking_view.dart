import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/app/booking/cubit/booking_cubit.dart';
import 'package:salonat/app/booking/cubit/booking_states.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'package:salonat/utils/spaces.dart';


class BookingScreen extends StatefulWidget {
  BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => BookingCubit(),
      child: BlocConsumer<BookingCubit, BookingStates>(
        listener: (context, BookingStates state) {},
        builder: (context, BookingStates state) {
          BookingCubit bookingCubit = BookingCubit.get(context);

          return Scaffold(
            appBar: AppBar(backgroundColor: ColorManager.greyColor, title: Text('bookings'.tr().toUpperCase())),
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
                  decoration:  BoxDecoration(
                      color: ColorManager.greyColor,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35))
                  ),
                  child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        selectedDayHighlightColor: ColorManager.primaryColor,
                        calendarType: CalendarDatePicker2Type.single,
                        weekdayLabels: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
                        selectedDayTextStyle: GoogleFonts.fraunces(
                            textStyle: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 18,
                                color: ColorManager.whiteColor
                            )
                        ),
                        dayTextStyle: GoogleFonts.fraunces(
                            textStyle: const TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 18,
                                color: Color(0xff988E8E)
                            )
                        ),
                        controlsTextStyle: GoogleFonts.fraunces(
                            textStyle: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 20,
                              color: ColorManager.whiteColor,
                            )
                        ),
                        weekdayLabelTextStyle:  GoogleFonts.fraunces(
                            textStyle: const TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 18,
                                color: Color(0xff988E8E)
                            )
                        ),
                        lastMonthIcon: Image.asset("assets/icons/down_arrow.png", width: context.width * 0.035),
                        nextMonthIcon: Image.asset("assets/icons/up_arrow.png", width: context.width * 0.035) ,
                      ),
                      value: [bookingCubit.selectedDate],
                      onValueChanged: (dates) {
                        bookingCubit.selectDate(dates[0]!);
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(context.width * 0.04),
                  child: largeTitle(DateFormat('dd/MM/yyyy').format(bookingCubit.selectedDate), ColorManager.buttonColor, false),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(minHeight: context.height * 0.1),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.width * 0.04, vertical: context.height * 0.01),
                            child: Container(
                              width: context.width,
                              height: context.height *0.15,
                              padding: EdgeInsets.only(
                                  right: context.width * 0.04,
                                  left: context.width * 0.04,
                                  top: context.height * 0.01,
                                  bottom: context.width * 0.003
                              ),
                              margin: EdgeInsets.all(context.width *0.01),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffA9A2A2)),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          mediumBody("clientName".tr(), ColorManager.blackColor, false),
                                          mediumBody("phoneNumber".tr(), ColorManager.blackColor, false),
                                          mediumBody("time".tr(), ColorManager.blackColor, false),
                                          mediumBody("reservationAmount".tr(), ColorManager.blackColor, false),
                                        ],
                                      ),
                                      widthSpace(context.width * 0.15),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          mediumBody("Example", ColorManager.blackColor, false),
                                          mediumBody("01111111111", ColorManager.blackColor, false),
                                          mediumBody("11:00", ColorManager.blackColor, false),
                                          mediumBody("SAR 1233", ColorManager.blackColor, false),
                                        ],
                                      ),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      mediumBody("More details ->", ColorManager.blackColor, false).onTap((){}),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    )
                ),
              ],
            ),
          );
        },
      )
    );
  }
}
