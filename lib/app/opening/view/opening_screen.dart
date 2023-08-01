import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/profile/model/salon_model.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';
import '../widgets/time_field.dart';

class OpeningTimeScreen extends StatefulWidget {
  List<OpeningTime> openingtime;

  OpeningTimeScreen({super.key, required this.openingtime});

  // Map<String, List<String>> openingTime = {
  //   "Sat".tr() : ["01:00 a.m", "10:00 p.m"],
  //   "Sun".tr() : ["02:00 a.m", "10:00 p.m"],
  //   "Mon".tr() : ["03:00 a.m", "10:00 p.m"],
  //   "Tue".tr() : ["04:00 a.m", "10:00 p.m"],
  //   "Wed".tr() : ["05:00 a.m", "10:00 p.m"],
  //   "Thu".tr() : ["06:00 a.m", "10:00 p.m"],
  //   "Fri".tr() : ["07:00 a.m", "10:00 p.m"],
  // };

  List<bool> isSelected = [true, false, false, false, false, false, false];

  @override
  State<OpeningTimeScreen> createState() => _OpeningTimeScreenState();
}

class _OpeningTimeScreenState extends State<OpeningTimeScreen> {
  TextEditingController fromTimeCtrl = TextEditingController();
  TextEditingController toTimeCtrl = TextEditingController();
  String ?currentDay;
@override
  void initState() {
  currentDay= widget.openingtime[0].day.toString();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // print(widget.openingtime)
    return Scaffold(
      appBar: AppBar(title: const Text('Opening Time')),
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
                            child: Text(widget.openingtime![index].day!,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TimeField(
                  title: "from".tr(),
                  timeCtrl: fromTimeCtrl,
                  hintText: (widget.openingtime!
                          .where((element) => element.day == currentDay)
                          .toList())[0]
                      .open
                      .toString()),
              TimeField(
                  title: "to".tr(),
                  timeCtrl: toTimeCtrl,
                  hintText: (widget.openingtime!
                          .where((element) => element.day == currentDay)
                          .toList())[0]
                      .close
                      .toString()),
            ],
          ),
          heightSpace(context.height * 0.05),
          Center(child: AppButton(title: "save".tr(), onTap: () {}))
        ],
      ),
    );
  }
}
