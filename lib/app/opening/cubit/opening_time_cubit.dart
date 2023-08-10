import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../services/locator.dart';
import '../../../services/shared_pref.dart';
import '../../../utils/strings/const_strings.dart';
import '../../profile/model/salon_model.dart';
import 'opening_time_states.dart';

class OpeningTimeCubit extends Cubit<OpeningTimeStates> {
  OpeningTimeCubit() : super(OpeningTimeInitState());

  static OpeningTimeCubit get(context) => BlocProvider.of(context);

  var prefs = locator<SharedPrefServices>();

  List<OpeningTime>? times;

  List<bool> isSelected = [true, false, false, false, false, false, false];

  String? currentDay;
  int currentIndex = 0;
  TextEditingController timeFrom = TextEditingController();
  TextEditingController timeTo = TextEditingController();
  bool timeUpdated = false;
  bool? isClose;

  void changeTheDay(int index){

    times?[currentIndex].open = timeFrom.text;
    times?[currentIndex].close = timeTo.text;
    // times?[currentIndex].isClosed = isClose;
    currentIndex = index;
    currentDay = times![index].day!;
    timeFrom.text = times![index].open!;
    timeTo.text = times![index].close!;
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = true;
      } else {
        isSelected[i] = false;
      }
    }
    emit(DaySelectionState());
  }

  void checkClose(bool value){
    times?[currentIndex].isClosed = value;
    emit(ClosingSelectionState());
  }

  Future<void> updateOpeningTime() async {
    emit(UpdateOpeningTimeLoadingState());
    times?[currentIndex].open = timeFrom.text;
    times?[currentIndex].close = timeTo.text;
    List<Map<String, dynamic>> updatedTime = [];
    for(int i = 0 ; i < times!.length ; i++){
      updatedTime.add(times![i].toJson());
    }
    String salId = await prefs.getString(salonId);
    print(updatedTime);
    await FirebaseFirestore.instance
        .collection("salons")
        .doc(salId)
        .set({"opening-time" : updatedTime}, SetOptions(merge: true)
    ).then((value){
      emit(UpdateOpeningTimeSuccessState());
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
      emit(UpdateOpeningTimeErrorState());
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
