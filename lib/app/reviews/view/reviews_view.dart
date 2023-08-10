import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/reviews/cubit/review_cubit.dart';
import 'package:salonat/app/reviews/widget/review_tile.dart';
import 'package:salonat/utils/common_widgets/loading_indicator.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';

class ReviewsView extends StatefulWidget {
  const ReviewsView({super.key});

  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  late ReviewCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<ReviewCubit>(context);
    cubit.getReview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('reviews'.tr().toUpperCase())),
      body: BlocBuilder<ReviewCubit, ReviewState>(builder: (context, state) {
        if (state is ReviewSuccess) {
          return Padding(
              padding: EdgeInsets.all(context.width * 0.025),
              child: ListView.builder(
                itemCount: cubit.reviews.length,
                itemBuilder: (context, index) {
                  return ReviewTile(
                    name: cubit.reviews[index].clientname!,
                    date: cubit.reviews[index].createddate!,
                    comment: cubit.reviews[index].comment!,
                    clientImage: cubit.reviews[index].clientimage!,
                  );
                },
              ));
        } else {
          return centerIndicator();
        }
      }),
    );
  }
}
