import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/spaces.dart';
import '../../../utils/theme/colors/color_manager.dart';

class ReviewTile extends StatelessWidget {
  String name;
  String date;
  String comment;
  String clientImage;


  ReviewTile({required this.name, required this.date, required this.comment,required this.clientImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: ColorManager.opacityBlackColor))),
      child: ListTile(
        title: Row(
          children: [
           clientImage.isEmpty? Image.asset("assets/images/profile.png", width: 40):
           Image.network(clientImage, width: 40)
            ,
            widthSpace(context.width * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                largeTitle(name, ColorManager.blackColor, false),
                mediumTitle(date, ColorManager.opacityBlackColor, false),
              ],
            ),
          ],
        ),
        subtitle: largeTitle(comment, ColorManager.blackColor, false)
      ),
    ) ;
  }
}
