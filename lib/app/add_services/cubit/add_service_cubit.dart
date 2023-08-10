import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/services/model/sub_services_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  AddServiceCubit() : super(AddServiceInitial());
  TextEditingController serviceNameEn = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController descriptionEn = TextEditingController();
  TextEditingController serviceNameAr = TextEditingController();
  TextEditingController descriptionAr = TextEditingController();
  var prefs = locator<SharedPrefServices>();
  var formKey = GlobalKey<FormState>();


  addService({required String mainServiceID}) async {
    String salId = await prefs.getString(salonId);
    SubServicesModel subServicesModel = SubServicesModel(
        price: price.text,
        createdat: DateTime.now().toIso8601String().toString(),
        descriptionar: descriptionAr.text,
        descriptionen: descriptionEn.text,
        duration: duration.text,
        salonid: salId,
        mainserviceid: mainServiceID,
        titlear: serviceNameAr.text,
        titleen: serviceNameEn.text,
        id: DateTime.now().millisecondsSinceEpoch.toString());
    try {
      await FirebaseFirestore.instance
          .collection("sub-services")
          .doc(subServicesModel.id)
          .set(
            subServicesModel.toJson(),
          )
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("main-services")
            .doc(mainServiceID)
            .set(
          {
            "salons-id": FieldValue.arrayUnion([salId])
          },
          SetOptions(merge: true),
        );
      });
    } catch (e) {
      log("addService $e");
    }
  }
}
