import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/spaces.dart';
import '../../../utils/theme/colors/color_manager.dart';
import '../../booking_details/view/booking_details_view.dart';

class BookHistoryCard extends StatelessWidget {
  const BookHistoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04,
          vertical: context.height * 0.01),
      child: Container(
        width: context.width,
        height: context.height * 0.18,
        padding: EdgeInsets.only(
            right: context.width * 0.04,
            left: context.width * 0.04,
            top: context.height * 0.01,
            bottom: context.width * 0.003),
        margin: EdgeInsets.all(context.width * 0.01),
        decoration: BoxDecoration(
            border:
            Border.all(color: const Color(0xffA9A2A2)),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    mediumBody("clientName".tr(),
                        ColorManager.greyColor200, false),
                    mediumBody("phoneNumber".tr(),
                        ColorManager.greyColor200, false),
                    mediumBody("time".tr(),
                        ColorManager.greyColor200, false),
                    mediumBody("reservationAmount".tr(),ColorManager.greyColor200, false),
                    mediumBody("status".tr(),ColorManager.greyColor200, false),
                  ],
                ),
                widthSpace(context.width * 0.15),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    mediumBody("Example",
                        ColorManager.greyColor200, false),
                    mediumBody("01111111111",
                        ColorManager.greyColor200, false),
                    mediumBody("11:00",
                        ColorManager.greyColor200, false),
                    mediumBody("SAR 1233",
                        ColorManager.greyColor200, false),
                    mediumBody("Open",
                        ColorManager.greyColor200, false),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                mediumBody("moreDetails".tr(),
                    ColorManager.blackColor, false)
                    .onTap(() {
                  context.push(const BookingDetailsView());
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
