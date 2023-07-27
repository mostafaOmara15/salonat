import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salonat/app/profile/view_model/cubit/profile_cubit.dart';
import 'package:salonat/app/profile/view_model/cubit/profile_states.dart';
import 'package:salonat/app/profile/widgets/about_salon.dart';
import 'package:salonat/app/profile/widgets/images_slider.dart';
import 'package:salonat/app/profile/widgets/profile_tile.dart';
import 'package:salonat/app/profile/widgets/salon_info.dart';
import 'package:salonat/app/profile/widgets/salon_reviews.dart';
import 'package:salonat/app/splash/view/splash_screen.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/spaces.dart';
import '../../opening/view/opening_screen.dart';
import '../../services/view/services_screen.dart';
import '../widgets/review_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ProfileCubit profileCubit = ProfileCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: LogoVictor(size: 0.05), centerTitle: true),
            body: Padding(
              padding: EdgeInsets.all(context.width * 0.022),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ImagesSlider(),
                      Row(
                        children: [
                          widthSpace(context.width * 0.025),
                          mediumTitle("NIRVANA", ColorManager.darkBrownColor, false),
                        ],
                      ),
                      Row(
                        children: [
                          widthSpace(context.width * 0.045),
                          Image.asset("assets/images/5_stars.png", width: context.width * 0.15),
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
                            child: Image.asset("assets/icons/eye_icon.png", height: context.width * 0.025)
                          ),
                          widthSpace(context.width * 0.02),
                          smallTitle("98 ${"viewed your profile".tr()}", ColorManager.darkGreyColor, false),
                        ],
                      ),
                      heightSpace(context.height * 0.01),
                      Row(
                        children: [
                          widthSpace(context.width * 0.025),
                          mediumTitle(
                            "about".tr(),
                            profileCubit.showReview == false ? ColorManager.blackColor : ColorManager.darkGreyColor,
                            false
                          ).onTap((){profileCubit.showSalonInfo();}),
                          SizedBox(
                            height: context.height * 0.03,
                            child: VerticalDivider(color: ColorManager.greyColor, thickness: 1.5, indent: 5, width: 15),
                          ),

                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.fraunces(
                                textStyle: TextStyle(
                                  color: profileCubit.showReview ? ColorManager.blackColor : ColorManager.darkGreyColor,
                                  letterSpacing: 0.5
                                )
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "reviews".tr(),
                                  style: GoogleFonts.fraunces(
                                      textStyle: const TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                                ),
                                TextSpan(
                                  text: ' ( 57 ${"comment".tr()})',
                                  style: GoogleFonts.fraunces(textStyle: const TextStyle(fontSize: 10)),
                                )
                              ],
                            ),
                          ).onTap((){profileCubit.showSalonReview();}),
                        ],
                      ),

                      heightSpace(context.height * 0.01),
                      profileCubit.showReview == false
                        ? SalonInfo(
                          info: 'Nirvana Spa is a luxurious space with 6 treatment rooms for women and 4 for men, offering a full range of body treatments, facials and massages. At Nirvana Spa, we have a modern and fully equipped Fitness Centre, along with a Health Club that offers jacuzzi, sauna, steam.',
                          address: "at Grand Hyatt al khobar hotel and residences"
                        )
                        : SalonReviews(reviews: profileCubit.reviews),
                        heightSpace(context.height * 0.01),

                        ProfileTile(title: "services".tr(), navigatedScreen: ServicesScreen()),
                        ProfileTile(title: "staff".tr(), navigatedScreen: const SplashScreen()),
                    ],
                  ),
                ]
              ),
            ),
          );
        },
      ),
    );
  }
}