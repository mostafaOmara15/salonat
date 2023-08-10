import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/booking/cubit/booking_states.dart';
import 'package:salonat/app/booking/model/booking_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit() : super(BookingInitialState());
  var prefs = locator<SharedPrefServices>();
  List<BookingModel> bookings=[];
  static BookingCubit get(context) => BlocProvider.of(context);

  DateTime selectedDate =DateTime.now();

  void selectDate(DateTime date) {
    selectedDate = date;
    print(DateFormat("yyyy-MM-dd").format(selectedDate));
    emit(SelectBookingDateState());
  }

  getBooking({required String date}) async {
    emit(BookingLoadingState());
    String salon = await prefs.getString(salonId);
    try {
      await FirebaseFirestore.instance
          .collection("booking")
          .where("salon-id", isEqualTo: salon)
          .where("booking-date", isEqualTo: date)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          bookings.add(BookingModel.fromJson(doc.data()));
        }
        emit(BookingSuccessState());

      });
    } catch (e) {
      log("get Booking");
    }
  }
}
