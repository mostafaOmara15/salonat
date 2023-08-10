import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/theme/colors/color_manager.dart';

class BookingDetailsView extends StatelessWidget {
  const BookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primaryColor,
          title: Text("more_details".tr(),
              style: const TextStyle(fontSize: 22, color: Colors.white)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: context.height / 80, horizontal: 8),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.blackColor),
                borderRadius: BorderRadius.circular(15),
              ),
              height: context.height / 5.5,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          mediumBody(
                            "client_name".tr(),
                            ColorManager.blackColor,
                            false,
                          ),
                          mediumBody(
                            "date".tr(),
                            ColorManager.blackColor,
                            false,
                          ),
                          mediumBody(
                            "time".tr(),
                            ColorManager.blackColor,
                            false,
                          ),
                          mediumBody(
                            "reservation_amount".tr(),
                            ColorManager.blackColor,
                            false,
                          ),
                          mediumBody(
                            "status".tr(),
                            ColorManager.blackColor,
                            false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          mediumBody(
                            "example",
                            ColorManager.greyColor200,
                            false,
                          ),
                          mediumBody(
                            "3/10/2023",
                            ColorManager.greyColor200,
                            false,
                          ),
                          mediumBody(
                            "11:00",
                            ColorManager.greyColor200,
                            false,
                          ),
                          mediumBody(
                            "SAR 1233",
                            ColorManager.greyColor200,
                            false,
                          ),
                          mediumBody(
                            "Pending",
                            ColorManager.greyColor200,
                            false,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                color: ColorManager.white200Color,
                border: Border.all(color: ColorManager.blackColor),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  heightSpace(10),
                  Center(
                    child:
                        mediumTitle("Service", ColorManager.greyColor200, true),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mediumBody(
                              "Nirvana Acne/Oily Skin 60",
                              ColorManager.blackColor,
                              false,
                            ),
                            mediumBody(
                              "SAR 630.00",
                              ColorManager.blackColor,
                              false,
                            ),
                          ],
                        ),
                        subtitle: mediumBody(
                          "Acne and oily skin can be addressed with deep-pore and deep-tissue cleansing to rid the skins excess oils and stimulate the circulation.",
                          ColorManager.greyColor200,
                          false,
                        ),
                      );
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                  ),
                  heightSpace(10),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: mediumBody(
                              "staff_name".tr(),
                              ColorManager.blackColor,
                              false,
                            ),
                          ),
                        ),
                        Expanded(
                          child: mediumBody(
                            "example",
                            ColorManager.greyColor200,
                            false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
