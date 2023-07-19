import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImagesSlider extends StatefulWidget {
  ImagesSlider({super.key});

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
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height * 0.25,
      child: Stack(children: [
        SizedBox(
          width: context.width,
          height: context.height * 0.235,
          child: CarouselSlider(
            carouselController: controller,
            items: imagesUrl.map((e) {
              return Image.network(e, fit: BoxFit.fitWidth);
            }).toList(),
            options: CarouselOptions(
                initialPage: 0,
                viewportFraction: 1,
                onPageChanged: (val, _) {
                  setState(() {
                    print("index $val");
                    if (indicatorController.hasClients) {
                      indicatorController.jumpToPage(val);
                    }
                  });
                }),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SmoothPageIndicator(
            controller: indicatorController,
            count: imagesUrl.length,
            onDotClicked: (index) {
              setState(() {
                controller.jumpToPage(index);
              });
              if (indicatorController.hasClients) {
                setState(() {
                  indicatorController.jumpToPage(index);
                  print(index);
                });
              }
            },
            effect: SlideEffect(
                spacing: 5,
                radius: 5,
                dotWidth: 24.0,
                dotHeight: 3,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1,
                dotColor: Colors.grey,
                activeDotColor: ColorManager.primaryColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: context.height * 0.015,
                    child: Icon(Icons.close, size: context.height * 0.02)
                        .onTap(() {})),
                CircleAvatar(
                  backgroundColor: ColorManager.primaryColor,
                  radius: context.height * 0.022,
                  child: const Icon(Icons.add).onTap(() {}),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
