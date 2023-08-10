import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/reviews/model/review_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());
  var prefs = locator<SharedPrefServices>();
  List<ReviewModel> reviews = [];

  getReview() async {
    try {
      reviews.clear();
      emit(ReviewLoading());

      String docId = await prefs.getString(salonId);
      await FirebaseFirestore.instance
          .collection("reviews")
          .where("salon-id", isEqualTo: docId)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          reviews.add(ReviewModel.fromJson(doc.data()));
        }
        emit(ReviewSuccess());
      });
    } catch (e) {
      log("get Review error : $e");
    }
  }
}
