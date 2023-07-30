import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salonat/app/services/widgets/service_text-field.dart';
import 'package:salonat/utils/extensions/media_query/media_query.dart';
import '../../../utils/common_widgets/app_button.dart';
import '../../../utils/spaces.dart';

class ServiceBottomSheet extends StatelessWidget {

  TextEditingController serviceNameCtrl = TextEditingController();
  TextEditingController serviceDurationCtrl = TextEditingController();
  TextEditingController serviceDescriptionCtrl = TextEditingController();
  TextEditingController serviceSalaryCtrl = TextEditingController();

  ServiceBottomSheet({
    required this.serviceNameCtrl,
    required this.serviceDurationCtrl,
    required this.serviceDescriptionCtrl,
    required this.serviceSalaryCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace(context.height * 0.06),
          Row(
            children: [
              ServiceTextField(hintText: "Service name", fieldCtrl: serviceNameCtrl, maxLines: 1, width: 0.6),
              widthSpace(context.width * 0.01),
              ServiceTextField(hintText: "SAR 000", fieldCtrl: serviceSalaryCtrl, maxLines: 1, width: 0.29),
            ],
          ),
          heightSpace(context.height * 0.01),
          ServiceTextField(hintText: "Service duration", fieldCtrl: serviceDurationCtrl, maxLines: 1, width: 0.6),
          heightSpace(context.height * 0.01),
          ServiceTextField(hintText: "Service description", fieldCtrl: serviceDescriptionCtrl, maxLines: 5, width: 1),
          heightSpace(context.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(title: "cancel".tr(), onTap: (){}),
              widthSpace(context.width * 0.1),
              AppButton(title: "done".tr(), onTap: (){}),
            ],
          )
        ],
      ),
    );
  }
}