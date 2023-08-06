import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/add_staff/cubit/add_staff_cubit.dart';
import 'package:salonat/utils/common_widgets/loading_indecator.dart';
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
  late AddStaffCubit cubit;
@override
  void initState() {
  cubit = BlocProvider.of<AddStaffCubit>(context);
  cubit.getSubServices();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<AddStaffCubit,AddStaffState>(
        builder: (context, state) {
          if(state is LoadingSubServices) {
          return centerIndicator();
          }
          else{
            return Scaffold(
                appBar: AppBar(title: Text('staff'.tr().toUpperCase())),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.03,
                                vertical: context.height * 0.005),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                heightSpace(context.height * 0.04),
                                SizedBox(
                                  height: context.height * 0.1,
                                  child: ListTile(
                                    subtitle: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Image.asset(
                                                "assets/images/profile.png",
                                                height: context.height * 0.1,),
                                              Image.asset(
                                                "assets/images/plus.png",
                                                height: context.height * 0.025,)
                                                  .onTap(() {})
                                            ]
                                        ),
                                        widthSpace(context.width * 0.07),
                                        mediumBody("name".tr(),
                                            ColorManager.darkBrownColor, false),
                                        widthSpace(context.width * 0.1),
                                        StaffField(hintText: "name",
                                            fieldCtrl: cubit.nameCtrl,
                                            width: 0.5),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: context.width * 0.04,
                                      top: context.height * 0.04),
                                  child: mediumTitle("selectSupService".tr(),
                                      ColorManager.darkBrownColor, true),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: context.width *0.1, vertical: context.height * 0.01),
                                  child: ListView.builder(
                                    itemCount: cubit.subServices.length,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Checkbox(
                                            activeColor: ColorManager.primaryColor,
                                            checkColor: ColorManager.primaryColor100,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(2),
                                              side: BorderSide(color: ColorManager.primaryColor100, width: 2)
                                            ),
                                            side: BorderSide(color: ColorManager.primaryColor100, width: 2),
                                            value: cubit.subServices[index]
                                                .isSelected,
                                            onChanged: (value) {
                                              cubit.subServices[index].isSelected =
                                                  value!;
                                              cubit.selectSubServices(
                                                  cubit.subServices[index]);
                                            },
                                          ),
                                          mediumBody(cubit.subServices[index].titleen, ColorManager.greyColor200, false)
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightSpace(context.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppButton(title: "cancel".tr(), onTap: () {}),
                            widthSpace(context.width * 0.1),
                            AppButton(title: "done".tr(), onTap: () {}),
                          ],
                        )
                      ],
                    ),
                    heightSpace(context.height * 0.03),
                  ],
                )
            );
          }
        },

    );
  }
}