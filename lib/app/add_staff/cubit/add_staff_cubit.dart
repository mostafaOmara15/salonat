import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/services/model/sub_services_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';
part 'add_staff_state.dart';

class AddStaffCubit extends Cubit<AddStaffState> {
  AddStaffCubit() : super(AddStaffInitial());
  List<SubServicesModel> subServices = [];
  List<SubServicesModel> selectedSubServices = [];
  var prefs = locator<SharedPrefServices>();
  TextEditingController nameCtrl = TextEditingController();

  void selectSubServices(SubServicesModel subService){
    if(selectedSubServices.contains(subService)){
      selectedSubServices.remove(subService);
      emit(SelectSubService());
      print(selectedSubServices.length);

    }
    else{
      selectedSubServices.add(subService);
      emit(SelectSubService());
      print(selectedSubServices);
    }
  }

  getSubServices() async {
    String docId = await prefs.getString(salonId);
    try {
      emit(LoadingSubServices());
      await FirebaseFirestore.instance
          .collection("sub-services")
          .where("salon-id", isEqualTo: docId)
          .get()
          .then((QuerySnapshot querySnapshot) {
            for(var doc in querySnapshot.docs ){
              subServices.add(SubServicesModel.fromJson(doc.data()));
            }
            print(subServices[0].isSelected);
      }).then((value){
        emit(SuccessSubServices());
      },);
    } catch (e) {
      emit(ErrorSubServices());
      log("getSubServices error $e");
    }
  }
}
