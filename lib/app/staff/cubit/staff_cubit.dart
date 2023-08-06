import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/services/model/sub_services_model.dart';
import 'package:salonat/app/staff/model/staff_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  StaffCubit() : super(StaffInitial());
  List<StaffModel> staff = [];
  List<SubServicesModel>subServices=[];
  var prefs = locator<SharedPrefServices>();

  getStaff() async {
    emit(Loading());
    var docId =await prefs.getString(salonId);
    await FirebaseFirestore.instance
        .collection("staff")
        .where("salon-id", isEqualTo: docId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        staff.add(StaffModel.fromJson(doc.data()));
      }
    });
    emit(StaffInitial());

  }
}
