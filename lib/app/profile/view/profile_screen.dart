import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/app/profile/view_model/cubit/profile_cubit.dart';
import 'package:salonat/app/profile/view_model/cubit/profile_states.dart';
import 'package:salonat/app/profile/widgets/images_slider.dart';
import 'package:salonat/app/profile/widgets/profile_tile.dart';
import 'package:salonat/app/profile/widgets/salon_info.dart';
import 'package:salonat/app/profile/widgets/salon_reviews.dart';
import 'package:salonat/app/services/cubit/services_cubit.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/spaces.dart';
import '../../services/view/services_view.dart';
import '../../staff/view/staff_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileCubit profileCubit;

  @override
  void initState() {
    // TODO: implement initState
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
          return Center(
              child:
                  CircularProgressIndicator(color: ColorManager.primaryColor));
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
                    Row(
                      children: [
                        widthSpace(context.width * 0.025),
                        mediumTitle(profileCubit.salon.name?.toUpperCase(),
                            ColorManager.darkBrownColor, false),
                      ],
                    ),
                    Row(
                      children: [
                        widthSpace(context.width * 0.045),
                        Image.asset("assets/images/5_stars.png",
                            width: context.width * 0.15),
                        widthSpace(context.width * 0.03),
                        mediumTitle("5.0", ColorManager.blackColor, false),
                      ],
                    ),
                    heightSpace(context.height * 0.015),
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
                    Row(
                      children: [
                        widthSpace(context.width * 0.025),
                        mediumTitle(
                                "about".tr(),
                                profileCubit.showReview == false
                                    ? ColorManager.blackColor
                                    : ColorManager.darkGreyColor,
                                false)
                            .onTap(() {
                          profileCubit.showSalonInfo();
                        }),
                        SizedBox(
                          height: context.height * 0.03,
                          child: VerticalDivider(
                              color: ColorManager.greyColor,
                              thickness: 1.5,
                              indent: 5,
                              width: 15),
                        ),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.fraunces(
                                textStyle: TextStyle(
                                    color: profileCubit.showReview
                                        ? ColorManager.blackColor
                                        : ColorManager.darkGreyColor,
                                    letterSpacing: 0.5)),
                            children: <TextSpan>[
                              TextSpan(
                                text: "reviews".tr(),
                                style: GoogleFonts.fraunces(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.underline)),
                              ),
                              TextSpan(
                                text: ' ( 57 ${"comment".tr()})',
                                style: GoogleFonts.fraunces(
                                    textStyle: const TextStyle(fontSize: 10)),
                              )
                            ],
                          ),
                        ).onTap(() {
                          profileCubit.showSalonReview();
                        }),
                      ],
                    ),
                    heightSpace(context.height * 0.01),
                    profileCubit.showReview == false
                        ? SalonInfo(
                            openingtime: profileCubit.salon.openingtime,
                            info: profileCubit.salon.about,
                            address: profileCubit.salon.address,
                          )
                        : SalonReviews(reviews: profileCubit.reviews),
                    heightSpace(context.height * 0.01),
                    ProfileTile(
                        title: "services".tr(),
                        navigatedScreen:
                        BlocProvider<ServicesCubit>(
                          create:  (context) => ServicesCubit(),
                          child: const ServicesView(),
                        )
                      ),
                    ProfileTile(
                        title: "staff".tr(),
                        navigatedScreen: const StaffScreen()),
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
