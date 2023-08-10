import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:salonat/app/location/view/location_view.dart';
import 'package:salonat/app/profile/widgets/images_slider.dart';
import 'package:salonat/app/profile/widgets/profile_tile.dart';
import 'package:salonat/app/reviews/view/reviews_view.dart';
import 'package:salonat/utils/common_widgets/loading_indicator.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/common_widgets/language_buttons.dart';
import '../../../utils/theme/colors/color_manager.dart';
import '../../about/view/about_view.dart';
import '../../opening/view/opening_screen.dart';
import '../../services/view/services_view.dart';
import '../../staff/view/staff_screen.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_states.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = ProfileCubit.get(context);
    profileCubit.getSalonData();
    profileCubit.getSalonRate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SalonLoadingState) {
          return centerIndicator();
        } else if (state is SalonErrorState) {
          return const Center(child: Text("Error"));
        } else {
          return Scaffold(
            appBar: AppBar(title: LogoVictor(size: 0.05), centerTitle: true),
            body: Padding(
              padding: EdgeInsets.all(context.width * 0.022),
              child: ListView(
                children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImagesSlider(
                      imagesUrl: profileCubit.salon.coverimages,
                      onTabAddPic: () async {
                        profileCubit.addCoverImage();
                      },
                    ),
                    heightSpace(context.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03, vertical: context.height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              mediumTitle(profileCubit.salon.name?.toUpperCase(),ColorManager.darkBrownColor,false),
                              Row(
                                children: [
                                  widthSpace(context.width * 0.035),
                                  RatingBar.builder(
                                    initialRating: profileCubit.rate,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    ignoreGestures: true,
                                    itemSize: context.width * 0.035,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {print(rating);},
                                  ),
                                  widthSpace(context.width * 0.03),
                                  mediumTitle(profileCubit.rate.toStringAsFixed(1), ColorManager.blackColor, false),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              LanguageButtons(
                                language: "En",
                                active: profileCubit.en,
                                onTap: () {profileCubit.changeToEnglish(context);},
                              ),
                              widthSpace(context.width * 0.03),
                              LanguageButtons(
                                language: "Ar",
                                active: profileCubit.ar,
                                onTap: () {
                                  profileCubit.changeToArabic(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    heightSpace(context.height * 0.02),
                    Row(
                      children: [
                        widthSpace(context.width * 0.025),
                        CircleAvatar(
                          backgroundColor: ColorManager.primaryColor,
                          radius: context.width * 0.025,
                          child: Image.asset("assets/icons/eye_icon.png",height: context.width * 0.025)
                        ),
                        widthSpace(context.width * 0.02),
                        smallTitle("${profileCubit.salon.views} ${"viewed your profile".tr()}",
                          ColorManager.darkGreyColor,
                          false
                        ),
                      ],
                    ),
                    heightSpace(context.height * 0.01),
                    ProfileTile(
                      title: "about".tr(),
                      onTap: () async {
                        var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutView(aboutEn: profileCubit.salon.aboutEn!, aboutAr:  profileCubit.salon.aboutAr!,)
                          )
                        );
                        if (result == true) {
                          await profileCubit.getSalonData();
                        }
                      },
                    ),
                    ProfileTile(
                      title: "addLocation".tr(),
                      onTap: () {context.push(const LocationView());},
                    ),
                    ProfileTile(
                      title: "openingTime".tr(),
                      onTap: () {context.push(OpeningTimeView(openingTimesList: profileCubit.salon.openingtime));},
                    ),
                    ProfileTile(
                      title: "services".tr(),
                      onTap:() {
                        context.push(const ServicesView());
                      },
                    ),
                    ProfileTile(
                      title: "staff".tr(),
                      onTap: () {
                        context.push(const StaffScreen());
                      },
                    ),
                    ProfileTile(
                      title: "reviews".tr(),
                      onTap: () {
                        context.push(const ReviewsView());
                      },
                    ),
                    ProfileTile(
                      title: "logout".tr(),
                      onTap: () {profileCubit.logOut(context);},
                    )
                  ]),
                ]
              ),
            ),
          );
        }
      },
    );
  }
}