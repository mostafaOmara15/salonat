import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/layout/view/app_layout.dart';
import 'package:salonat/app/login/widgets/login_dialog.dart';
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
  final _emailValidator = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool validateEmail(String email) {
    return _emailValidator.hasMatch(email);
  }
  FormFieldValidator<String>? passwordValidator() {
    validator(value) {
      if (value == null || value.isEmpty) {
        return tr('enter_password');
      }

      return null;
    }

    return validator;
  }

  FormFieldValidator<String>? emailValidator() {
    validator(value) {
      if (!validateEmail(value)) {
        return tr('enter_valid_mail');
      }
     else if (value == null || value.isEmpty) {
        return tr('enter_mail');
      }
      return null;
    }

    return validator;
  }
  void changePasswordVisibility() {
    showPass = !showPass;
    emit(PasswordVisibilityState());
  }

  login({required BuildContext context}) async {
    if(loginKey.currentState!.validate()) {
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
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return loginDialog(
                subTitle: "user_not_found".tr(),
              );
            },
          );
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return loginDialog(
                subTitle: "wrong_password".tr(),
              );
            },
          );
          print('Wrong password provided for that user.');
        }
        else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return loginDialog(
                subTitle: "try_again".tr(),
              );
            },
          );
        }
      }
    }
  }
}
