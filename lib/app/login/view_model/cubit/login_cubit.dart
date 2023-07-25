import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  bool showPass = true;

  void changePasswordVisibility() {
    showPass = !showPass;
    emit(PasswordVisibilityState());
  }
}
