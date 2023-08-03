import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/services/model/sub_services_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

part 'edit_service_state.dart';

class EditServiceCubit extends Cubit<EditServiceState> {
  EditServiceCubit() : super(EditServiceInitial());
  TextEditingController serviceNameEn = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController descriptionEn = TextEditingController();
  TextEditingController serviceNameAr = TextEditingController();
  TextEditingController descriptionAr = TextEditingController();
  var prefs = locator<SharedPrefServices>();

  editService({required String mainServiceID,required SubServicesModel subServicesModel}) async {
    String salId = await prefs.getString(salonId);
    SubServicesModel newsubServicesModel = SubServicesModel(
        price: price.text,
        createdat: subServicesModel.createdat,
        descriptionar: descriptionAr.text,
        descriptionen: descriptionEn.text,
        duration: duration.text,
        salonid: salId,
        mainserviceid: mainServiceID,
        titlear: serviceNameAr.text,
        titleen: serviceNameEn.text,
        id:subServicesModel.id);
    try {
      await FirebaseFirestore.instance
          .collection("sub-services")
          .doc(newsubServicesModel.id)
          .set(
            newsubServicesModel.toJson(),
        SetOptions(merge: true)
          );
    } catch (e) {
      log("addService $e");
    }
  }
}
