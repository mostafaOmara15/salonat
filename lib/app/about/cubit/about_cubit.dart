import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/about/cubit/about_states.dart';

class AboutCubit extends Cubit<AboutState> {

  AboutCubit() : super(AboutInitialState());
  static AboutCubit get(context) => BlocProvider.of(context);

  TextEditingController englishAbout = TextEditingController();
  TextEditingController arabicAbout = TextEditingController();
}