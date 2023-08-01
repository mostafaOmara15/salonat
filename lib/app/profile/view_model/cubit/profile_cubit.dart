import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/profile/model/salon_model.dart';
import 'package:salonat/app/profile/view_model/cubit/profile_states.dart';
import 'package:salonat/utils/strings/const_strings.dart';
import '../../../../services/locator.dart';
import '../../../../services/shared_pref.dart';
import '../../../../utils/firebase_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  FirebaseHelper firebase = FirebaseHelper();
  var prefs = locator<SharedPrefServices>();

  SalonModel salon = SalonModel();
  bool showReview = false;
  List reviews = [1,2,3,4];

  void showSalonInfo() {
    showReview = false;
    emit(ShowSalonInfoState());
  }
  void showSalonReview() {
    showReview = true;
    emit(ShowReviewState());
  }
  
  void getSalonData() async {
    emit(SalonLoadingState());
    String docId = await prefs.getString(salonId);
    await firebase.getData("salons", docId).then(
      (value){
        emit(SalonSuccessState());
        salon = SalonModel.fromJson(value);
        print(salon.about);
      }
    ).catchError((error){
      emit(SalonErrorState());
      print("???????????????????????????????????????????????????"+error.toString());
    });
  }
}