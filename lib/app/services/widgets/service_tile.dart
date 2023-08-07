import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/utils/common_widgets/sup_button.dart';
import 'package:salonat/utils/common_widgets/warning_alert.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/texts.dart';
import '../../../utils/extensions/theme/colors/color_manager.dart';

class ServiceTile extends StatelessWidget {

  String serviceTitle;
  String price;
  String duration;
  String details;
  dynamic Function() onTapEdit;
  dynamic Function()  onTapDelete;


  ServiceTile({super.key, required this.serviceTitle, required this.price, required this.duration, required this.details,required this.onTapEdit,required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: context.width *0.06),
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
                          title: "${"remove".tr()} $serviceTitle",
                          supTitle: "warningService".tr(),
                          action: onTapDelete
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
                SupButton(height: context.height * 0.03, title: "edit".tr(), onTap: onTapEdit),
              ],
            )
          ],
        ),

      ),
    );
  }
}
