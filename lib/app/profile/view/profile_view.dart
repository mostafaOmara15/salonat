import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/about/cubit/about_cubit.dart';
import 'package:salonat/app/profile/widgets/images_slider.dart';
import 'package:salonat/app/profile/widgets/profile_tile.dart';
import 'package:salonat/app/reviews/view/reviews_view.dart';
import 'package:salonat/app/services/cubit/services_cubit.dart';
import 'package:salonat/utils/common_widgets/loading_indecator.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/common_widgets/language_buttons.dart';
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
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImagesSlider(imagesUrl: profileCubit.salon.coverimages),
                    heightSpace(context.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            mediumTitle(profileCubit.salon.name?.toUpperCase(),ColorManager.darkBrownColor, false),
                            Row(
                              children: [
                                widthSpace(context.width * 0.045),
                                Image.asset("assets/images/5_stars.png",
                                    width: context.width * 0.15),
                                widthSpace(context.width * 0.03),
                                mediumTitle("5.0", ColorManager.blackColor, false),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            LanguageButtons(
                              language: "En",
                              active: profileCubit.en,
                              onTap: () {
                                context.setLocale(const Locale('en'));
                                profileCubit.changeToEnglish();
                              },
                            ),
                            widthSpace(context.width * 0.03),
                            LanguageButtons(
                              language: "Ar",
                              active: profileCubit.ar,
                              onTap: () {
                                context.setLocale(const Locale('ar'));
                                profileCubit.changeToArabic();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSpace(context.height * 0.02),
                    Row(
                      children: [
                        widthSpace(context.width * 0.025),
                        CircleAvatar(
                            backgroundColor: ColorManager.primaryColor,
                            radius: context.width * 0.025,
                            child: Image.asset("assets/icons/eye_icon.png",
                                height: context.width * 0.025)),
                        widthSpace(context.width * 0.02),
                        smallTitle(
                            "${profileCubit.salon.views} ${"viewed your profile".tr()}",
                            ColorManager.darkGreyColor,
                            false),
                      ],
                    ),
                    heightSpace(context.height * 0.01),
                    ProfileTile(
                        title: "about".tr(),
                        navigatedScreen: BlocProvider(
                          create: (context) => AboutCubit(),
                            child: const AboutView()),
                      withIcon: true,
                    ),
                    ProfileTile(
                        title: "services".tr(),
                        navigatedScreen:
                        BlocProvider<ServicesCubit>(
                          create:  (context) => ServicesCubit(),
                          child: const ServicesView(),
                        ),
                      withIcon: true,
                    ),
                    ProfileTile(
                        title: "staff".tr(),
                        navigatedScreen: const StaffScreen(),
                        withIcon: true,
                    ),
                    ProfileTile(
                        title: "reviews".tr(),
                        navigatedScreen: OpeningTimeView(openingtime: profileCubit.salon.openingtime),
                        withIcon: true,
                    ),
                    ProfileTile(
                        title: "logout".tr(),
                        onTap: () {
                          profileCubit.logOut(context);
                        },
                        withIcon: false
                    )
                  ],
                ),
              ]),
            ),
          );
        }
      },
    );
  }
}