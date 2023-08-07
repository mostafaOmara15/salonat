import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/profile/model/salon_model.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';
import '../widgets/time_field.dart';

class OpeningTimeView extends StatefulWidget {
  List<OpeningTime>? openingtime;

  OpeningTimeView({super.key, required this.openingtime});

  List<bool> isSelected = [true, false, false, false, false, false, false];

  @override
  State<OpeningTimeView> createState() => _OpeningTimeViewState();
}

class _OpeningTimeViewState extends State<OpeningTimeView> {
  String? currentDay;

  TimeOfDay fromSelectedTime = const TimeOfDay(hour: 09, minute: 0);
  TimeOfDay toSelectedTime = const TimeOfDay(hour: 09, minute: 0);
  bool timeUpdated = false;
  bool isClose = false;

@override
  void initState() {
  currentDay = widget.openingtime?[0].day.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('openingTime'.tr())),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: context.height * 0.07,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.openingtime!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width * 0.03),
                        child: TextButton(
                            child: Text(widget.openingtime![index].day!.tr(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: widget.isSelected[index]
                                        ? Colors.grey
                                        : Colors.black)),
                            onPressed: () {
                              setState(() {
                                currentDay = widget.openingtime![index].day!;
                                for (int i = 0;
                                    i < widget.isSelected.length;
                                    i++) {
                                  if (i == index) {
                                    widget.isSelected[i] = true;
                                  } else {
                                    widget.isSelected[i] = false;
                                  }
                                }
                              });
                            }),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          heightSpace(context.height * 0.02),
          TimeField(title: "from".tr(), selectedTime: fromSelectedTime),
          TimeField(title: "to".tr(), selectedTime: toSelectedTime),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.height *0.01, horizontal: context.width * 0.12),
            child: Row(
              children: [
                mediumTitle("closed".tr(), Colors.black, false),
                widthSpace(context.width * 0.15),
                Checkbox(
                  activeColor: ColorManager.primaryColor,
                  checkColor: ColorManager.primaryColor100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                      side: BorderSide(color: ColorManager.primaryColor100, width: 2)
                  ),
                  side: BorderSide(color: ColorManager.primaryColor100, width: 2),
                  value: isClose,
                  onChanged: (value) {
                    setState(() {
                      isClose = !isClose;
                    });
                  },
                ),
              ],
            ),
          ),
          heightSpace(context.height * 0.05),
          const Spacer(),
          Center(child: AppButton(title: "save".tr(), onTap: () {})),
          heightSpace(context.height * 0.02)
        ],
      ),
    );
  }
}