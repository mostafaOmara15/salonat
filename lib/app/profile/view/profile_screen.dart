import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:salonat/app/profile/widgets/about_salon.dart';
import 'package:salonat/app/profile/widgets/images_slidder.dart';
import 'package:salonat/app/profile/widgets/profile_tile.dart';
import 'package:salonat/app/splash/view/splash_screen.dart';
import 'package:salonat/utils/common_widgets/logo_victor.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/spaces.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LogoVictor(size: 0.05),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.022),
        child: ListView(
          shrinkWrap: true,
            children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagesSlider(),
              Row(
                children: [
                  widthSpace(context.width * 0.025),
                  mediumTitle("NIRVANA", ColorManager.darkBrownColor, false),
                ],
              ),
              Row(
                children: [
                  widthSpace(context.width * 0.045),
                  Image.asset("assets/images/5_stars.png",
                      width: context.width * 0.15),
                  widthSpace(context.width * 0.03),
                  largeBody("5.0", ColorManager.blackColor),
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
                  mediumBody("98 ${"viewed your profile".tr()}",
                      ColorManager.darkGreyColor, false),
                ],
              ),
              heightSpace(context.height * 0.01),
              Row(
                textBaseline: TextBaseline.alphabetic,
                children: [
                  widthSpace(context.width * 0.025),
                  mediumTitle("about".tr(), ColorManager.blackColor, false),
                  SizedBox(
                    height: context.height * 0.03,
                    child: const VerticalDivider(
                        color: Colors.grey, thickness: 1, indent: 5, width: 15),
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.fraunces(
                          textStyle: TextStyle(
                              color: ColorManager.darkGreyColor,
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
                              textStyle: const TextStyle(
                            fontSize: 10,
                          )),
                        )
                      ],
                    ),
                  ).onTap(() {}),
                ],
              ),
              heightSpace(context.height * 0.01),
              aboutTheSalon(
                  'Nirvana Spa is a luxurious space with 6 treatment rooms for women and 4 for men, offering a full range of body treatments, facials and massages. At Nirvana Spa, we have a modern and fully equipped Fitness Centre, along with a Health Club that offers jacuzzi, sauna, steam.'),
              heightSpace(context.height * 0.01),
              Row(
                children: [
                  widthSpace(context.width * 0.025),
                  Icon(
                    Icons.location_on_outlined,
                    color: ColorManager.primaryColor,
                  ),
                  widthSpace(context.width * 0.01),
                  smallTitle("at Grand Hyatt al khobar hotel and residences",
                      ColorManager.darkBrownColor, false)
                ],
              ),
              heightSpace(context.height * 0.01),
              ProfileTile(
                title: "Open from  09:00am - 10:00pm ",
                withButton: true,
                navigatedScreen: const SplashScreen(),
              ),
              Divider(color: Colors.grey.shade300),
              ProfileTile(
                  title: "Services",
                  withButton: false,
                  navigatedScreen: const SplashScreen()),
              Divider(color: Colors.grey.shade300),
              ProfileTile(
                  title: "Staff",
                  withButton: false,
                  navigatedScreen: const SplashScreen()),
            ],
          ),
        ]),
      ),
    );
  }
}
