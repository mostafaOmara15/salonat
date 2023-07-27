import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/edit_service/view/edit_service_screen.dart';
import 'package:salonat/utils/common_widgets/sup_button.dart';
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
                      return AlertDialog(
                        backgroundColor: ColorManager.whiteColor,
                        elevation: 0,
                        insetPadding: EdgeInsets.only(bottom: context.height * 0.35),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
                        titlePadding:  EdgeInsets.all(context.width * 0.05),
                        actionsPadding: const EdgeInsets.all(0),
                        title: SizedBox(
                          height: 20,
                          width: 100,
                          child: Center(child: smallTitle("${"remove".tr()} ( Nirvana Anti Aging 90 )".tr(), ColorManager.blackColor, false)),
                        ),
                        // Center(child: Text("${"remove".tr()} ( Nirvana Anti Aging 90 )", style: TextStyle(fontSize: 16), textAlign: TextAlign.center,)),
                        content: Container(
                          height: context.height * 0.06,
                          width: context.width * 0.7,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(child: mediumBody("warningService".tr(), ColorManager.buttonColor,true)),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          Column(
                            children: [
                              const Divider(thickness: 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AlertButton(title: "cancel".tr()),
                                  AlertButton(title: "delete".tr()),
                                ],
                              ),
                            ],
                          ),
                        ],
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
