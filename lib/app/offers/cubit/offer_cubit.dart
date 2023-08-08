import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/offers/model/offer_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

part 'offer_state.dart';

class OfferCubit extends Cubit<OfferState> {
  OfferCubit() : super(OfferInitial());
  var prefs = locator<SharedPrefServices>();
  List<OfferModel> offers = [];
  TextEditingController offerDesc1 = TextEditingController();
  TextEditingController offerAmount = TextEditingController();

  getOffer() async {
    emit(OfferLoading());
    String docId = await prefs.getString(salonId);
    try {
      await FirebaseFirestore.instance
          .collection("offers")
          .where("salon-id", isEqualTo: docId)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          offers.add(OfferModel.fromJson(doc.data()));
        }
        emit(OfferDataLoaded());

      });
    } catch (e) {
      log("get Offer error $e");
    }
  }
}
