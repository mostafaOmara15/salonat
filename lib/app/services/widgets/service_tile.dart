import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/edit_service/view/edit_service_screen.dart';
import 'package:salonat/utils/common_widgets/sup_button.dart';
import 'package:salonat/utils/common_widgets/warning_alert.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import 'package:salonat/utils/extensions/navigation/navigation.dart';
import '../../../utils/common_widgets/dialog_button.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class ServiceTile extends StatelessWidget {

  String serviceTitle;
  String price;
  String duration;
  String details;

  ServiceTile({super.key, required this.serviceTitle, required this.price, required this.duration, required this.details});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            smallTitle(serviceTitle, ColorManager.blackColor, false),
            IconButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return WarningAlert(
                          title: "${"remove".tr()} ( Nirvana Anti Aging 90 )",
                          supTitle: "warningService".tr(),
                          action: (){}
                      );
                    },
                  );
                },
                icon: Icon(Icons.close, size: context.width * 0.04,)
            )
          ],
        ),
        subtitle: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                mediumBody(duration, ColorManager.subTextColor, false),
                smallTitle(price, ColorManager.blackColor, false),
              ],
            ),
            mediumBody(
              details,
              ColorManager.subTextColor,
              false
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SupButton(height: context.height * 0.03, title: "edit".tr(), onTap: (){context.push(EditServiceScreen());}),
              ],
            )
          ],
        ),

      ),
    );
  }
}
