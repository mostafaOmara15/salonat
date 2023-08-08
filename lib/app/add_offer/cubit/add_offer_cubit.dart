import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

part 'add_offer_state.dart';

class AddOfferCubit extends Cubit<OffDetailsState> {
  AddOfferCubit() : super(AddOfferInitial());
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController priceBeforeController = TextEditingController();
  TextEditingController priceAfterController = TextEditingController();
  TextEditingController enDescription = TextEditingController();
  TextEditingController arDescription = TextEditingController();


  final picker = ImagePicker();
  File? image;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
        image = File(pickedFile.path);
        emit(AddOfferInitial());
    }
  }

  addOffer()async{
    //
    // await FirebaseFirestore.instance.collection("offers").add();
  }
}
