import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/add_staff/widgets/specialize_radio.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/on_tap/on_tap.dart';
import '../../../utils/common_widgets/app_button.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';
import '../../../utils/spaces.dart';
import '../widgets/staff_field.dart';

class AddStaff extends StatefulWidget {
  const AddStaff({Key? key}) : super(key: key);

  @override
  State<AddStaff> createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  List specialize = [];
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController specializeCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('staff'.tr().toUpperCase())),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(context.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace(context.height * 0.04),
                SizedBox(
                  height: context. height *0.1,
                  child: ListTile(
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Image.asset("assets/images/profile.png", height: context.height * 0.1,),
                              Image.asset("assets/images/plus.png", height: context.height * 0.025,).onTap((){})
                            ]
                        ),
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
                              StaffField(hintText: "name", fieldCtrl: nameCtrl, width: 0.5),
                              Image.asset("assets/images/5_stars.png", width: context.width * 0.112,),
                              StaffField(hintText: "specialization", fieldCtrl: nameCtrl, width: 0.5),                        ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: context.width * 0.04, top: context.height * 0.04),
                  child: mediumTitle("selectSpecialization".tr(), ColorManager.darkBrownColor, false),
                ),
                SpecializationRad(
                  value: "Massage",
                  groupValue: specialize,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                SpecializationRad(
                  value: "Facials Female",
                  groupValue: specialize,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                SpecializationRad(
                  value: "Body Treatment",
                  groupValue: specialize,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                heightSpace(context.height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(title: "cancel".tr(), onTap: (){}),
                        widthSpace(context.width * 0.1),
                        AppButton(title: "done".tr(), onTap: (){}),
                      ],
                    )
                  ],
                )

              ],
            ),
          ),
        ],
      )
    );
  }
}