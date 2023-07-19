import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:salonat/app/profile/widgets/images_slidder.dart';
import 'package:salonat/app/profile/widgets/profile_tile.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/theme/colors/color_manager.dart';
import 'package:salonat/utils/spaces.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: const Text("Profile",
            style: TextStyle(fontSize: 36, color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.022),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImagesSlider(),
              Text("NIRVANA",
                  style: TextStyle(
                      color: ColorManager.darkBrown,
                      fontSize: 22,
                      fontWeight: FontWeight.w700)),
              Row(
                children: [
                  Image.asset(
                    "assets/images/5_stars.png",
                    width: context.width * 0.15,
                  ),
                  widthSpace(context.width * 0.04),
                  Text("5.0",
                      style: TextStyle(
                          color: ColorManager.darkBrown,
                          fontSize: 22,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              heightSpace(context.height * 0.015),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorManager.primaryColor,
                    radius: context.width * 0.03,
                    child: Icon(Icons.remove_red_eye_outlined,
                        color: ColorManager.darkBrown,
                        size: context.width * 0.04),
                  ),
                  widthSpace(context.width * 0.02),
                  Text("98 viewed your profile",
                      style: TextStyle(
                        color: ColorManager.subText,
                        fontSize: 16,
                      )),
                ],
              ),
              heightSpace(context.height * 0.015),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text("About  ", style: TextStyle(fontSize: 19)),
                  SizedBox(
                    height: context.height * 0.04,
                    child: const VerticalDivider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 5,
                      width: 15,
                    ),
                  ),
                  TextButton(
                      child: const Text("Reviews",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 19,
                              color: Colors.grey)),
                      onPressed: () {}),
                  const Text(
                    "(57 comment)",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: ColorManager.primaryColor,
                child: const ReadMoreText(
                  '"Nirvana Spa is a luxurious space with 6 treatment rooms for women and 4 for men, offering a full range of body treatments, facials and massages. At Nirvana Spa, we have a modern and fully equipped Fitness Centre, along with a Health Club that offers jacuzzi, sauna, steam Read more.',
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Read more',
                  trimExpandedText: ' Read less',
                  lessStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue),
                  moreStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ),
              heightSpace(context.height * 0.01),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: ColorManager.primaryColor,
                  ),
                  widthSpace(context.width * 0.01),
                  const Text(
                    "at Grand Hyatt al khobar hotel and residences",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              heightSpace(context.height * 0.01),
              ProfileTile(
                  title: "Open from  09:00am - 10:00pm ", withButton: true),
              Divider(color: Colors.grey.shade300),
              ProfileTile(title: "Services", withButton: false),
              Divider(color: Colors.grey.shade300),
              ProfileTile(title: "Staff", withButton: false),
            ],
          ),
        ),
      ),
    );
  }
}
