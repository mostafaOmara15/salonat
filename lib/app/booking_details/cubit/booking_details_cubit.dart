import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/booking/model/booking_model.dart';
import 'package:salonat/app/services/model/sub_services_model.dart';
import 'package:salonat/app/staff/model/staff_model.dart';

part 'booking_details_state.dart';

class BookingDetailsCubit extends Cubit<BookingDetailsState> {
  List<SubServicesModel>subServices=[];
  List<StaffModel>staff=[];
  BookingDetailsCubit() : super(BookingDetailsInitial());
  getSubServiceAndStaff({required List<BookingService> bookingServices}) async {
    emit(BookingDetailsLoading());
    try {
      subServices.clear();
      staff.clear();
      for (var service in bookingServices) {
        await FirebaseFirestore.instance.collection("sub-services").doc(
            service.subserviceid).get().then((DocumentSnapshot document) {
          subServices.add(SubServicesModel.fromJson(document.data()));
        });
        await FirebaseFirestore.instance.collection("staff").doc(
            service.staffid).get().then((DocumentSnapshot document) {
          staff.add(StaffModel.fromJson(document.data()));
        });
      }
      emit(BookingDetailsSuccess());

    }
    catch(e){
     log("get Sub Service And Staff error $e");
    }
  }
}
