import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salonat/app/add_staff/cubit/add_staff_cubit.dart';
import 'package:salonat/app/add_staff/view/add_staff_screen.dart';
import 'package:salonat/app/staff/cubit/staff_cubit.dart';
import 'package:salonat/app/staff/widgets/staff_tile.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/common_widgets/loading_indecator.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/spaces.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  late StaffCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<StaffCubit>(context);
    cubit.getStaff();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('staff'.tr().toUpperCase())),
      body: BlocBuilder<StaffCubit, StaffState>(
        builder: (context, state) {
          if (state is Loading) {
            return centerIndicator();
          } else {
            return Padding(
              padding: EdgeInsets.all(context.width * 0.02),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: cubit.staff.length,
                        itemBuilder: (context, index) {
                          return StaffTile(
                            name: cubit.staff[index].name!,
                            rate: "assets/images/5_stars.png",
                            specialization: "Massage",
                          );
                        },
                      ),
                    ),
                  ),
                  AppButton(
                    title: "addStaff".tr(),
                    onTap: () {
                      context.push(
                        BlocProvider<AddStaffCubit>(
                          create: (context) => AddStaffCubit(),
                          child: const AddStaff(),
                        ),
                      );
                    },
                  ),
                  heightSpace(context.height * 0.05),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
