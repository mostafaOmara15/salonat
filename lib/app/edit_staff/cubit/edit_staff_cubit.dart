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

part 'edit_staff_state.dart';

class EditStaffCubit extends Cubit<EditStaffState> {
  EditStaffCubit() : super(EditStaffInitial());
  List<SubServicesModel> subServices = [];
  List<String> finalSelectedSubServices = [];
  var prefs = locator<SharedPrefServices>();
  TextEditingController nameCtrl = TextEditingController();
  String? staffImageUrl;
  final picker = ImagePicker();
  File? image;

  checkSelectedSubService({required List<String> selectedSubServices}) {
     finalSelectedSubServices = selectedSubServices;
    for (var id in selectedSubServices) {
      subServices.where((element) => element.id == id).toList()[0].isSelected =
          true;
    }
  }

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
    if (finalSelectedSubServices.contains(subServiceId)) {
      finalSelectedSubServices.remove(subServiceId);
      emit(SelectSubService());
    } else {
      finalSelectedSubServices.add(subServiceId);
      emit(SelectSubService());
    }
  }

  getSubServices({required List<String> selectedSubServices}) async {
    String docId = await prefs.getString(salonId);
    try {
      emit(Loading());
      await FirebaseFirestore.instance
          .collection("sub-services")
          .where("salon-id", isEqualTo: docId)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          subServices.add(SubServicesModel.fromJson(doc.data()));
        }
      }).then(
        (value) async {
          await checkSelectedSubService(
              selectedSubServices: selectedSubServices);
          emit(SuccessSubServices());
        },
      );
    } catch (e) {
      emit(ErrorSubServices());
      log("getSubServices error $e");
    }
  }

  editStaff({required StaffModel staffModel}) async {
    print(finalSelectedSubServices.toSet());
    // StaffModel staff = StaffModel(
    //   id: staffModel.id,
    //   createdat: staffModel.createdat,
    //   image: staffImageUrl ?? staffModel.image,
    //   name: nameCtrl.text,
    //   salonid: staffModel.id,
    //   subservices: finalSelectedSubServices,
    // );
    try {
      await FirebaseFirestore.instance
          .collection("staff")
          .doc(staffModel.id)
          .set({
              "image":staffImageUrl ?? staffModel.image,
                "name":nameCtrl.text,
              "sub-services":finalSelectedSubServices.toSet()


      }, SetOptions(merge: true));
    } catch (e) {
      log("add Staff error $e");
    }
  }
}
