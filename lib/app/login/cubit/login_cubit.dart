import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/layout/view/app_layout.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/strings/const_strings.dart';
import 'login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  var prefs = locator<SharedPrefServices>();

  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool showPass = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void changePasswordVisibility() {
    showPass = !showPass;
    emit(PasswordVisibilityState());
  }

  login({required BuildContext context}) async {
    try {
      emit(LoginLoadingState());
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userNameCtrl.text,
        password: passwordCtrl.text,
      );
      prefs.saveString(salonId, userCredential.user!.uid);
      prefs.saveBoolean(isUserLogin, true);
      print("uid======================> ${userCredential.user!.uid}");
      context.pushReplacement(AppLayout());
      emit(LoginInitialState());


    } on FirebaseAuthException catch (e) {
      emit(LoginErrorState());

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
