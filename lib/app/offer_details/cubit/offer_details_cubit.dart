import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

part 'offer_details_state.dart';

class OfferDetailsCubit extends Cubit<OffDetailsState> {
  OfferDetailsCubit() : super(OffDetailsInitial());
  TextEditingController offerDescription = TextEditingController();
  TextEditingController offerAmount = TextEditingController();
  TextEditingController offerDescription2 = TextEditingController();
  final picker = ImagePicker();
  File? image;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
        image = File(pickedFile.path);
        emit(OffDetailsInitial());
    }
  }
}
