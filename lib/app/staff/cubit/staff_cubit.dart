import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/staff/model/staff_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';
part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  StaffCubit() : super(StaffInitial());
  List<StaffModel> staff = [];
  var prefs = locator<SharedPrefServices>();

  deleteStaff({required String staffId, required String staffImage}) async {
    try {
      await FirebaseFirestore.instance
          .collection("staff")
          .doc(staffId)
          .delete()
          .then((value) async {
        if (staffImage != '') {
          var imageRef = FirebaseStorage.instance.refFromURL(staffImage);
          await imageRef.delete();
        }
      }).then((value){
        emit(StaffError());
      });
    } catch (e) {
      log("deleteStaff $e");
    }
  }

  getStaff() async {
    double rate = 0;
    staff.clear();
    emit(StaffLoading());
    var docId = await prefs.getString(salonId);
    await FirebaseFirestore.instance
        .collection("staff")
        .where("salon-id", isEqualTo: docId)
        .get()
        .then((QuerySnapshot querySnapshot) async {
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        staff.add(StaffModel.fromJson(querySnapshot.docs[i].data()));
        await FirebaseFirestore.instance
            .collection("staff-rate")
            .where("staff-id", isEqualTo: staff[i].id)
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            rate += double.parse(doc['rate'].toString());
            staff[i].rate = (rate / (querySnapshot.docs.length));
          }
        });
        staff[i].subservices!.clear();
        for (var subServiceId in querySnapshot.docs[i]['sub-services']) {
          await FirebaseFirestore.instance
              .collection("sub-services")
              .doc(subServiceId.toString())
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            staff[i].subservices!.add(documentSnapshot.id);
          });
        }
        emit(StaffInitial());

      }
    });
  }
}