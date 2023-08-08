import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:salonat/app/login/view/login_view.dart';
import 'package:salonat/app/profile/cubit/profile_states.dart';
import 'package:salonat/app/profile/model/salon_model.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/strings/const_strings.dart';
import '../../../../services/locator.dart';
import '../../../../services/shared_pref.dart';
import '../../../services/firebase_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  FirebaseHelper firebase = FirebaseHelper();
  var prefs = locator<SharedPrefServices>();

  SalonModel salon = SalonModel();
  bool showReview = false;
  List reviews = [1,2,3,4];

  bool en = true;
  bool ar = false;
  String currentLang = "en";

  void changeToEnglish() {
    en = true;
    ar = false;
    emit(ChangeLanguageState());
  }
  void changeToArabic() {
    en = false;
    ar = true;
    emit(ChangeLanguageState());
  }


  void getSalonData() async {
    emit(SalonLoadingState());
    String docId = await prefs.getString(salonId);
    await firebase.getData("salons", docId).then(
      (value){
        emit(SalonSuccessState());
        salon = SalonModel.fromJson(value);
      }
    ).catchError((error){
      emit(SalonErrorState());
      print(error.toString());
    });
  }

  void logOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut().then((value)
          {
            emit(LogOutState());
            context.pushAndRemoveUntil(const LoginView());
            prefs.clearPrefs();
          });

      PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const LoginView(),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino);
    } catch (e) {
      print('Error occurred while signing out: $e');
    }
  }


}