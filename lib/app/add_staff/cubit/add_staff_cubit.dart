import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/services/model/sub_services_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

part 'add_staff_state.dart';

class AddStaffCubit extends Cubit<AddStaffState> {
  AddStaffCubit() : super(AddStaffInitial());
  List<SubServicesModel> subServices = [];
  var prefs = locator<SharedPrefServices>();

  getSubServices() async {
    String docId = await prefs.getString(salonId);
    try {
      await FirebaseFirestore.instance
          .collection("sub-services")
          .where("salon-id", isEqualTo: docId)
          .get()
          .then((QuerySnapshot querySnapshot) {
            for(var doc in querySnapshot.docs ){
              subServices
                  .add(SubServicesModel.fromJson(doc.data()));
            }

      });
    } catch (e) {
      log("getSubServices error $e");
    }
  }
}
