import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/services/model/sub_services_model.dart';
import 'package:salonat/app/staff/model/staff_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

part 'add_staff_state.dart';

class AddStaffCubit extends Cubit<AddStaffState> {
  AddStaffCubit() : super(AddStaffInitial());
  List<SubServicesModel> subServices = [];
  List<String> selectedSubServices = [];
  var prefs = locator<SharedPrefServices>();
  TextEditingController nameCtrl = TextEditingController();
  String? staffImageUrl;
  final picker = ImagePicker();
  File? image;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      emit(ImageUploadLoading());

      image = File(pickedFile.path);
      var refStorage = FirebaseStorage.instance
          .ref("Staff/${DateTime.now().millisecondsSinceEpoch}");
      await refStorage.putFile(image!);
      staffImageUrl = await refStorage.getDownloadURL();
      emit(ImageUploaded());
    }
  }

  void selectSubServices({required String subServiceId}) {
    if (selectedSubServices.contains(subServiceId)) {
      selectedSubServices.remove(subServiceId);
      emit(SelectSubService());
    } else {
      selectedSubServices.add(subServiceId);
      emit(SelectSubService());
    }
  }

  getSubServices() async {
    subServices.clear();
    String docId = await prefs.getString(salonId);
    try {
      emit(LoadingSubServices());
      await FirebaseFirestore.instance
          .collection("sub-services")
          .where("salon-id", isEqualTo: docId)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          subServices.add(SubServicesModel.fromJson(doc.data()));
        }
      }).then(
        (value) {
          emit(SuccessSubServices());
        },
      );
    } catch (e) {
      emit(ErrorSubServices());
      log("getSubServices error $e");
    }
  }

  addStaff() async {
    String id = await prefs.getString(salonId);
    StaffModel staff = StaffModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      createdat: DateTime.now().toIso8601String(),
      image: staffImageUrl ?? "",
      name: nameCtrl.text,
      salonid: id,
      subservices: selectedSubServices,
    );
    try {
      await FirebaseFirestore.instance
          .collection("staff")
          .doc(staff.id)
          .set(staff.toJson());
    } catch (e) {
      log("add Staff error $e");
    }
  }
}
