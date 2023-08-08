import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salonat/app/offers/model/offer_model.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/strings/const_strings.dart';

part 'add_offer_state.dart';

class AddOfferCubit extends Cubit<OffDetailsState> {
  AddOfferCubit() : super(AddOfferInitial());
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController priceBeforeController = TextEditingController();
  TextEditingController priceAfterController = TextEditingController();
  TextEditingController enDescription = TextEditingController();
  TextEditingController arDescription = TextEditingController();
  var prefs = locator<SharedPrefServices>();
  String?offerImageUrl;

  final picker = ImagePicker();
  final GlobalKey<FormState> offerKey = GlobalKey<FormState>();
  File? image;

  FormFieldValidator<String>? validator() {
    FormFieldValidator<String>? validator = (value) {
      if (value == null || value.isEmpty) {

        return tr('emptyWarning');
      }
      return null;
    };
    return validator;
  }
  //
  // FormFieldValidator<String>? validator() {
  //   validator(value) {
  //     if (value == null || value.isEmpty) {
  //       return tr('emptyWarning');
  //     }
  //     return null;
  //   }
  //   return validator;
  // }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      var refStorage = FirebaseStorage.instance
          .ref("Offers/${DateTime
          .now()
          .millisecondsSinceEpoch}");
      await refStorage.putFile(image!);
      offerImageUrl = await refStorage.getDownloadURL();
      emit(AddOfferInitial());
    }
  }

  addOffer() async {
    String salonRef = await prefs.getString(salonId);
    OfferModel offerModel = OfferModel(
      id: DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(),
      salonid: salonRef,
      descriptionen: enDescription.text,
      descriptionar: arDescription.text,
      startdate: startDateController.text,
      enddate: endDateController.text,
      image: offerImageUrl,
      priceafter: priceAfterController.text,
      pricebefore: priceBeforeController.text,
    );
    try {
      await FirebaseFirestore.instance
          .collection("offers")
          .doc(offerModel.id)
          .set(offerModel.toJson());
    }
    catch (e) {
      log("add Offer error $e");
    }
  }
}
