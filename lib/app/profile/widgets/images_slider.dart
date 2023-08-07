import 'package:carousel_slider/carousel_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/common_widgets/warning_alert.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImagesSlider extends StatefulWidget {
  List<dynamic>? imagesUrl;
  ImagesSlider({super.key, this.imagesUrl});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final indicatorController = PageController();
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height * 0.275,
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
                  child: Center(child: largeTitle("add_pic".tr(), ColorManager.greyColor100, false)).onTap(
                    (){}
                  ),
                )
                : CarouselSlider(
                carouselController: _controller,
                items: widget.imagesUrl?.map((e) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(e))
                    ),
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
        : Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return WarningAlert(
                        title: "",
                        supTitle: "warningImage".tr(),
                        action: () {});
                  },
                );
              },
              icon: Container(
                alignment: Alignment.center,
                // backgroundColor: ColorManager.primaryColor,
                // radius: context.height * 0.018,
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: ColorManager.greyColor.withOpacity(0.67),
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.close_sharp,
                  size: 18,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Container(
                alignment: Alignment.center,
                // backgroundColor: ColorManager.primaryColor,
                // radius: context.height * 0.018,
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: ColorManager.primaryColor,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.add,
                  size: 18,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}