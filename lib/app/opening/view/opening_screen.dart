import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/profile/model/salon_model.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../services/locator.dart';
import '../../../services/shared_pref.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/strings/const_strings.dart';
import '../../../utils/theme/colors/color_manager.dart';
import '../widgets/time_field.dart';

class OpeningTimeView extends StatefulWidget {
  List<OpeningTime>? openingTime;

  OpeningTimeView({super.key, required this.openingTime});

  List<bool> isSelected = [true, false, false, false, false, false, false];

  @override
  State<OpeningTimeView> createState() => _OpeningTimeViewState();
}

class _OpeningTimeViewState extends State<OpeningTimeView> {
  var prefs = locator<SharedPrefServices>();
  String? currentDay;
  int currentIndex = 0;
  List<OpeningTime>? updatedTime;
  TextEditingController timeFrom = TextEditingController();
  TextEditingController timeTo = TextEditingController();
  bool timeUpdated = false;
  bool isClose = false;

@override
  void initState() {
    super.initState();
    currentDay = widget.openingTime?[0].day.toString();
    updatedTime =  widget.openingTime;
    timeFrom.text = widget.openingTime![0].open!;
    timeTo.text = widget.openingTime![0].close!;
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
                    itemCount: widget.openingTime!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
                        child: TextButton(
                          child: Text(widget.openingTime![index].day!.tr(),
                            style: TextStyle(
                              fontSize: 20,
                              color: widget.isSelected[index] ? Colors.grey: Colors.black
                            )
                          ),
                          onPressed: () {
                            setState(() {
                              updatedTime?[currentIndex].open = timeFrom.text;
                              updatedTime?[currentIndex].close = timeTo.text;
                                currentDay = widget.openingTime![index].day!;
                                currentIndex = index;
                                timeFrom.text = updatedTime![index].open!;
                                timeTo.text = updatedTime![index].close!;
                                for (int i = 0; i < widget.isSelected.length; i++) {
                                  if (i == index) {
                                    widget.isSelected[i] = true;
                                  } else {
                                    widget.isSelected[i] = false;
                                  }
                                }
                            });
                          }
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          heightSpace(context.height * 0.02),
          TimeField(
              title: "from".tr(),
              timeController: timeFrom,
              onTap: () {
              },
          ),
          TimeField(
              title: "to".tr(),
              timeController: timeTo,
              onTap: () {
              },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.height *0.01, horizontal: context.width * 0.12),
            child: Row(
              children: [
                mediumTitle("closed".tr(), Colors.black, false),
                widthSpace(context.width * 0.155),
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
          Center(
            child: AppButton(title: "save".tr(),
              onTap: () async {
                updatedTime?[currentIndex].open = timeFrom.text;
                updatedTime?[currentIndex].close = timeTo.text;
              List<Map<String, dynamic>> newTime = [];
              for(int i = 0 ; i <= updatedTime!.length - 1; i++){
                // updatedTime![i] = updatedTime![i].toJson();
                newTime.add(updatedTime![i].toJson());
              }
              print(newTime);
                String salId = await prefs.getString(salonId);
                await FirebaseFirestore.instance
                    .collection("salons")
                    .doc(salId)
                    .set({"opening-time" : newTime}, SetOptions(merge: true));
              }
            )
          ),
          heightSpace(context.height * 0.02)
        ],
      ),
    );
  }
}