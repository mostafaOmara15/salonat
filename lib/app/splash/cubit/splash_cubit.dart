import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:salonat/app/layout/view/app_layout.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/strings/const_strings.dart';

import '../../login/view/login_view.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  var prefs = locator<SharedPrefServices>();
  checkLogin({required BuildContext context}) async {
    bool isLogin=await prefs.getBoolean(isUserLogin);
      if(isLogin){
        Timer(const Duration(seconds: 3), () => context.pushReplacement(AppLayout()));
      }
      else{
        Timer(const Duration(seconds: 3), () => context.pushReplacement(const LoginView()));
      }

  }

}
