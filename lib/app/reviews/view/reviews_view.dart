import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/reviews/widget/review_tile.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('reviews'.tr().toUpperCase())),
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.025),
        child: ListView.builder(
          itemCount:  3,
          itemBuilder: (context, index) {
            return ReviewTile(name: "Anas", date: "July 2023", comment: "Amazing !");
          },
        )
      ),
    );
  }
}
