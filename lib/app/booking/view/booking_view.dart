import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/app/booking/cubit/booking_cubit.dart';
import 'package:salonat/app/booking/cubit/booking_states.dart';
import 'package:salonat/app/booking/widget/book_history_card.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import '../../../utils/theme/colors/color_manager.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  BookingCubit? bookingCubit;
  List bookings = [1];

  @override
  void initState() {
    bookingCubit = BookingCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.greyColor,
          title: Text(
            'bookings'.tr().toUpperCase(),
          ),
        ),
        body: BlocBuilder<BookingCubit, BookingStates>(
          builder: (context, state) {
            return ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: context.height * 0.02),
                  decoration: BoxDecoration(
                      color: ColorManager.greyColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35))),
                  child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        disabledDayTextStyle:
                            TextStyle(color: ColorManager.greyColor),
                        currentDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year,
                            DateTime.now().month - 1, DateTime.now().day),
                        lastDate: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day + 15),
                        selectedDayHighlightColor: ColorManager.primaryColor,
                        calendarType: CalendarDatePicker2Type.single,
                        weekdayLabels: [
                          'Sun'.tr(),
                          'Mon'.tr(),
                          'Tue'.tr(),
                          'Wed'.tr(),
                          'Thu'.tr(),
                          'Fri'.tr(),
                          'Sat'.tr()
                        ],
                        selectedDayTextStyle: GoogleFonts.fraunces(
                            textStyle: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 18,
                                color: ColorManager.whiteColor)),
                        dayTextStyle: GoogleFonts.fraunces(
                            textStyle: const TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 18,
                                color: Color(0xff988E8E))),
                        controlsTextStyle: GoogleFonts.fraunces(
                          textStyle: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 20,
                            color: ColorManager.whiteColor,
                          ),
                        ),
                        weekdayLabelTextStyle: GoogleFonts.fraunces(
                            textStyle: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: "current_language_iso".tr() == "ar"
                                    ? 15
                                    : 17,
                                color: const Color(0xff988E8E))),
                        lastMonthIcon: Image.asset(
                            "assets/icons/down_arrow.png",
                            width: context.width * 0.035),
                        nextMonthIcon: Image.asset("assets/icons/up_arrow.png",
                            width: context.width * 0.035),
                      ),
                      value: [bookingCubit!.selectedDate],
                      onValueChanged: (dates) {
                        bookingCubit!.selectDate(dates[0]!);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(context.width * 0.04),
                  child: largeTitle(
                      DateFormat('dd/MM/yyyy')
                          .format(bookingCubit!.selectedDate),
                      ColorManager.buttonColor,
                      false),
                ),
                bookings.isNotEmpty
                    ? ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: context.height * 0.1),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: bookings.length,
                          itemBuilder: (BuildContext context, int index) {
                            return const BookHistoryCard();
                          },
                        ))
                    : Center(
                        child: largeTitle("noAppointmentsToday".tr(),
                            ColorManager.buttonColor, true))
              ],
            );
          },
        ));
  }
}
