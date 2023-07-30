import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/offer_details/view/offer_details_view.dart';
import 'package:salonat/app/add_staff/add_staff_screen.dart';
import 'package:salonat/app/staff/widgets/staff_tile.dart';
import 'package:salonat/utils/common_widgets/app_button.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import 'package:salonat/utils/spaces.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('staff'.tr().toUpperCase())),
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.02),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return StaffTile(
                      name: "Exaple",
                      rate: "assets/images/5_stars.png",
                      specialization: "Massage",
                    );
                  },
                ),
              ),
            ),
            AppButton(
              title: "addStaff".tr(),
              onTap: (){
                context.push(const AddStaff());
              },
            ),
            heightSpace(context.height * 0.05),
          ],
        ),
      ),
    );
  }
}
