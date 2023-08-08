import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/common_widgets/warning_alert.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../utils/strings/const_strings.dart';

class ImagesSlider extends StatefulWidget {
  List<dynamic>? imagesUrl;
  Function? onTabAddPic;
  dynamic Function() onTabDeletePic;

  ImagesSlider(
      {super.key,
      this.imagesUrl,
      required this.onTabAddPic,
      required this.onTabDeletePic});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final indicatorController = PageController();
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;
  var prefs = locator<SharedPrefServices>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height * 0.28,
      child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.width,
              height: context.height * 0.26,
              child: widget.imagesUrl!.isEmpty
                  ? Container(
                      width: context.width,
                      height: context.height * 0.26,
                      color: ColorManager.greyColor,
                      child: Center(
                              child: largeTitle("add_pic".tr(),
                                  ColorManager.greyColor100, false))
                          .onTap(widget.onTabAddPic),
                    )
                  : CarouselSlider(
                      carouselController: _controller,
                      items: widget.imagesUrl?.map((e) {
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: NetworkImage(e))),
                        );
                      }).toList(),
                      options: CarouselOptions(
                          autoPlay: true,
                          initialPage: 0,
                          viewportFraction: 1,
                          onPageChanged: (index, _) {
                            setState(() {
                              _currentIndex = index;
                            });
                          }),
                    ),
            ),
            widget.imagesUrl!.isEmpty
                ? const SizedBox()
                : AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: widget.imagesUrl!.length,
                    effect: SlideEffect(
                        spacing: 3,
                        radius: 5,
                        dotWidth: context.width * 0.05,
                        dotHeight: 3,
                        paintStyle: PaintingStyle.fill,
                        dotColor: ColorManager.greyColor,
                        activeDotColor: ColorManager.primaryColor),
                  )
          ],
        ),
        widget.imagesUrl!.isEmpty
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(
                    right: context.width * 0.03, top: context.height * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/icons/delete.png",
                      width: context.width * 0.06,
                    ).onTap(() {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return WarningAlert(
                              title: "",
                              supTitle: "warningImage".tr(),
                              action: () async {
                                String docId = await prefs.getString(salonId);

                                await FirebaseFirestore.instance
                                    .collection("salons")
                                    .doc(docId)
                                    .set({
                                  "cover-images": FieldValue.arrayRemove(
                                      [widget.imagesUrl![_currentIndex]])
                                }, SetOptions(merge: true));
                                widget.imagesUrl!.removeAt(_currentIndex);
                                setState(() {

                                });
                              });
                        },
                      );
                    }),
                    Image.asset(
                      "assets/icons/plus_icon.png",
                      width: context.width * 0.08,
                    ).onTap(widget.onTabAddPic),
                  ],
                ),
              )
      ]),
    );
  }
}
