import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/common_widgets/warning_alert.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';
import '../../../utils/spaces.dart';

class StaffTile extends StatelessWidget {
  String name;
  String rate;
  String specialization;
  StaffTile({super.key, required this.name, required this.rate, required this.specialization});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context. height *0.1,
          child: ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return WarningAlert(
                              title: "removeStaff".tr(),
                              supTitle: "warningMember".tr(),
                              action: (){}
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.close, size: context.width * 0.04,)
                  )
                ]
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/profile.png", height: context.height * 0.1,),
                widthSpace(context.width * 0.07),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mediumBody("name".tr(), ColorManager.darkBrownColor, false),
                      mediumBody("rate".tr(), ColorManager.darkBrownColor, false),
                      mediumBody("specialization".tr(), ColorManager.darkBrownColor, false),
                    ],
                  ),
                ),
                widthSpace(context.width * 0.1),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mediumBody(name, ColorManager.darkBrownColor, true),
                      Image.asset(rate, width: context.width * 0.112,),
                      mediumBody(specialization, ColorManager.darkBrownColor, false)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        heightSpace(context.height * 0.06)
      ],
    );
  }
}
