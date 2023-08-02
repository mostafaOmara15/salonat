import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/services/model/main_services_model.dart';
import 'package:salonat/app/services/model/sub_services_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());
  List<MainServicesModel> mainServices = [];
  var prefs = locator<SharedPrefServices>();
  List<List<SubServicesModel>> subServicesModel = [];
  TextEditingController serviceNameCtrl = TextEditingController();
  TextEditingController serviceDurationCtrl = TextEditingController();
  TextEditingController serviceDescriptionCtrl = TextEditingController();
  TextEditingController serviceSalaryCtrl = TextEditingController();

  getMainServices() async {
    emit(Loading());
    try {
      await FirebaseFirestore.instance
          .collection("main-services")
          .get()
          .then((QuerySnapshot querySnapshot) async {
        for (var doc in querySnapshot.docs) {
          mainServices.add(MainServicesModel.fromJson(doc.data()));
          await getSubServices(mainServiceId: doc.id.toString());
        }
        emit(ServicesLoaded());
      });
    } catch (e) {
      log("getMainServices error :$e");
    }
  }

  getSubServices({required mainServiceId}) async {
    String salId = await prefs.getString(salonId);
    try {
      await FirebaseFirestore.instance
          .collection("sub-services")
          .where("main-service-id", isEqualTo: mainServiceId.toString())
          .where("salon-id", isEqualTo: salId.toString())
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          (mainServices.where((element) => element.id == mainServices)
              .toList())[0].subServicesModel.add(
              SubServicesModel.fromJson(doc.data()));

          print((mainServices.where((element) => element.id == mainServices)
              .toList())[0].subServicesModel[0].titlear);
          // subServicesModel.
          //  mainServices.add(MainServicesModel.fromJson(doc.data()));
        }
      });
      emit(ServicesLoaded());
    } catch (e) {
      log("getMainServices error :$e");
    }
  }
}
