import 'package:flutter/material.dart';
import 'package:salonat/app/profile/widgets/review_tile.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class SalonReviews extends StatelessWidget {
  List reviews;
  SalonReviews({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.opacityPrimaryColor,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: context.height * 0.4, minHeight: context.height * 0.1),
        child: reviews.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: reviews.length,
            itemBuilder: (BuildContext context, int index) {
              return ReviewTile(name: "Anas", date: "July 2023", comment: "Amazing",);
            }
          )
        : Center(child: mediumTitle("No Review", ColorManager.blackColor, false))
      ),
    );
  }
}