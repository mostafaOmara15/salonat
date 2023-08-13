import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/opening/cubit/opening_time_cubit.dart';
import 'package:salonat/app/opening/cubit/opening_time_states.dart';
import 'package:salonat/app/profile/model/salon_model.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/spaces.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/theme/colors/color_manager.dart';
import '../widgets/time_field.dart';

class OpeningTimeView extends StatefulWidget {
  List<OpeningTime>? openingTimesList;

  OpeningTimeView({super.key, required this.openingTimesList});

  @override
  State<OpeningTimeView> createState() => _OpeningTimeViewState();
}

class _OpeningTimeViewState extends State<OpeningTimeView> {
  late OpeningTimeCubit openingTimeCubit;

  @override
  void initState() {
    super.initState();
    openingTimeCubit = OpeningTimeCubit.get(context);
    openingTimeCubit.times = widget.openingTimesList;
    openingTimeCubit.currentDay = widget.openingTimesList?[0].day.toString();
    openingTimeCubit.isClose = widget.openingTimesList![0].isClosed!;
    openingTimeCubit.timeFrom.text = widget.openingTimesList![0].open!;
    openingTimeCubit.timeTo.text = widget.openingTimesList![0].close!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OpeningTimeCubit, OpeningTimeStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
                        itemCount: widget.openingTimesList!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
                            child: TextButton(
                                child: Text(widget.openingTimesList![index].day!.tr(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: openingTimeCubit.isSelected[index] ? Colors.grey: Colors.black
                                    )
                                ),
                                onPressed: () {
                                  openingTimeCubit.changeTheDay(index);
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
                timeController: openingTimeCubit.timeFrom,
                onTap: () {},
              ),
              TimeField(
                title: "to".tr(),
                timeController: openingTimeCubit.timeTo,
                onTap: () {},
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
                      value:  openingTimeCubit.times?[openingTimeCubit.currentIndex].isClosed,
                      onChanged: (value) {openingTimeCubit.checkClose(value!);},
                    ),
                  ],
                ),
              ),
              heightSpace(context.height * 0.05),
              const Spacer(),
              Center(
                  child: AppButton(title: "save".tr(),
                    onTap: (){
                        openingTimeCubit.updateOpeningTime();
                      }
                  )
              ),
              heightSpace(context.height * 0.02)
            ],
          ),
        );
      },
    );
  }
}