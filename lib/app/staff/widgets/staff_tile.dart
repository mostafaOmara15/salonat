import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/loading_indicator.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/common_widgets/warning_alert.dart';
import '../../../utils/spaces.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../utils/theme/colors/color_manager.dart';


class StaffTile extends StatelessWidget {
  String name;
  String rateImage;
  double rate;
  Function() onDelete;
  String image;

  StaffTile({
    super.key,
    required this.name,
    required this.rateImage,
    required this.image,
    required this.rate,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.1,
          child: ListTile(
            title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return WarningAlert(
                            title: "removeStaff".tr(),
                            supTitle: "warningMember".tr(),
                            action: onDelete);
                      },
                    );
                  },
                  icon: Icon(
                    Icons.close,
                    size: context.width * 0.04,
                  ))
            ]),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               image.isEmpty?Image.asset( "assets/images/profile.png",height: context.height * 0.1,):
                CachedNetworkImage(
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: context.height * 0.1,
                      width: context.height * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill
                        )
                      ),
                    );
                  },
                  height: context.height * 0.1,
                  placeholder: (context, url) =>  centerIndicator(),
                  errorWidget: (context, url, error) => Image.asset( "assets/images/profile.png",height: context.height * 0.1,),
                  fit: BoxFit.fill,
                ),
                widthSpace(context.width * 0.07),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mediumBody(
                          "name".tr(), ColorManager.darkBrownColor, false),
                      mediumBody(
                          "rate".tr(), ColorManager.darkBrownColor, false),
                    ],
                  ),
                ),
                widthSpace(context.width * 0.05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mediumBody(name, ColorManager.darkBrownColor, true),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: rate,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ignoreGestures: true,
                            itemSize: context.width * 0.03,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          widthSpace(context.width * 0.02),
                          mediumBody(rate.toString(), ColorManager.darkBrownColor, false)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        heightSpace(context.height * 0.08)
      ],
    );
  }
}
