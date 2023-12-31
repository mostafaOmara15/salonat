import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/theme/colors/color_manager.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  List notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryColor,
        title: Text("notifications".tr(),
            style: const TextStyle(fontSize: 22, color: Colors.white)),
        centerTitle: true,
      ),
      body: notifications.isNotEmpty
        ? ListView.builder(
        padding: EdgeInsets.all(context.width * 0.03),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListView(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child:
                          mediumTitle("Today", ColorManager.greyColor, false),
                    ),
                  ],
                ),
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Container(

                            decoration: BoxDecoration(
                              color: ColorManager.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                              height: context.height /12,
                              width: context.width / 7,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),

                              child: Image.asset(
                                "assets/images/date-reminder-icon.png",
                                fit: BoxFit.contain,
                              )),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  largeBody(
                                      "New booking", ColorManager.blackColor, false),
                                  heightSpace(8),
                                  largeBody(
                                      "(Client name) is booked in 2/22/2023 at 11:00 am",
                                      ColorManager.greyColor, false)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: 3,
                )
              ],
            );
          },
          itemCount: 2)
        : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/images/No-Notification.json',
                width: context.height * 0.4,
                height: context.height * 0.4,
                fit: BoxFit.fill,
              ),
              largeTitle("noNotifications".tr(), ColorManager.primaryColor, false)
            ],
          ),
        )
    );
  }
}
