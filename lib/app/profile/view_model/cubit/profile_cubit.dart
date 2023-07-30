import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/profile/view_model/cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  bool showReview = false;
  List reviews = [1,2,3,4];
  static ProfileCubit get(context) => BlocProvider.of(context);

  void showSalonInfo() {
    showReview = false;
    emit(ShowSalonInfoState());
  }
  void showSalonReview() {
    showReview = true;
    emit(ShowReviewState());
  }
}