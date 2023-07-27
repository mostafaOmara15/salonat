import 'package:carousel_slider/carousel_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/dialog_button.dart';
import 'package:salonat/utils/common_widgets/texts.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImagesSlider extends StatefulWidget {
  const ImagesSlider({super.key});

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {

  List<String> imagesUrl = [
    "https://www.rd.com/wp-content/uploads/2020/06/GettyImages-1139132195.jpg?resize=2048,1367",
    "https://cdn.concreteplayground.com/content/uploads/2022/04/Telleish-Pic-1.jpg-Salon-1920x1080.jpeg",
    "https://res.cloudinary.com/conferences-and-exhibitions-pvt-ltd/image/upload/v1655285681/Salon-Management/2022/June/Men/Lead_e305ap.jpg"
  ];
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
                items: imagesUrl.map((e) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(e))
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
            AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: imagesUrl.length,
              effect: SlideEffect(
                spacing: 3,
                radius: 5,
                dotWidth: context.width * 0.05,
                dotHeight: 3,
                paintStyle: PaintingStyle.fill,
                dotColor: ColorManager.greyColor,
                activeDotColor: ColorManager.primaryColor
              ),
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
                    return AlertDialog(
                      backgroundColor: ColorManager.whiteColor,
                      elevation: 0,
                      insetPadding: EdgeInsets.only(bottom: context.height * 0.35),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      titlePadding: const EdgeInsets.all(0),
                      actionsPadding: const EdgeInsets.all(0),
                      title: const Text(""),
                      content: Container(
                        height: context.height * 0.1,
                        width: context.width * 0.6,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              mediumTitle("warningImage".tr(), ColorManager.buttonColor, false),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        Column(
                          children: [
                            const Divider(thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AlertButton(title: "cancel".tr()),
                                AlertButton(title: "delete".tr()),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
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
                child: const Icon(Icons.close_sharp,size: 18,),
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
                decoration: BoxDecoration(color:ColorManager.primaryColor, borderRadius: BorderRadius.circular(50)),
                child: const Icon(Icons.add,size: 18,),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}