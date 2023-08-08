import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salonat/app/about/cubit/about_states.dart';
import '../../../services/locator.dart';
import '../../../services/shared_pref.dart';
import '../../../utils/strings/const_strings.dart';

class AboutCubit extends Cubit<AboutState> {

  AboutCubit() : super(AboutInitialState());
  static AboutCubit get(context) => BlocProvider.of(context);

  var prefs = locator<SharedPrefServices>();

  TextEditingController englishAbout = TextEditingController();
  TextEditingController arabicAbout = TextEditingController();

  Future<void> updateAbout() async {
    emit(UpdateAboutLoadingState());
    String docId = await prefs.getString(salonId);
    await FirebaseFirestore.instance.collection('salons').doc(docId)
      .set({"about-ar" : arabicAbout.text, "about-en" : englishAbout.text}, SetOptions(merge: true)
    ).then((value) {
      emit(UpdateAboutSuccessState());
      Fluttertoast.showToast(
          msg: "aboutUpdateMessage".tr(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }).catchError((error){
      emit(UpdateAboutErrorState());
      print(error.toString());
      Fluttertoast.showToast(
          msg: "errorAboutUpdateMessage".tr(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
  }
}