import 'package:carousel_slider/carousel_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/services/locator.dart';
import 'package:salonat/services/shared_pref.dart';
import 'package:salonat/utils/common_widgets/dialog_button.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/common_widgets/warning_alert.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
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
  // List<String> imagesUrl = [
  //   "https://www.rd.com/wp-content/uploads/2020/06/GettyImages-1139132195.jpg?resize=2048,1367",
  //   "https://cdn.concreteplayground.com/content/uploads/2022/04/Telleish-Pic-1.jpg-Salon-1920x1080.jpeg",
  //   "https://res.cloudinary.com/conferences-and-exhibitions-pvt-ltd/image/upload/v1655285681/Salon-Management/2022/June/Men/Lead_e305ap.jpg"
  // ];
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
              child: CarouselSlider(
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
            AnimatedSmoothIndicator(
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
            ),
          ],
        ),
        Column(
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
              onPressed: () {
                /// Todo clear this
                var prefs = locator<SharedPrefServices>();
                prefs.clearPrefs();
              },
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
        ),
      ]),
    );
  }
}
